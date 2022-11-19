<template>
  <div class="container order-container">
    <i-tab-bar i-class="order-tab" :current="active" color="#ee7559" @change="changeTab">
      <i-tab-bar-item key="0" img="../../../static/images/icon-o-qb.png" current-img="../../../static/images/icon-o-qb-active.png"
        title="全部"></i-tab-bar-item>
      <i-tab-bar-item key="1" img="../../../static/images/icon-o-dfk.png" current-img="../../../static/images/icon-o-dfk-active.png"
        title="待付款"></i-tab-bar-item>
      <i-tab-bar-item key="2" img="../../../static/images/icon-o-dfh.png" current-img="../../../static/images/icon-o-dfh-active.png"
        title="待发货"></i-tab-bar-item>
      <i-tab-bar-item key="3" img="../../../static/images/icon-o-dsh.png" current-img="../../../static/images/icon-o-dsh-active.png"
        title="待收货"></i-tab-bar-item>
      <i-tab-bar-item key="4" img="../../../static/images/icon-o-dpj.png" current-img="../../../static/images/icon-o-dpj-active.png"
        title="待评价"></i-tab-bar-item>
    </i-tab-bar>
    <div class="receipt-list order-list" v-if="orderList">
      <div class="order" v-for="(order,index) in orderList" :key="index" @click="$router.push({ path: '/pages/orderInfo/orderInfo',query:{order_id:order.orderId}})">
        <div class="order-title">
          <span class="order-sn">订单编号：{{order.orderSn}}</span>
          <span class="order-status" v-if="order.status==0">待付款</span>
          <span class="order-status" v-if="order.status==1">待发货</span>
          <span class="order-status" v-if="order.status==2">待收货</span>
          <span class="order-status" v-if="order.status==3">退货中</span>
          <span class="order-status" v-if="order.status==4">退货完成</span>
          <span class="order-status" v-if="order.status==5">待评价</span>
          <span class="order-status" v-if="order.status==6">已评价</span>
        </div>
        <receipt-module v-for="(item,goodIndex) in order.goodsList" :key="goodIndex" :data="item" :allChecked="checked"
          :showChecked="false" :note="item.remark?item.remark:''" :change="receiptChange"></receipt-module>
        <div class="order-controller">
          <div class="line"></div>
          <i-button v-if="order.status==0" type="default" size="small" i-class="order-btn default-btn" shape="circle"
            @click.stop="handleOrder(1,order.orderId)">取消订单</i-button>
          <i-button v-if="order.status==0" type="primary" size="small" i-class="order-btn primary-btn" shape="circle"
            @click.stop="selectPayType(order)">去付款</i-button>
          <!-- <i-button v-if="order.status==2||order.status==5" type="default" size="small" i-class="order-btn default-btn"
            shape="circle">查看物流</i-button> -->
          <!-- <i-button v-if="order.status==2" type="default" size="small" i-class="order-btn default-btn" shape="circle"
            @click.stop="handleOrder(3,order.order_id)">退货</i-button> -->
          <i-button v-if="order.status==2" type="primary" size="small" i-class="order-btn primary-btn" shape="circle"
            @click.stop="handleOrder(2,order.orderId)">确认收货</i-button>
          <i-button v-if="order.status==5" type="primary" size="small" i-class="order-btn primary-btn" @click.stop="evaluation(order)"
            shape="circle">去评价</i-button>
        </div>
      </div>
      <div v-if="orderList.length<=0">
        <i-load-more :tip="loading?'加载中':'暂无数据'" :loading="loading" />
      </div>
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
  import Dialog from "@/../static/vant/dialog/dialog";
  const {
    $Toast
  } = require("@/../static/iview/base/index");
  import receiptModule from "@/components/receiptModule";
  import request from "@/api/request";
  export default {
    components: {
      receiptModule
    },
    data() {
      return {
        orderAmount: null,
        password: '',
        payShow: false,
        active: 0,
        loading: false,
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
    computed: {
      ...mapState(["orderList", "pay"])
    },
    methods: {
      ...mapMutations(["setOrderList", "setUserInfo", "setPay", 'setEvaluationList']),
      evaluation(data) {
        this.setEvaluationList(data)
        this.$router.push({
          path: '/pages/evaluation/evaluation'
        })
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
                type: "warning"
              });
            });
          })
          .catch(() => {
            console.log("取消");
            // on cancel
          });
      },
      closePay(e) {
        if (e.mp.detail == 'confirm') {
          if (this.password) {
            this.payShow = false
            this.confirmPay()
          }
        }
      },
      confirmPay() {
        console.log({
          pay_type: this.actions[0].pay_type,
          pay_from: 1,
          order_no: this.order_sn,
          pay_pass: this.password
        })
        this.payAmount({
          pay_type: this.actions[0].pay_type,
          pay_from: 1,
          order_no: this.order_sn,
          pay_pass: this.password
        })
      },
      payAmount(data) {
        request.pay(data).then(res => {
          console.log(res)
          $Toast({
            content: res.message,
            type: res.code == 0 ? "success" : "warning"
          });
          request.getUserInfo().then(res => {
            console.log(res)
            this.setUserInfo(res.data);
            this.getOrderList();
          });
        }).catch(error => {
          $Toast({
            content: error.message,
            type: "warning"
          });
        });
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
      getOrderList() {
        // 获取订单列表
        this.loading = true;
        request
          .getOrderList({
            status: this.active,
            page: 1,
            page_num: 9999
          })
          .then(res => {
            let time = setTimeout(() => {
              clearTimeout(time);
              this.setOrderList(res.data);
              this.loading = false;
            }, 300);
          });
      },
      changeTab(e) {
        this.active = e.mp.detail.key;
        this.setOrderList([]);
        this.getOrderList();
      }
    },
    mounted() {
      if (this.$route.query.status) {
        this.active = this.$route.query.status;
      }
      this.getOrderList();
    }
  };

</script>

<style lang="less">
  .container {
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  .order-container {
    display: flex;
    flex-direction: column;
    overflow: hidden;

    .order-tabs {}
  }

  .order-list {
    padding: 15px 15px;
    flex: 1;
    overflow: auto;
  }

  .order {
    margin-bottom: 15px;
    overflow: hidden;
  }

  .order-title {
    display: flex;
    justify-content: space-between;
    position: relative;
    background: #fff;
    padding: 0 15px;

    &:after {
      content: "";
      position: absolute;
      top: 0;
      left: 15px;
      width: 200%;
      height: 200%;
      transform: scale(0.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      border: 0 solid #e9eaec;
      border-bottom-width: 1px;
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

  .order-controller {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    background: #fff;
    position: relative;

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
      font-size: 12px;
      height: 24px;
      line-height: 24px;
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

</style>
