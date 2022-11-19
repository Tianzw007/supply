<template>
  <div class="coupons" @click="selectCoupons(data)">
    <div class="coupons-info">
      <p class="coupons-name">{{data.name}}</p>
      <p class="coupons-end-time">{{data.useEndTime}}</p>
    </div>
    <div class="coupons-amount-info">
      <p class="coupons-amount">
        <span class="amount-num">{{data.money}}</span>
        <span class="amount-unit">元</span>
      </p>
      <p class="coupons-condition">满{{data.condition}}元可用</p>
    </div>
  </div>
</template>

<script>
  import {
    getDate
  } from '@/utils/index'
  export default {
    props: ['data', 'selectCoupons'],
    computed: {
      getDate() {
        return getDate(this.data.use_end_time)
      }
    }
  };

</script>

<style lang="less">
  .coupons {
    display: flex;
    align-items: center;
    border-radius: 5px;
    overflow: hidden;

    .coupons-info {
      background: #fff;
      flex: 1;
      padding: 15px;
      height: 100px;

      .coupons-name {
        margin-top: 14px;
        margin-bottom: 20px;
        font-size: 18px;
        line-height: 1em;
        color: rgba(96, 96, 96, 1);
      }

      .coupons-end-time {
        font-size: 12px;
        color: rgba(160, 160, 160, 1);
        line-height: 1em;
      }
    }

    .coupons-amount-info {
      width: 180px;
      height: 100px;
      background: url("../../static/images/coupons-bg.png") no-repeat;
      background-size: 100% 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      padding-left: 15px;

      .coupons-amount {
        margin-top: 8px;
        display: flex;
        align-items: flex-end;
        text-align: center;
      }

      .amount-num {
        font-size: 44px;
        font-weight: bold;
        color: rgba(255, 254, 254, 1);
        line-height: 1em;
      }

      .amount-unit {
        font-size: 15px;
        font-weight: bold;
        color: rgba(255, 254, 254, 1);
      }

      .coupons-condition {
        margin-top: 10px;
        text-align: center;
        font-size: 12px;
        color: rgba(255, 218, 209, 1);
      }
    }
  }

</style>
