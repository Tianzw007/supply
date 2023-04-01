package co.yixiang.shop.domain;

import co.yixiang.common.annotation.Excel;

public class StoreOrderGoodsIn extends StoreOrderGoods{

    /** 购买数量  旧*/
    private Integer oldGoodsNum;

    /** 本店价(供货价)  旧*/
    private Double oldGoodsPrice;

    public void setOldGoodsNum(Integer oldGoodsNum)
    {
        this.oldGoodsNum = oldGoodsNum;
    }

    public Integer getOldGoodsNum()
    {
        return oldGoodsNum;
    }

    public void setOldGoodsPrice(Double oldGoodsPrice)
    {
        this.oldGoodsPrice = oldGoodsPrice;
    }

    public Double getOldGoodsPrice()
    {
        return oldGoodsPrice;
    }


}
