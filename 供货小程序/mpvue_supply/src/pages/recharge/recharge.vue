<template>
  <div class="container recharge">
    <div class="recharge-content">
      <p class="recharge-title">{{pageTitle}}金额</p>
      <div class="recharge-controller">
        <span class="recharge-unit">￥</span>
        <input class="recharge-input" type="text" v-model="num">
      </div>
      <p class="recharge-hint">注意：请填写转账的实际金额，若不符将会延迟到账时间</p>
    </div>
    <div class="cell-btn-controller">
      <i-button type="primary" size="small" @click="submitRecharge" i-class="cell-btn" shape="circle">确定无误</i-button>
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
  // 依赖
  const {
    $Toast
  } = require('@/../static/iview/base/index');
  import Dialog from "@/../static/vant/dialog/dialog";
  import request from "@/api/request";
  export default {
    data() {
      return {
        num: '',
        pageTitle: '',
        from_type: null,
      };
    },
    computed: {
      ...mapState(['recharge', 'pay']),
    },
    methods: {
      ...mapMutations(['setRecharge', 'setUserInfo']),
      submitRecharge() {
        let recharge = this.recharge
        recharge['account'] = this.num
        this.setRecharge(recharge)
        request.submitRecharge(recharge).then(res => {
          if (res.code == 0) {
            switch (recharge.from_type) {
              case '1':
                Dialog.alert({
                    title: '充值金额已提交',
                    message: '审核通过后充值到账户余额，请稍后在余额中查看！'
                  })
                  .then(() => {
                    this.$router.push({
                      path: '/pages/wallet/wallet'
                    })
                  })
                return
              case '2':
                request
                  .pay({
                    recharge_id: res.data.recharge_id,
                    ...this.pay
                  })
                  .then(res => {
                    console.log(this.pay)
                    request.getUserInfo().then(res => {
                      this.setUserInfo(res.data);
                      this.$router.replace({
                        path: '/pages/paySuccess/paySuccess',
                        query: {
                          order_id: this.pay.order_no,
                          pay_from: this.pay.pay_from,
                        }
                      })
                    });
                  }).catch(res => {
                    $Toast({
                      content: res.message,
                      type: res.code == 0 ? 'success' : 'warning',
                    });
                  });
            }
          } else {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning',
            });
          }
        })
      }
    },
    mounted() {
      console.log(this)
      switch (this.recharge.from_type) {
        case '1':
          this.pageTitle = '充值'
          break;
        case '2':
          this.pageTitle = '转账'
          break;
      }
      wx.setNavigationBarTitle({
        title: this.pageTitle //页面标题为路由参数
      })
    },
  };

</script>

<style lang="less">
  .recharge-content {
    padding: 15px;
    padding-top: 90px;
    background: #fff;

    .recharge-title {
      font-size: 14px;
      font-weight: 500;
      line-height: 1em;
      margin: 15px 0;
    }

    .recharge-controller {
      display: flex;
      align-items: center;
      position: relative;

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
        border-bottom-width: 1px;
      }

      .recharge-unit {
        font-size: 26px;
        color: #606060;
        margin-right: 15px;
      }

      .recharge-input {
        height: 52px;
        font-size: 26px;
        color: #606060;
      }

    }


    .recharge-hint {
      font-size: 13px;
      color: rgba(160, 160, 160, 1);
      line-height: 1em;
      margin-top: 15px;
    }

    .cell-btn-controller {
      width: 235px;

    }
  }

</style>
