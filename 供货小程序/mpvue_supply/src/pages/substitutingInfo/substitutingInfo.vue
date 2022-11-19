<template>
  <div class="container substitutingInfo">
    <div v-if="data" class="substitutingInfo-content">
      <div>
        <i-cell-group v-for="(item,index) in data._subs" :key="index">
          <i-cell i-class="cell" :title="item.username+' '+item.phone" :label="item.city_info+''+item.address" :labeln="item.product_info">
          </i-cell>
        </i-cell-group>
        <div class="order-box order-cells order-info-logistics" v-if="data.status>=3">
          <div class="logistics-name">代发单编号：</div>
          <div class="order-cell">
            <div class="order-cell-bd">
              <span>{{data.order_sn}}</span>
            </div>
            <div class="order-cell-ft">
              <i-button size="small" @click="copyClipboard(data.order_sn)" i-class="cell-btn" shape="circle">复制单号</i-button>
            </div>
          </div>
        </div>
        <div class="order-box order-cells order-info-logistics" v-if="data.status>=3">
          <div class="logistics-name">{{data.shipping_name}}</div>
          <div class="order-cell">
            <div class="order-cell-hd">运单号：</div>
            <div class="order-cell-bd">
              <span>{{data.shipping_code}}</span>
            </div>
            <div class="order-cell-ft">
              <i-button size="small" @click="copyClipboard(data.shipping_code)" i-class="cell-btn" shape="circle">复制单号</i-button>
            </div>
          </div>
        </div>
      </div>
      <div v-if="data.order_price" class="price">
        <p>合计金额：<span>{{data.order_price}}</span></p>
      </div>
    </div>
    <div class="nav-controller-module" v-if="data">
      <div class="nav-controller" v-if="data.status==1">
        <div class="nav-btn nav-btn-default" @click="pay(3)">转账</div>
        <div class="nav-btn nav-btn-primary" @click="pay(1)">余额支付</div>
      </div>
      <div class="nav-controller-bg"></div>
    </div>
    <i-toast id="toast" />
    <van-dialog id="van-dialog" />
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  const {
    $Toast
  } = require("@/../static/iview/base/index");
  import Dialog from "@/../static/vant/dialog/dialog";
  import request from "@/api/request";
  import {
    copyClipboard,
    getSubsLists,
    getSbsOrderLists
  } from '@/utils/index'
  export default {
    components: {},
    data() {
      return {
        data: null
      };
    },
    methods: {
      ...mapMutations(["setPay"]),
      copyClipboard(val) {
        copyClipboard(val)
      },
      pay(type) {
        this.visible = false;
        // 1余额支付 2-微信支付 3-转账
        let title = "";
        let message = "";
        switch (type) {
          case 1:
            title = "余额支付";
            message = "将使用平台余额支付货款！";
            break;
          case 3:
          console.log({
              pay_type: type,
              pay_from: 2,
              order_no: this.data.order_sn,
              order_id: this.data.id
            })
            this.setPay({
              pay_type: type,
              pay_from: 2,
              order_no: this.data.order_sn,
              order_id: this.data.id
            });
            this.$router.push({
              path: "/pages/rechargeType/rechargeType",
              query: {
                from_type: 2
              }
            });
            return;
          default:
            return;
        }

        Dialog.confirm({
            title,
            message
          })
          .then(() => {
            request
              .pay({
                pay_type: type,
                pay_from: 2,
                order_no: this.data.order_sn
              })
              .then(res => {
                $Toast({
                  content: res.message,
                  type: res.code == 0 ? "success" : "warning"
                });
                this.getSubsOrderDetail();
                getSubsLists();
                getSbsOrderLists();
                request.getUserInfo().then(res => {
                  this.setUserInfo(res.data);
                });
              })
              .catch(res => {
                $Toast({
                  content: res.message,
                  type: res.code == 0 ? "success" : "warning"
                });
              });
          })
          .catch(() => {
            console.log("取消");
            // on cancel
          });
      },
      getSubsOrderDetail() {
        // 获取收藏列表
        request
          .getSubsOrderDetail({
            id: this.$route.query.id
          })
          .then(res => {
            this.data = res.data;
          });
      }
    },
    mounted() {
      this.getSubsOrderDetail();
    }
  };

</script>

<style lang="less">
  .substitutingInfo-content {
    padding: 15px;
    padding-bottom: 60px;

    .price {
      display: flex;
      justify-content: flex-end;
      padding: 15px;
      font-size: 14px;

      span {
        color: #ee7559;
      }
    }
  }

  .substitutingInfo-no {
    font-size: 14px;
    color: rgba(0, 0, 0, 1);
    line-height: 1em;
    margin-bottom: 15px;
  }

  .cell {
    border-radius: 8px;
    margin-bottom: 10px;
  }

  .nav-controller-module {
    .nav-controller {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      height: 49px;
      display: flex;

      .nav-btn {
        flex: 1;
        line-height: 49px;
        font-size: 15px;
        text-align: center;
        color: #808080;
        background: #fff;
      }

      .nav-btn-primary {
        color: #fff;
        background: #ee7559;
      }
    }

    .nav-controller-bg {
      height: 49px;
    }
  }

  .add-address {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 49px;
    background: #ee7559;
    line-height: 49px;
    font-size: 15px;
    color: #fff;
    text-align: center;

    &:after {
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
  }

  .order-box {
    background: #fff;
    margin-top: 15px;
    border-radius: 16rpx;

  }

  .order-info-title {
    display: flex;
    justify-content: space-between;
    position: relative;
    padding: 0 15px;

    &:after {
      content: "";
      position: absolute;
      top: 34px;
      left: 15px;
      width: 200%;
      height: 200%;
      transform: scale(0.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      border: 0 solid #e9eaec;
      border-top-width: 1px;
    }

    .order-sn {
      line-height: 34px;
      font-size: 12px;
      color: #606060;
    }

    .order-status {
      line-height: 34px;
      font-size: 12px;
      color: #ee7559;
    }
  }

  .logistics-name {
    font-size: 18px;
    line-height: 30px;
    color: #606060;
  }

  .order-cells {
    padding: 10px 15px;

    .order-cell {
      display: flex;
      align-items: flex-start;

      .order-cell-hd {
        font-size: 13px;
        line-height: 24px;
        color: #a0a0a0;
      }

      .order-cell-bd {
        flex: 1;
        font-size: 13px;
        line-height: 24px;

        span {
          font-size: 13px;
          color: rgba(160, 160, 160, 1);
        }
      }

      .order-cell-ft {
        font-size: 13px;
        line-height: 24px;

        span {
          font-size: 13px;
          color: rgba(160, 160, 160, 1);
        }
      }
    }
  }

  .order-info-details {
    .order-cell {
      display: flex;
      align-items: flex-start;

      .order-cell-hd,
      .order-cell-bd {
        text-align: right;

        span {
          font-size: 12px;
          line-height: 24px;
          color: #a0a0a0;
        }

        .amount {
          font-size: 16px;
          color: #ee7559;
          line-height: 24px;
        }
      }
    }
  }

  .order-cell-ft {
    .cell-btn {
      display: block;
      height: 24px;
      line-height: 24px;
      width: 66px;
      margin: 0;
      padding: 0;
      font-size: 11px;
    }
  }

</style>
