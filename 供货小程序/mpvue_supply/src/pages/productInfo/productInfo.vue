<template>
  <div class="container product-info-container" v-if="data">
    <banner type="info"  :imgs="data.detail.goodsLogo"></banner>
    <div class="product-basic-info">
      <div class="product-basic-header">
        <div class="product-title">
          <div class="product-name">
            <p>{{data.detail.goodsName}}</p>
          </div>
          <div class="product-tags">
            <div class="product-tag">{{data.detail.keywords}}</div>
            <!--<div class="product-tag">{{data.detail.brand_name}}</div>-->
            <!--<div class="product-tag">{{data.detail.cate_name}}</div>-->
          </div>
        </div>
        <!-- <div class="shard">
          <img mode="widthFix" src="../../../static/images/icon-share.png" alt="">
          <span>分享</span>
        </div> -->
      </div>
      <div class="product-basic-body">
        <div class="product-price">
          <p>供货价：
            <span class="unit">￥</span>
            <span class="price">{{data.detail.shopPrice}}</span>
          </p>
          <p>建议零售价：{{data.detail.marketPrice}}</p>
        </div>
        <!--<div class="down-taotu">-->
          <!--<button @click="downloadImgs(data.detail.download_imgs)">下载套图</button>-->
        <!--</div>-->
      </div>
      <div class="product-basic-footer">
        <div class="product-basic-tag">销量:{{data.detail.salesSum}}</div>
      </div>
    </div>
    <div class="blank-spaces"></div>

    <div class="product-card">
      <div class="product-card-header">
        <div class="icon"></div>
        <p>规格参数</p>
      </div>
      <div class="product-card-body">
        <table class="product-info-table">
          <tr>
            <th>货号</th>
            <td>{{data.detail.goodsSn}}</td>
          </tr>
          <!--<tr>-->
            <!--<th>品牌</th>-->
            <!--<td>{{data.detail.brandName}}</td>-->
          <!--</tr>-->
          <!--<tr>-->
            <!--<th>工艺</th>-->
            <!--<td>-->
              <!--<span v-for="(item,index) in data.detail.goods_attrs" :key="index">-->
                <!--{{item.attr_value}},-->
              <!--</span>-->
            <!--</td>-->
          <!--</tr>-->
          <div v-for="(keys,value,index) in data.specs" :key="index">
            <tr>
              <th>{{value}}</th>
              <td>
                <span v-for="(type,itemIndex) in keys" :key="itemIndex">
                  {{type.item}},
                </span>
              </td>
            </tr>
          </div>
        </table>
      </div>
    </div>
    <div class="blank-spaces"></div>
    <div class="product-card">
      <div class="product-card-header">
        <div class="icon"></div>
        <p>宝贝详情</p>
      </div>
      <div class="product-card-body">
        <img mode="widthFix" :src="item" v-for="(item,index) in content" :key="index" alt="">
      </div>
    </div>
    <div class="blank-spaces"></div>
    <div class="nav-tab">
      <div class="nav-tab-warp">
        <div class="nav-tab-icons">
          <div class="icon">
            <img mode="widthFix" v-if="!data.isCollect" @click="getMallCollect" src="../../../static/images/icon-collection.png"
              alt="">
            <img mode="widthFix" v-if="data.isCollect" @click="cancelCollect" src="../../../static/images/icon-already-collected.png"
              alt="">
            <p>收藏</p>
          </div>
          <!-- <contact-button type="default-light" session-from="weapp" class="icon"> -->
          <div class="icon" @click="openShopSheet">
            <img mode="widthFix" src="../../../static/images/icon-customer-service.png" alt="">
            <p>客服</p>
          </div>
          <!-- </contact-button> -->
        </div>
        <div class="nav-tab-controller">
          <div class="default" @click="openModal">加入进货车</div>
          <div class="primary" @click="settlementModal">立即下单</div>
        </div>
      </div>
    </div>
    <div class="modal" v-if="visible">
      <div class="modal-mask" @click="closeModal"></div>
      <div class="modal-content">
        <div class="specifications">
          <div class="specifications-header">
            <div class="specifications-pic">
              <img mode="widthFix" :src="data.detail.goodsLogo">
            </div>
            <div class="specifications-info">
              <p class="specifications-title">{{data.detail.goodsName}} {{data.detail.goodsSn}}</p>
              <p class="specifications-price">￥{{price}}</p>
            </div>
          </div>
          <div class="specifications-body">
            <div class="specifications-tabs">
              <div class="specifications-cell" v-for="(value, attr) in data.specs" :key="attr">
                <div class="specifications-cell-head">{{attr}}</div>
                <div class="specifications-cell-body">
                  <div class="specifications-cell-info" v-for="(item,itemIndex) in value" :key="itemIndex" :class="{'active':selectData && selectData[attr]&&selectData[attr].itemId==item.itemId}"
                    @click="handlerSelect(attr,item)">
                    <span class="specifications-size">{{item.item}}</span>
                    <!-- <span class="specifications-price">￥{{data.spec_price[color.item_id+'_'+item.item_id].price}}</span> -->
                  </div>
                </div>
                <!-- <div class="specifications-cell-count">库存：{{data.spec_price[color.item_id+'_'+item.item_id].store_count}}</div> -->
              </div>
              <div class="specifications-cell">
                <div class="specifications-cell-head">数量</div>
                <div class="specifications-cell-body">
                  <div class="specifications-cell-num">
                    <i-input-number :value="goods_num" min="1" :max="maxStoreCount" @change="handleChangeNumber($event)" />
                  </div>
                </div>
                <!-- <div class="specifications-cell-count">库存：{{data.spec_price[color.item_id+'_'+item.item_id].store_count}}</div> -->
              </div>

              <!-- <i-tabs :current="current" @change="handleChange" color="#EE7559">
                <i-tab v-for="item in data.specs['颜色']" :key="item.item_id" :title="item.item" i-class="product-info-tab"></i-tab>
              </i-tabs>-->
              <!-- <div v-for="color in data.specs['颜色']" :key="color.item_id" v-show="current==color.item_id">
                <div class="specifications-cell" v-for="(item,sizeIndex) in data.specs['尺寸']" :key="sizeIndex">
                  <div class="specifications-cell-info">
                    <span class="specifications-size">{{item.item}}</span>
                    <span class="specifications-price">￥{{data.spec_price[color.item_id+'_'+item.item_id].price}}</span>
                  </div>
                  <div class="specifications-cell-count">库存：{{data.spec_price[color.item_id+'_'+item.item_id].store_count}}</div>
                  <div class="specifications-cell-num">
                    <i-input-number :value="numData[color.item_id+'_'+item.item_id]" min="0" :max="data.spec_price[color.item_id+'_'+item.item_id].store_count"
                      @change="handleChangeNumber($event,color.item_id+'_'+item.item_id)" />
                  </div>
                </div>
              </div>-->
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <i-button @click="addShopping" type="primary" size="large" long="true">确定</i-button>
        </div>
      </div>
    </div>
    <i-toast id="toast" />
    <i-action-sheet :visible="shopSheetCisible" :actions="shopSheet" show-cancel @cancel="shopSheetCancel" @iclick="shopSheetClick" />
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  import store from '@/store/index'
  // 依赖

  const {
    $Toast
  } = require('@/../static/iview/base/index');
  import Banner from "@/components/banner";
  import request from "@/api/request";
  import {
    getMallCollect,
    cancelCollect,
    copyClipboard
  } from "@/utils/index";
  export default {
    components: {
      Banner
    },
    data() {
      return {
        bannerStatus: "video",
        price: "",
        maxStoreCount: 999999999,
        data: null,
        storeInfo: {},
        content: [],
        visible: false,
        submitData: null,
        selectData: {},
        goods_num: 1,
        type: null,
        shopSheetCisible: false,
        integral: 0,
        shopSheet: [{
            name: "拨打电话：18859555677",
            phone: "拨打电话：18859555677"
          },
          {
            name: "添加微信：weixin233",
            wx: "weixin233"
          }
        ]
      };
    },
    methods: {
      ...mapMutations(['setCartList', 'setCartStr', 'setSettlementProduct']),
      downloadImgs(ele) {
        if (ele instanceof Array) {
          ele.map(item => {
            this.$saveImg(item)
          })
        } else {
          this.$saveImg(ele)
        }
      },
      getContent() {
        this.content = this.data.detail.goodsContent.match(
          /http\S+([\.jpg][\.png])+/g
        );
      },
      shopSheetClick(e) {
        switch (e.mp.detail.index) {
          case 0:
            wx.makePhoneCall({
              phoneNumber: this.shopSheet[e.mp.detail.index].phone
            });
            break;
          case 1:
            copyClipboard(this.shopSheet[e.mp.detail.index].wx);
            break;
        }
        this.shopSheetCancel();
      },
      openShopSheet() {
        this.shopSheetCisible = true;
      },
      shopSheetCancel() {
        this.shopSheetCisible = false;
      },
      handlerSelect(key, value) {
      //console.log(key,value);
        console.log(this.selectData);
        this.$set(this.selectData, key, value);
        console.log(this.selectData);
        if (Object.keys(this.selectData).length < Object.keys(this.data.specs).length) {
          this.price = this.data.detail.shopPrice;
          this.maxStoreCount = 9999999
        } else {
          //console.log(this.data)
          //console.log(this.data.spec_price)
          //console.log(selectDataValues)
         // console.log()
          let selectDataValues = this.gerSpecKey();
         // console.log(selectDataValues)
          this.price = this.data.spec_price[selectDataValues].price
          this.maxStoreCount = this.data.spec_price[selectDataValues].storeCount
        }
      },
      getMallGoodsDetail() {
        // 请求商品详情
        request
          .getMallGoodsDetail({
            goods_id: this.$route.query.goods_id
          })
          .then(res => {
            this.data = res.data;
            this.price = this.data.detail.shopPrice;
            this.getContent();
          });
      },
      changeBannerStatus(val) {
        this.bannerStatus = val;
      },
      getMallCollect() {
        getMallCollect({
          goods_id: this.$route.query.goods_id
          })
          .then(res => {
            // $Toast({
            //   content: res.message,
            //   type: res.code == 0 ? "success" : "warning"
            // });
            this.getMallGoodsDetail();
          })
          .catch(res => {
            console.log(res)
            $Toast({
              content: '请求失败',
              type: "warning"
            });
          })
      },
      cancelCollect() {
        cancelCollect({
          goods_id: this.$route.query.goods_id
          })
          .then(res => {
            // $Toast({
            //   content: res.message,
            //   type: res.code == 0 ? "success" : "warning"
            // });
            this.getMallGoodsDetail();
          })
          .catch(res => {
            console.log(res)
            $Toast({
              content: '请求失败',
              type: "warning"
            });
          })
      },
      handleChangeNumber(e, key) {
        this.goods_num = e.mp.detail.value;
      },
      openModal() {
        this.visible = true;
      },
      closeModal() {
        this.visible = false;
      },
      settlementModal() {
        this.openModal();
        this.type = "settlement";
      },
      gerSpecKey() {
        let selectDataValues = Object.values(this.selectData);
        let ary = []
        if (Object.keys(this.data.specs).length <= 1) {
          return selectDataValues[0].itemId
        } else {
          selectDataValues.map(item => {
            //console.log(item.item_id)
            ary.push(item.itemId)
          })
          return ary.sort((a, b) => a - b).join('_')
        }
      },
      addShopping() {
        // 加入购物车
        // 判断是否选择了规格
        let selectDataKeys = Object.keys(this.selectData);
        let selectDataValues = this.gerSpecKey();
        if (selectDataKeys.length < Object.keys(this.data.specs).length) {
          $Toast({
            content: "请选择规格",
            type: "warning"
          });
          return;
        }
        let cart_str = {};
        // cart_str[this.data.detail.goodsId] = [{
        //   spec_key: selectDataValues,
        //   goods_num: this.goods_num
        // }];
        let cartAttr = [{
          specKey: selectDataValues,
          goodsNum: this.goods_num
        }];
        cart_str.goodsId = this.data.detail.goodsId;
        cart_str.cartAttr = cartAttr;
        // 判断是否是 直接结算 或者 加入购物车
        if (this.type == "settlement") {
          // this.setCartStr(this.submitData);
          this.data.goods_str = cart_str
          //console.log(cartAttr[0])
          this.data.select = cartAttr[0]
          this.data.select.price = this.price
          this.setSettlementProduct(this.data);
          this.$router.push({
            path: "/pages/settlement/settlement",
            query: {
              type: "settlement",
              goods_id: this.data.detail.goodsId
            }
          });
        } else {
          request
            .getMallAddCart(cart_str)
            .then(res => {
              this.closeModal();
              $Toast({
                content: res.message,
                type: res.code == 0 ? "success" : "warning"
              });
              // 刷新购物车
              request
                .getMallCartList({
                  page: 1,
                  page_num: 9999
                })
                .then(res => {
                  this.setCartList(res.data);
                });
            })
            .catch(res => {
              $Toast({
                content: res.message,
                type: res.code == 0 ? "success" : "warning"
              });
            });
        }
      },
      clearData() {
        this.bannerStatus = "video";
        this.data = null;
        this.storeInfo = {};
        this.content = [];
        this.current = null;
        this.visible = false;
        this.submitData = null;
        this.selectData = {};
        this.type = null;
        this.shopSheetCisible = false;
      }
    },
    onLoad() {
      this.clearData();
    },
    onUnload() {
      this.clearData();
    },
    onShow() {
      this.getMallGoodsDetail();
    },
    onHide() {
      this.clearData();
    },
    mounted() {
      let access_token = store.state.access_token
      if(!access_token){
        this.$router.replace({
          path: '/pages/authorization/authorization'
        })
      }

      this.getMallGoodsDetail();
      wx.showShareMenu({
        withShareTicket: true
      })
    }
  };

