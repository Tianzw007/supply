/**
 * Copyright (C) 2018-2021
 * All rights reserved, Designed By www.yixiang.co
 * 注意：本软件为www.yixiang.co开发研制
 */
package co.yixiang.app.modular.shop.controller;

import cn.hutool.core.util.StrUtil;
import co.yixiang.app.common.persistence.model.StoreSpecGoodsPrice;
import co.yixiang.app.modular.shop.service.ICateService;
import co.yixiang.app.modular.shop.service.IGoodsService;
import co.yixiang.app.modular.shop.service.IOrderService;
import co.yixiang.app.modular.shop.service.dto.CateDTO;
import co.yixiang.app.modular.shop.service.dto.GoodsDTO;
import co.yixiang.app.modular.shop.service.dto.SpecItemDTO;
import co.yixiang.app.modular.shop.service.vo.CartVO;
import co.yixiang.app.modular.shop.service.vo.CollectVO;
import co.yixiang.app.modular.shop.service.vo.OrderVo;
import co.yixiang.app.modular.shop.service.vo.PageVO;
import co.yixiang.app.common.R;
import co.yixiang.app.common.persistence.model.StoreSpecGoodsPrice;
import co.yixiang.app.modular.shop.service.ICateService;
import co.yixiang.app.modular.shop.service.IGoodsService;
import co.yixiang.app.modular.shop.service.IOrderService;
import co.yixiang.app.modular.shop.service.dto.CateDTO;
import co.yixiang.app.modular.shop.service.dto.GoodsDTO;
import co.yixiang.app.modular.shop.service.dto.SpecItemDTO;
import co.yixiang.app.modular.shop.service.mapper.GoodsMapper;
import co.yixiang.app.modular.shop.service.vo.CartVO;
import co.yixiang.app.modular.shop.service.vo.CollectVO;
import co.yixiang.app.modular.shop.service.vo.OrderVo;
import co.yixiang.app.modular.shop.service.vo.PageVO;
import com.baomidou.shaun.core.annotation.HasRole;
import com.baomidou.shaun.core.context.ProfileHolder;
import com.baomidou.shaun.core.profile.TokenProfile;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName MallController
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/9/8
 **/

@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "商城模块", tags = "商城模块", description = "商城模块")
public class MallController {
    private final ICateService cateService;
    private final IGoodsService goodsService;
    private final GoodsMapper goodsMapper;
    private final IOrderService orderervice;

    @GetMapping("/shop/mall-lists")
    @ApiOperation(value = "商品分类模块列表",notes = "商品分类模块列表")
    public R lists(@RequestParam(value = "page",defaultValue = "0") int page,
                   @RequestParam(value = "limit",defaultValue = "10") int limit){
        //int userId = userOperator.getUser().getId();
        int userId = 0;
        List<CateDTO> goodsCates = cateService.getList();
        List<GoodsDTO> recommedGoods = goodsService.getList(0,
                page,limit,userId,"",1);
        List<GoodsDTO> newGoods = goodsService.getList(0,page,limit,userId,"",2);

        List<GoodsDTO> collectGoods = goodsMapper.toDto(goodsService.collectGoods(page,limit,userId));

        Map<String,Object> map = new HashMap<>();
        map.put("goodsCates",goodsCates);
        map.put("recommedGoods",recommedGoods);
        map.put("newGoods",newGoods);
        map.put("collectGoods",collectGoods);
        return R.success(map);
    }

    @GetMapping("/shop/mall-goods-list")
    @ApiOperation(value = "获取商品列表",notes = "获取商品列表")
    public R goodsList(@RequestParam(value = "page",defaultValue = "0") int page,
                       @RequestParam(value = "page_num",defaultValue = "10") int limit,
                       @RequestParam(value = "cat_id",defaultValue = "0") int catId,
                       @RequestParam(value = "keywords",defaultValue = "") String keywords){

        int userId = 0;
        List<GoodsDTO> goods = goodsService.getList(catId,page,
                limit,userId,keywords,0);

        Map<String,Object> map = new HashMap<>();
        map.put("list",goods);
        return R.success(map);
    }

