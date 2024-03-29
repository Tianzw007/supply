/**
 * Copyright (C) 2018-2021
 * All rights reserved, Designed By www.yixiang.co
 * 注意：本软件为www.yixiang.co开发研制
 */
package co.yixiang.app.modular.member.controller;


import co.yixiang.app.common.R;
import co.yixiang.app.common.persistence.model.StoreMember;
import co.yixiang.app.modular.member.service.IMemberService;
import co.yixiang.app.modular.member.service.dto.MemberDTO;
import co.yixiang.app.modular.member.service.impl.AddressServiceImpl;
import co.yixiang.app.modular.member.service.mapper.MemberMapper;
import co.yixiang.app.modular.member.service.vo.AddressVO;
import co.yixiang.app.modular.shop.service.impl.GoodsServiceImpl;
import co.yixiang.app.modular.shop.service.impl.OrderServiceImpl;
import co.yixiang.app.modular.shop.service.mapper.GoodsMapper;
import co.yixiang.app.modular.shop.service.vo.PageVO;
import com.alibaba.fastjson.JSON;
import com.baomidou.shaun.core.annotation.HasRole;
import com.baomidou.shaun.core.context.ProfileHolder;
import com.baomidou.shaun.core.profile.TokenProfile;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * @ClassName 个人中心
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/6/27
 **/

@HasRole("user_role")
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "个人中心", tags = "个人中心模块", description = "个人中心")
public class UserController {
    private final IMemberService memberService;
    private final MemberMapper memberMapper;
    private final AddressServiceImpl addressService;
    private final GoodsServiceImpl goodsService;
    private final GoodsMapper goodsMapper;
    private final OrderServiceImpl orderService;

    @GetMapping(value = "/shop/user-my-info")
    @ApiOperation(value = "我的个人信息",notes = "我的个人信息")
    public R userInfo(){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        StoreMember member = memberService.getById(userId);
        MemberDTO memberDTO = memberMapper.toDto(member);
        Map<String,Integer> mapCount = orderService.countInfo(userId);
        memberDTO.setCountInfo(mapCount);
        return R.success(memberDTO);
    }

    @GetMapping(value = "/shop/user-my-address")
    @ApiOperation(value = "我的地址列表",notes = "我的地址列表")
    public R addressList(@RequestParam(value = "page",defaultValue = "0") int page,
                         @RequestParam(value = "limit",defaultValue = "10") int limit){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        PageVO pageVO = new PageVO();
        pageVO.setPage(page);
        pageVO.setLimit(limit);
        return R.success(addressService.getList(pageVO,userId));
    }

    @PostMapping(value = "/shop/user-address-add-edit")
    @ApiOperation(value = "添加或修改地址",notes = "添加或修改地址")
    public R addAndEditAdress(@Validated @RequestBody AddressVO addressVO){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        boolean result = addressService.addAndEdit(addressVO,userId);
        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }
    }

    @PostMapping(value = "/shop/user-address-del")
    @ApiOperation(value = "删除地址",notes = "删除地址")
    public R delAddress(@Validated @RequestBody String jsonStr){
        int addressId = Integer.valueOf(JSON.parseObject(jsonStr).get("address_id").toString());
        boolean result = addressService.removeById(addressId);
        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }
    }


    @GetMapping(value = "/shop/user-my-coupons")
    @ApiOperation(value = "我的优惠券",notes = "我的优惠券")
    public R myCoupons(@RequestParam(value = "orderTotalPrice",defaultValue = "0") double orderTotalPrice){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        return R.success(memberService.couponList(userId,orderTotalPrice));
    }

    @GetMapping(value = "/shop/user-my-collects")
    @ApiOperation(value = "我的收藏列表",notes = "我的收藏列表")
    public R myCollect(@RequestParam(value = "page",defaultValue = "0") int page,
                       @RequestParam(value = "limit",defaultValue = "10") int limit){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        PageVO pageVO = new PageVO();
        pageVO.setPage(page);
        pageVO.setLimit(limit);
        return R.success(goodsMapper.toDto(goodsService
                .collectGoods(pageVO.getPage(),pageVO.getLimit(),userId)));
    }

    @GetMapping(value = "/shop/user-order-list")
    @ApiOperation(value = "订单列表",notes = "订单列表")
    public R orderList(@RequestParam(value = "status",defaultValue = "0") int status,
                       @RequestParam(value = "page",defaultValue = "1") int page,
                       @RequestParam(value = "page_num",defaultValue = "10") int limit){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        return R.success(orderService.orderList(status,userId,page,limit));
    }

    @GetMapping(value = "/shop/user-order-detail")
    @ApiOperation(value = "订单详情",notes = "订单详情")
    public R orderDetail(@RequestParam(value = "order_id",defaultValue = "0") String orderId){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        return R.success(orderService.orderDetail(orderId,userId));
    }

    @PostMapping(value = "/shop/user-order-handle")
    @ApiOperation(value = "订单操作",notes = "订单操作")
    public R handleOrder(@Validated @RequestBody String jsonStr){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        int orderId = Integer.valueOf(JSON.parseObject(jsonStr).get("order_id").toString());
        int type = Integer.valueOf(JSON.parseObject(jsonStr).get("type").toString());
        orderService.orderHandle(orderId,type,userId);
        return R.success("操作成功");
    }


    @GetMapping(value = "/shop/user-points-money-logs")
    @ApiOperation(value = "获取积分或者余额流水",notes = "获取积分或者余额流水")
    public R pointsMoneyLogs(@RequestParam(value = "type",defaultValue = "1") int type,
                             @RequestParam(value = "page",defaultValue = "1") int page,
                             @RequestParam(value = "limit",defaultValue = "10") int limit){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        return R.success(orderService.pointsMoneyLogs(type,userId,page,limit));

    }






    /**
    @GetMapping(value = "/super")
    @PreAuthorize("hasAllRoles('user','admin')")
    @ApiOperation(value = "超管测试信息",notes = "超管测试信息")
    public R superInfo(){
        return R.success("超级管理员才可以访问的权限");
    }
    **/
}
