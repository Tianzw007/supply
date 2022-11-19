<template>
  <div class="container couponss">
    <div class="coupons-list" v-if="couponsList">
      <coupons-module v-for="(item,index) in couponsList" :data="item" :key="index" :selectCoupons="selectCoupons"></coupons-module>
    </div>
    <div v-if="!couponsList||couponsList.length<=0">
      <i-load-more tip="无可用优惠券" :loading="loading" />
    </div>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  import couponsModule from '@/components/couponsModule'
  import request from "@/api/request";
  export default {
    components: {
      couponsModule
    },
    data() {
      return {};
    },
    computed: {
      ...mapState(['couponsList'])
    },
    methods: {
      ...mapMutations(['setCouponsList', 'setUseCoupons']),
      getCouponsList(option) {
        // 获取收藏列表
        request.getCouponsList(option).then(res => {
          this.setCouponsList(res.data);
        });
      },
      selectCoupons(data) {
        if (this.$route.query.type) {
          this.setUseCoupons(data)
          this.$router.back()
        }
      },
    },
    mounted() {
      let query = {}
      if (this.$route.query.type) {
        query = {
          order_amount: this.$route.query.order_amount - 0
        }
      }
      this.getCouponsList(query);
    }
  };

</script>

<style lang="less">
  .coupons-list {
    padding: 15px;

    .coupons {
      margin-bottom: 15px;
    }
  }

</style>
