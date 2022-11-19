<template>
  <div class="container">
    <div class="receipt-list order-list" v-if="exchangeList">
      <div class="order" v-for="(order,index) in exchangeList" :key="index" @click="$router.push({ path: '/pages/orderInfo/orderInfo',query:{order_id:order.order_id}})">
        <div class="order-title">
          <span class="order-sn">订单编号：{{order.order_sn}}</span>
          <span class="order-status">{{order.status}}</span>
        </div>
        <receipt-module v-for="(item,goodIndex) in order.goods_list" :key="goodIndex" :data="item" :allChecked="checked"
          :showChecked="false" :change="receiptChange"></receipt-module>
      </div>
    </div>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  import receiptModule from "@/components/receiptModule";
  import request from "@/api/request";
  export default {
    components: {
      receiptModule
    },
    data() {
      return {
        loading: false
      }
    },
    computed: {
      ...mapState(['exchangeList'])
    },
    methods: {
      ...mapMutations(['setExchangeList']),
      getOrderList() {
        // 获取首页列表
        this.loading = true
        request.getOrderList({
          status: 5,
          page: 1,
          page_num: 9999,
        }).then(res => {
          let time = setTimeout(() => {
            clearTimeout(time)
            this.setExchangeList(res.data)
            this.loading = false
          }, 300)
        });
      },
    },
    mounted() {
      this.getOrderList()
    },
  }

</script>

<style lang="less">
  .container {
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  .order-list {
    padding: 15px 15px;
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
      color: #EE7559;
    }
  }

</style>