</script>

<style lang="less">
  .product-info-container {
    .controls {
      .icon-warp {}

      .img {
        width: 100%;
        height: 375px;
      }
    }

    .product-info-pic {
      img {
        width: 100%;
        height: 320px;
      }
    }

    .banner-tabs {}

    .banner-swiper {
      height: 375px;
    }

    .banner {
      height: 375px;

      img {
        width: 100%;
      }

      .banner-video {
        height: 375px;
      }

      .banner-pic {
        height: 375px;
        background: #f9f9f9;
      }
    }
  }

  .product-basic-info {
    background: #fff;
    padding: 15px;

    .product-basic-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;

      .product-title {
        flex: 1;

        p {
          font-size: 14px;
          font-weight: 500;
          color: rgba(96, 96, 96, 1);
          line-height: 20px;
        }

        .product-tags {
          margin-top: 8px;
          display: flex;
          align-items: center;

          .product-tag {
            margin-right: 6px;
            font-size: 10px;
            padding: 0 4px;
            line-height: 14px;
            height: 16px;
            background: rgba(255, 255, 255, 1);
            border-radius: 8px;
            border: 1px solid #ee7559;
            color: #ee7559;
          }
        }
      }

      .shard {
        display: flex;
        align-items: center;
        background: none;
        border: 0;

        img {
          width: 19px;
          height: 19px;
          margin-right: 7px;
        }

        span {
          font-size: 12px;
          color: #a0a0a0;
          line-height: 20px;
        }
      }
    }

    .product-basic-body {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      margin-top: 15px;

      .product-price {
        font-size: 12px;
        font-weight: 400;
        color: rgba(160, 160, 160, 1);
        line-height: 20px;
        margin-right: 15px;

        .unit {
          color: #ee7559;
        }

        .price {
          color: #ee7559;
          font-size: 18px;
          line-height: 20px;
        }
      }

      .down-taotu {
        button {
          padding: 0 10px;
          height: 22px;
          background: #ee7559;
          border-radius: 11px;
          font-size: 12px;
          font-weight: 400;
          color: rgba(255, 254, 254, 1);
          line-height: 22px;
        }
      }
    }

    .product-basic-footer {
      margin-top: 10px;
      font-size: 12px;
      font-weight: 400;
      color: rgb(68, 45, 45);
      line-height: 20px;
      display: flex;
      align-items: center;

      .product-basic-tag {
        flex: 1;
        font-size: 12px;
        color: rgba(160, 160, 160, 1);
        line-height: 20px;
      }
    }
  }

  .product-card {
    background: #fff;

    .product-card-header {
      padding: 25px 15px 15px;
      display: flex;
      align-items: center;

      .icon {
        display: block;
        width: 2px;
        height: 10px;
        background: #ee7559;
        border-radius: 2px;
      }

      p {
        margin-left: 12px;
        font-size: 15px;
        line-height: 1em;
        color: rgba(96, 96, 96, 1);
      }
    }

    .product-card-body {
      padding: 0 20px 20px;
      font-size: 0;

      &.info {
        padding: 0;
      }

      img {
        width: 100%;
      }
    }
  }

  .product-info-table {
    tr {
      display: flex;
      align-items: center;

      th {
        width: 60px;
        font-size: 13px;
        font-weight: 400;
        color: #a0a0a0;
        line-height: 28px;
      }

      td {
        font-size: 13px;
        font-weight: 400;
        color: #404040;
        line-height: 28px;
      }
    }
  }

  .nav-tab {
    padding-top: 49px;

    .nav-tab-warp {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      height: 49px;
      border-top: 1px solid #f8f8f8;
      background: #fff;
      display: flex;

      .nav-tab-icons {
        width: 140px;
        display: flex;
        padding: 0 10px;

        .icon {
          height: 49px;
          flex: 1;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          font-size: 0;

          ._van-icon {
            font-size: 20px;
            height: 20px;
            margin-top: -1px;
          }

          img {
            width: 20px;
            height: 20px;
          }

          p {
            margin-top: 5px;
            font-size: 12px;
            color: rgba(160, 160, 160, 1);
            line-height: 1em;
          }
        }
      }

      .nav-tab-controller {
        flex: 1;
        display: flex;
        align-items: center;

        div {
          flex: 1;
          border: 0;
          font-size: 17px;
          font-weight: 500;
          color: rgba(255, 255, 255, 1);
          border-radius: 0;
          height: 49px;
          line-height: 49px;
          text-align: center;
        }

        .default {
          background: rgba(238, 117, 89, 0.7);
        }

        .primary {
          background: rgba(238, 117, 89, 1);
        }
      }
    }
  }

  .modal {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    z-index: 100;
  }

  .modal-mask {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    background: #000;
    opacity: 0.8;
    z-index: 10;
  }

  .modal-content {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 11;
  }

  .specifications {
    width: 100%;
    background: #fff;
  }

  .specifications {
    padding: 15px;
  }

  .specifications-header {
    display: flex;
    margin-bottom: 10px;
  }

  .specifications-pic {
    width: 80px;
    height: 80px;
    background: #f9f9f9;

    img {
      width: 100%;
      height: 100%;
      display: block;
    }
  }

  .specifications-info {
    flex: 1;
    padding: 0 15px 0;

    .specifications-title {
      font-size: 14px;
      color: rgba(96, 96, 96, 1);
      line-height: 1.5em;
    }

    .specifications-note {
      margin-top: 6px;
      display: flex;
      align-items: flex-start;

      .specifications-note-type {
        font-size: 10px;
        color: rgba(96, 96, 96, 1);
        white-space: nowrap;
        padding: 5px 0;
      }

      .specifications-note-describe {
        padding: 5px;
        font-size: 10px;
        color: rgba(160, 160, 160, 1);
        background: rgba(252, 252, 252, 1);
        border-radius: 5px;
        position: relative;
        display: flex;
        align-items: center;

        span {
          flex: 1;
        }
      }
    }

    .specifications-price {
      margin-top: 6px;
      font-size: 14px;
      color: rgba(238, 117, 89, 1);
      line-height: 1em;
    }
  }

  .specifications-cell {
    display: block;
    position: relative;

    &::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 200%;
      height: 200%;
      transform: scale(0.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      border: 0 solid #e9eaec;
      border-top-width: 1px;
    }

    .specifications-cell-head {
      width: 100%;
      font-size: 14px;
      color: #000;
      line-height: 1em;
      padding: 10px 0;
    }

    .specifications-cell-body {
      display: flex;
      flex-wrap: wrap;
      padding-bottom: 5px;
    }

    .specifications-cell-info {
      padding: 5px 8px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin-right: 10px;
      margin-bottom: 5px;
      background: #fff;
      color: #333333;
      border-radius: 5px;
      border: 1px solid #dadada;

      &.active {
        border-color: #ee7559;

        .specifications-size {
          color: #ee7559;
        }
      }

      .specifications-size {
        font-size: 12px;
        color: rgba(96, 96, 96, 1);
        line-height: 1em;
      }

      .specifications-price {
        font-size: 12px;
        color: rgba(160, 160, 160, 1);
        line-height: 1em;
        margin-top: 8px;
      }
    }

    .specifications-cell-count {
      margin-right: 15px;
      font-size: 12px;
      color: rgba(160, 160, 160, 1);
    }

    .specifications-cell-num {}
  }

  .product-info-tab {
    padding-left: 10px;
    padding-right: 10px;
  }

  .store-coupons-list {
    background: #fff;
    overflow-x: auto;
    white-space: nowrap;
    padding-left: 15px;
    margin-bottom: 10px;
    height: 80px;
  }

</style>
