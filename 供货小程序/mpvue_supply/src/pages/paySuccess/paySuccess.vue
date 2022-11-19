<template>
  <div class="container paySuccess">
    <div class="paySuccess-content">
      <van-icon name="certificate" size="80px" color="#5dc13c" />
      <p class="pay-title">支付成功</p>
      <p class="pay-init">等待审核</p>
      <i-button type="primary" i-class="order-btn primary-btn" shape="circle" @click="replace">返回{{$route.query.pay_from=='1'?'个人中心':'首页'}}</i-button>
    </div>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  import request from "@/api/request";
  export default {
    data() {
      return {};
    },
    methods: {
      replace() {
        this.$router.replace({
          path: '/pages/index'
        })
        // switch (this.$route.query.pay_from) {
        //   case '1':
        //     this.$router.push({
        //       path: '/pages/orderInfo/orderInfo',
        //       query: {
        //         order_id: this.$route.query.order_id
        //       }
        //     })
        //     break;
        //   case '2':
        //     this.$router.push({
        //       path: '/pages/substitutingInfo/substitutingInfo',
        //       query: {
        //         order_id: this.$route.query.order_id
        //       }
        //     })
        //     break;
        // }

      }
    },
    mounted() {
      console.log(this)
    },
  };

</script>

<style lang="less">
  .paySuccess-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 100px;

    .pay-title {
      font-size: 18px;
      margin-top: 20px;
      color: #606060;
    }

    .pay-init {
      font-size: 14px;
      color: #A0A0A0;
    }

    .order-btn {
      background: none !important;
      margin-top: 100px;
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
