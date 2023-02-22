package co.yixiang.mobile.controller;

import co.yixiang.common.annotation.Log;
import co.yixiang.common.config.RuoYiConfig;
import co.yixiang.common.constant.UserConstants;
import co.yixiang.common.core.domain.AjaxResult;
import co.yixiang.common.core.domain.entity.SysMenu;
import co.yixiang.common.core.domain.entity.SysUser;
import co.yixiang.common.enums.BusinessType;
import co.yixiang.common.utils.ShiroUtils;
import co.yixiang.common.utils.StringUtils;
import co.yixiang.common.utils.uuid.IdUtils;
import co.yixiang.mobile.constant.Constants;
import co.yixiang.mobile.model.LoginBody;
import co.yixiang.mobile.redis.RedisCache;
import co.yixiang.mobile.service.SysPermissionService;
import co.yixiang.mobile.utils.sign.Base64;
import co.yixiang.system.service.ISysConfigService;
import co.yixiang.system.service.ISysMenuService;
import co.yixiang.system.service.ISysUserService;
import com.google.code.kaptcha.Producer;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static co.yixiang.common.core.domain.AjaxResult.error;
import static co.yixiang.common.core.domain.AjaxResult.success;

@RestController
@RequestMapping("/mobile")
public class MobileController {

    /**
     * 验证码有效期（分钟）
     */
    public static final Integer CAPTCHA_EXPIRATION = 2;

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY = "captcha_codes:";

    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private ISysUserService userService;


    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode(HttpServletResponse response) throws IOException
    {
        AjaxResult ajax = success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        // 生成验证码
        String captchaType = RuoYiConfig.getCaptchaType();
        if ("math".equals(captchaType))
        {
            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            image = captchaProducerMath.createImage(capStr);
        }
        else if ("char".equals(captchaType))
        {
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }

        redisCache.setCacheObject(verifyKey, code, CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(loginBody.getUsername(), loginBody.getPassword(), true);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            AjaxResult success = success();
            success.put(Constants.TOKEN, token);
            return success;
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public AjaxResult getInfo()
    {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 个人信息
     */
    @GetMapping("/user/profile")
    public AjaxResult profile(ModelMap mmap)
    {
        SysUser user = ShiroUtils.getSysUser();
        AjaxResult ajax = AjaxResult.success(user);
        ajax.put("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        ajax.put("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return ajax;
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping("/user/profile")
    public AjaxResult updateProfile(@RequestBody SysUser user)
    {
        SysUser sysUser = ShiroUtils.getSysUser();
        user.setUserName(sysUser.getUserName());
        if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setUserId(sysUser.getUserId());
        user.setPassword(null);
        user.setAvatar(null);
        user.setDeptId(null);
        user.setUpdateBy(ShiroUtils.getLoginName());
        if(userService.updateUser(user)>0){
            // 更新缓存用户信息
            sysUser.setPhonenumber(user.getPhonenumber());
            sysUser.setEmail(user.getEmail());
            sysUser.setSex(user.getSex());
            ShiroUtils.setSysUser(sysUser);
            return success();
        }
        return error();
    }

}
