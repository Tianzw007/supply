<template>
  <div class="container orderInfo" v-if="data">
    <div class="order-box order-info">
      <div class="order-info-title">
        <span class="order-sn">订单编号{{data.orderSn}}</span>
        <span class="order-status" v-if="data.status==0">待付款</span>
        <span class="order-status" v-if="data.status==1">待发货</span>
        <span class="order-status" v-if="data.status==2">待收货</span>
        <span class="order-status" v-if="data.status==3">退货中</span>
        <span class="order-status" v-if="data.status==4">退货完成</span>
        <span class="order-status" v-if="data.status==5">待评价</span>
        <span class="order-status" v-if="data.status==6">已评价</span>
      </div>
      <div class="receipt-list">
        <receipt-module v-for="(item,goodIndex) in data.goodsList" :key="goodIndex" :data="item" :allChecked="checked"
          :showChecked="true" :note="item.remark?item.remark:''" :change="receiptChange"></receipt-module>
      </div>
    </div>
    <div class="order-box order-cells order-info-shr">
      <div class="order-cell" v-if="data.receive_type!=3">
        <div class="order-cell-hd">收货人：</div>
        <div class="order-cell-bd">
          <span>{{data.consignee}}</span>
        </div>
        <div class="order-cell-ft">
          <span>{{data.mobile}}</span>
        </div>
      </div>
      <div class="order-cell">
        <div class="order-cell-hd" v-if="data.receive_type!=3">收货地址：</div>
        <!--<div class="order-cell-hd" v-if="data.receive_type==3">自取地址：</div>-->
        <div class="order-cell-bd">
          <span>{{data.cityInfo}} {{data.address}}</span>
        </div>
      </div>
    </div>
    <div class="order-box order-cells order-info-shr">
      <div class="order-cell">
        <div class="order-cell-hd">订单编号：</div>
        <div class="order-cell-bd">
          <span>{{data.orderSn}}</span>
        </div>
        <div class="order-cell-ft">
          <i-button size="small" @click="copyClipboard(data.orderSn)" i-class="cell-btn" shape="circle">复制单号</i-button>
        </div>
      </div>
    </div>
    <div class="order-box order-cells order-info-logistics" v-if="data.receive_type<3&&data.status>1">
      <div class="logistics-name">{{data.shippingName}}</div>
      <div class="order-cell">
        <div class="order-cell-hd">运单号：</div>
        <div class="order-cell-bd">
          <span>{{data.shippingCode}}</span>
        </div>
        <div class="order-cell-ft">
          <i-button size="small" @click="copyClipboard(data.shippingCode)" i-class="cell-btn" shape="circle">复制单号</i-button>
        </div>
      </div>
      <!-- <div class="order-cell">
        <div class="order-cell-hd">客服电话：</div>
        <div class="order-cell-bd">
          <span></span>
        </div>
      </div> -->
    </div>
    <div class="order-box order-cells order-info-details">
      <div class="order-cell">
        <div class="order-cell-hd">订单总额</div>
        <div class="order-cell-bd">
          <span>{{data.totalAmount}}</span>
        </div>
      </div>
      <div class="order-cell">
        <div class="order-cell-hd">优惠券抵扣</div>
        <div class="order-cell-bd">
          <span>{{data.couponPrice}}</span>
        </div>
      </div>
      <!--<div class="order-cell">-->
        <!--<div class="order-cell-hd">会员等级抵扣</div>-->
        <!--<div class="order-cell-bd">-->
          <!--<span>{{data.discount}}</span>-->
        <!--</div>-->
      <!--</div>-->
      <!--<div class="order-cell">-->
        <!--<div class="order-cell-hd">管理调整价格</div>-->
        <!--<div class="order-cell-bd">-->
          <!--<span>{{data.edit_money}}</span>-->
        <!--</div>-->
      <!--</div>-->
      <div class="order-cell">
        <div class="order-cell-hd">应付订单价格</div>
        <div class="order-cell-bd">
          <span>{{data.orderAmount}}</span>
        </div>
      </div>
    </div>

    <div class="order-controller">
      <div class="line"></div>
      <i-button v-if="data.status==0" type="default" size="small" i-class="order-btn default-btn" shape="circle" @click="handleOrder(1,data.orderId)">取消订单</i-button>
      <i-button v-if="data.status==0" type="primary" size="small" i-class="order-btn primary-btn" shape="circle" @click="selectPayType(data)">去付款</i-button>
      <!-- <i-button v-if="data.status==2||data.status==5" type="default" size="small" i-class="order-btn default-btn"
            shape="circle">查看物流</i-button> -->
      <i-button v-if="data.status==2" type="default" size="small" i-class="order-btn default-btn" shape="circle" @click="handleOrder(3,data.orderId)">退货</i-button>
      <i-button v-if="data.status==2" type="primary" size="small" i-class="order-btn primary-btn" shape="circle" @click="handleOrder(2,data.orderId)">确认收货</i-button>
      <i-button v-if="data.status==5" type="primary" size="small" i-class="order-btn primary-btn" shape="circle" @click="evaluation(data)">去评价</i-button>
    </div>
    <van-dialog id="van-dialog" />
    <i-toast id="toast" />
    <i-modal title="请选择支付方式" :visible="visible" :actions="actions" action-mode="vertical" @iclick="pay"></i-modal>
    <van-dialog use-slot :show="payShow" @close="closePay">
      <div class="pay-orderAmount">
        <p>￥{{orderAmount}}</p>
        <input type="password" v-model="password" placeholder="请输入支付密码">
      </div>
    </van-dialog>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  const {
    $Toast
  } = require("@/../static/iview/base/index");
  import Dialog from "@/../static/vant/dialog/dialog";
  import receiptModule from "@/components/receiptModule";
  import request from "@/api/request";
  import {
    copyClipboard
  } from '@/utils/index'
  export default {
    components: {
      receiptModule
    },
    data() {
      return {
        orderAmount: null,
        password: '',
        payShow: false,
        data: null,
        visible: false,
        order_sn: null,
        order_id: null,
        actions: [{
            name: "余额支付",
            color: "#EE7559",
            pay_type: 1
          },
          // {
          //   name: "微信支付",
          //   color: "#404040",
          //   pay_type: 2
          // },
          {
            name: "转账",
            color: "#404040",
            pay_type: 3
          },
          {
            name: "取消",
            color: "#EE7559"
          }
        ]
      };
    },
    methods: {
      ...mapMutations(['setUserInfo', 'setPay', 'setEvaluationList']),
      copyClipboard(val) {
        copyClipboard(val)
      },
      evaluation(data) {
        this.setEvaluationList(data)
        this.$router.push({
          path: '/pages/evaluation/evaluation'
        })
      },
      getOrderInfo() {
        request
          .getOrderInfo({
            order_id: this.$route.query.order_id
          })
          .then(res => {
            this.data = res.data;
            console.log(this.data)
          });
      },
      pay(e) {
        this.visible = false;
        // 1余额支付 2-微信支付 3-转账
        let title = "";
        let message = "";
        switch (e.mp.detail.index) {
          case 0:
            title = "余额支付";
            message = "将使用平台余额支付货款！";
            break;
          case 1:
            this.setPay({
              pay_type: this.actions[e.mp.detail.index].pay_type,
              pay_from: 1,
              order_no: this.order_sn,
              order_id: this.order_id
            })
            this.getOrderList();
            this.$router.push({
              path: '/pages/rechargeType/rechargeType',
              query: {
                from_type: 2
              }
            })
            return
            // case 3:
            //   title = ''
            //   message = ''
            //   break;
          default:
            return;
        }

        Dialog.confirm({
            title,
            message
          })
          .then(() => {
            request.payConfirmMoney({
              pay_type: e.mp.detail.index,
              order_no: this.order_sn
            }).then(payConfirmMoney => {
              console.log(payConfirmMoney)
              this.orderAmount = payConfirmMoney.data.order_amount
              let data = {
                pay_type: this.actions[e.mp.detail.index].pay_type,
                pay_from: 1,
                order_no: this.order_sn
              }
              if (e.mp.detail.index == 0) {
                this.payShow = true
              } else {
                this.payAmount(data)
              }
            }).catch(error => {
              $Toast({
                content: error.message,
                type: error.code == 0 ? "success" : "warning"
              });
            });
          })
          .catch(() => {
            console.log("取消");
            // on cancel
          });
      },
      closePay(e) {
        this.payShow = false
        if (e.mp.detail === 'confirm') {
          // 异步关闭弹窗
          this.confirmPay()
        }
      },
      confirmPay() {
        this.payAmount({
          pay_type: this.actions[0].pay_type,
          pay_from: 1,
          order_no: this.order_sn,
          pay_pass: this.password
        })
      },
      payAmount(data) {
        request.pay(data)
          .then(res => {
            console.log(res)
            $Toast({
              content: res.message,
              type: res.code == 0 ? "success" : "warning"
            });
            request.getUserInfo().then(res => {
              this.setUserInfo(res.data);
            });
          }).catch(error => {
            $Toast({
              content: error.message,
              type: error.code == 0 ? "success" : "warning"
            });
          });
      },
      selectPayType(order) {
        $Toast({
          content: '支付迁移中',
          type: "warning"
        });
        /**
        this.visible = true;
        this.order_sn = order.order_sn;
        this.order_id = order.order_id;
        **/
      },
      handleOrder(type, order_id) {
        // 1 - 取消订单 2 - 确认收货 3 - 退货
        let title = "";
        let message = "";
        switch (type) {
          case 1:
            title = "取消订单";
            message = "确定取消订单？";
            break;
          case 2:
            title = "确认收货";
            message = "确认货品无误后，请确认收货!";
            break;
          default:
            return;
        }
        Dialog.confirm({
            title,
            message
          })
          .then(() => {
            console.log(11111);
            // on confirm
            request
              .handleOrder({
                type,
                order_id
              })
              .then(res => {
                $Toast({
                  content: res.message,
                  type: res.code == 0 ? "success" : "warning"
                });
                request.getUserInfo().then(res => {
                  console.log(res)
                  this.setUserInfo(res.data);
                  this.getOrderList();
                });
              });
          })
          .catch(() => {
            console.log("取消");
            // on cancel
          });
      },
    },
    mounted() {
      console.log()
      this.getOrderInfo();
    }
  };

