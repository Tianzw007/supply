<template>
  <i-cell :title="'代发单编号：'+data.order_sn" :label="'下单时间：'+getDate" :labeln="'总数：'+data.total" i-class="cell" @click="$router.push({ path: '/pages/substitutingInfo/substitutingInfo', query: { id: data.id } }) ">
    <span slot="footer">
      <span class="status hot" v-if="data.status==0">待确认价格</span>
      <span class="status hot" v-if="data.status==1">待付款</span>
      <span class="status hot" v-if="data.status==2">待发货</span>
      <span class="status hot" v-if="data.status==3">已发货</span>
      <span class="status" v-if="data.status==4">已收货</span>
    </span>
  </i-cell>

</template>

<script>
  import {
    getDate
  } from '@/utils/index'
  export default {
    props: ['data'],
    data() {
      return {

      };
    },
    computed: {
      getDate() {
        return getDate(this.data.create_time)
      }
    }
  };

</script>

<style lang="less">
  .cell {
    margin-top: 10px;
  }

  .ststus {
    font-size: 12px;
    line-height: 12px;

    &.hot {
      color: rgba(238, 117, 89, 1);

    }
  }

</style>