    @GetMapping("/shop/mall-goods-detail")
    @ApiOperation(value = "商品详情",notes = "商品详情")
    public R goodsDetail(@RequestParam(value = "goods_id",defaultValue = "0") int goodsId){
        int userId = 0;
        Map<String, StoreSpecGoodsPrice> specPrice = goodsService.goodsSpecPrice(goodsId);
        GoodsDTO goodsDetail = goodsMapper.toDto(goodsService.getById(goodsId));
        Map<String, List<SpecItemDTO>> specs = goodsService.goodsSpec(goodsId);

        boolean isCollect = goodsService.isCollect(goodsId,userId);

        Map<String,Object> map = new HashMap<>();
        map.put("detail",goodsDetail);
        map.put("spec_price",specPrice);
        map.put("specs",specs);
        map.put("isCollect",isCollect);
        return R.success(map);
    }

    @HasRole("user_role")
    @PostMapping("/shop/mall-add-collect")
    @ApiOperation(value = "添加商品收藏",notes = "添加商品收藏")
    public R addCollect(@Validated @RequestBody CollectVO collectVO){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        boolean result = goodsService.addOrCancelCollect(collectVO.getGoodsId(),userId,1);

        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }
    }

    @HasRole("user_role")
    @PostMapping("/shop/mall-cancel-collect")
    @ApiOperation(value = "取消商品收藏",notes = "取消商品收藏")
    public R cancelCollect(@Validated @RequestBody CollectVO collectVO){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());

        boolean result = goodsService.addOrCancelCollect(collectVO.getGoodsId(),userId,2);
        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }
    }

    @HasRole("user_role")
    @PostMapping("/shop/mall-add-cart")
    @ApiOperation(value = "添加购物车",notes = "添加购物车")
    public R addCart(@Validated @RequestBody CartVO cartVO){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());

        boolean result = goodsService.addCart(cartVO,userId);
        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }

    }

    @HasRole("user_role")
    @GetMapping("/shop/mall-cart-del")
    @ApiOperation(value = "删除购物车",notes = "删除购物车")
    public R delCart(@RequestParam(value = "goods_ids", defaultValue = "") String goodsIds){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        if(StrUtil.isEmpty(goodsIds)){
            return R.error(4000,"参数缺失");
        }
        boolean result = goodsService.delCart(goodsIds,userId);
        if(result){
            return R.success("操作成功");
        }else{
            return R.error(4000,"操作失败");
        }

    }

    @HasRole("user_role")
    @GetMapping("/shop/mall-cart-list")
    @ApiOperation(value = "获取购物车列表",notes = "获取购物车列表")
    public R cartList(@RequestParam(value = "page",defaultValue = "0") int page,
                      @RequestParam(value = "page_num",defaultValue = "10") int limit){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        PageVO pageVO = new PageVO();
        pageVO.setPage(page);
        pageVO.setLimit(limit);
        return R.success(goodsService.cartList(pageVO,userId));
    }

    @HasRole("user_role")
    @PostMapping("/shop/mall-order-submit")
    @ApiOperation(value = "提交订单",notes = "提交订单")
    public R submitOrder(@Validated @RequestBody OrderVo orderVo){
        TokenProfile profile = ProfileHolder.getProfile();
        int userId =  Integer.valueOf(profile.getId());
        String orderSn = "";
        if(Integer.valueOf(orderVo.getOrderFrom()) == 1){
            orderSn = orderervice.addOrderOfOne(orderVo,userId);
        }else{
            orderSn = orderervice.addOrderOfTwo(orderVo,userId);
        }

        HashMap<String,String> map = new HashMap<>();
        map.put("order_no",orderSn);
        return R.success(map);
    }


}
