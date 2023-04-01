package co.yixiang.web.controller.shop;

import co.yixiang.common.annotation.Log;
import co.yixiang.common.core.controller.BaseController;
import co.yixiang.common.core.domain.AjaxResult;
import co.yixiang.common.core.page.TableDataInfo;
import co.yixiang.common.enums.BusinessType;
import co.yixiang.common.utils.poi.ExcelUtil;
import co.yixiang.shop.domain.StoreOrder;
import co.yixiang.shop.domain.StoreOrderGoods;
import co.yixiang.shop.domain.StoreOrderGoodsIn;
import co.yixiang.shop.service.IStoreOrderGoodsService;
import co.yixiang.shop.service.IStoreOrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 订单主Controller
 * 
 * @author hupeng
 * @date 2019-08-29
 */
@Controller
@RequestMapping("/shop/orderGoods")
public class StoreOrderGoodsController extends BaseController
{

    @Autowired
    private IStoreOrderService storeOrderService;

    @Autowired
    private IStoreOrderGoodsService storeOrderGoodsService;

    /**
     * 保存订单修改
     */
    @RequiresPermissions("shop:orderGoods:saveOrderGoods")
    @PostMapping("/saveOrderGoods")
    @ResponseBody
    public AjaxResult saveOrderGoods(@RequestBody StoreOrderGoodsIn storeOrderGoodsIn)
    {
        //更新订单总价格
        StoreOrder storeOrder = storeOrderService.selectStoreOrderById(storeOrderGoodsIn.getOrderId());
        //计算差价
        Double totalGoodsPrice = storeOrderGoodsIn.getGoodsPrice()*storeOrderGoodsIn.getGoodsNum() - storeOrderGoodsIn.getOldGoodsPrice()*storeOrderGoodsIn.getOldGoodsNum();
        //更新订单单个价格
        return toAjax(storeOrderGoodsService.updateStoreOrderGoods(storeOrderGoodsIn)*changePrice(storeOrder, totalGoodsPrice));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("shop:orderGoods:delOrderGoods")
    @PostMapping( "/delOrderGoods")
    @ResponseBody
    public AjaxResult delOrderGoods(@RequestBody StoreOrderGoodsIn storeOrderGoodsIn)
    {
        StoreOrderGoods storeOrderGoods = storeOrderGoodsService.selectStoreOrderGoodsById(storeOrderGoodsIn.getRecId());
        //更新订单总价格
        StoreOrder storeOrder = storeOrderService.selectStoreOrderById(storeOrderGoodsIn.getOrderId());
        //计算差价
        Double totalGoodsPrice = 0-storeOrderGoods.getGoodsPrice()*storeOrderGoods.getGoodsNum();
        return toAjax(storeOrderGoodsService.deleteStoreOrderGoodsById(storeOrderGoodsIn.getRecId())*changePrice(storeOrder, totalGoodsPrice));
    }

    private int changePrice(StoreOrder storeOrder, Double totalGoodsPrice) {
        Double goodsPrice = storeOrder.getGoodsPrice();
        Double totalAmount = storeOrder.getTotalAmount();
        Double orderAmount = storeOrder.getOrderAmount();
        storeOrder.setGoodsPrice(goodsPrice+totalGoodsPrice);
        storeOrder.setTotalAmount(totalAmount+totalGoodsPrice);
        storeOrder.setOrderAmount(orderAmount+totalGoodsPrice);
        return storeOrderService.updateStoreOrder(storeOrder);
    }
}