</script>

<style lang="less">
  .orderInfo {
    padding-bottom: 60px;
    display: block;
    height: auto;
  }

  .order-box {
    background: #fff;
    margin-top: 15px;
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
      color: #EE7559;
    }
  }

  .logistics-name {
    font-size: 16px;
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
        color: #A0A0A0;
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
          color: #A0A0A0;
        }

        .amount {
          font-size: 16px;
          color: #EE7559;
          line-height: 24px;
        }

      }
    }
  }

  .order-btn {
    font-size: 14px;
    height: 32px;
    line-height: 32px;
    margin: 8px 15px 8px 0;
    background: none !important;
  }

  .order-controller {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    background: #fff;
    position: relative;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;

    .line {
      position: absolute;
      top: 0;
      left: 15px;
      right: 15px;

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
        border: 0 solid #f8f8f8;
        border-top-width: 1px;
      }
    }

    .order-btn {
      font-size: 14px;
      height: 32px;
      line-height: 32px;
      margin: 8px 15px 8px 0;
      background: none !important;
    }

    .default-btn {
      color: #a0a0a0 !important;
      box-shadow: inset 0 0 0 1px #c9c9c9 !important;
    }

    .primary-btn {
      color: #ee7559 !important;
      box-shadow: inset 0 0 0 1px #ee7559 !important;
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
