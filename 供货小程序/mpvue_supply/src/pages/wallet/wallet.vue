<template>
  <div class="container wallet">
    <div class="wallet-info">
      <div class="wallet-amount">{{userInfo.userMoney}}</div>
      <div class="wallet-unit">余额（元）</div>
      <!--<div class="wallet-controller">-->
        <!--<i-button type="primary" size="small" @click="$router.push({ path: '/pages/rechargeType/rechargeType',query: {from_type: 1}})"-->
          <!--i-class="wallet-recharge" shape="circle">充值</i-button>-->
        <!--<i-button type="default" size="small" @click="backUser" i-class="wallet-recharge" shape="circle">返回</i-button>-->
      <!--</div>-->
    </div>
    <!--<i-cell-group>-->
      <!--<i-cell title="余额支付密码设置" clickable is-link @click="$router.push({ path: '/pages/setPayPassword/setPayPassword'})" />-->
    <!--</i-cell-group>-->
    <div class="blank-spaces"></div>
    <div class="detail-list">
      <div class="detail-list-title">收支明细</div>
      <div class="detail-list-body">
        <div class="wallet-list" v-if="balanceList">
          <wallet-item v-for="(item ,index) in balanceList" :key="index" :data="item"></wallet-item>
        </div>
      </div>
      <i-load-more tip="暂无数据" v-if="balanceList&&balanceList.length<=0" :loading="false" />
    </div>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  import walletItem from "@/pages/wallet/walletItem";
  import request from "@/api/request";
  export default {
    components: {
      walletItem
    },
    data() {
      return {};
    },
    computed: {
      ...mapState(['balanceList', 'userInfo'])
    },
    methods: {
      ...mapMutations(["setBalanceList"]),
      backUser() {
        this.$router.replace({
          path: '/pages/index'
        })
      },
      getPoints() {
        request
          .getPoints({
            page: 1,
            page_num: 9999,
            type: 2
          })
          .then(res => {
            this.setBalanceList(res.data);
          });
      },

    },
    mounted() {
      this.getPoints();
    }
  };

</script>

<style lang="less">
  .wallet-info {
    padding: 30px 0;

    .wallet-amount {
      font-size: 44px;
      font-weight: bold;
      color: rgba(238, 117, 89, 1);
      line-height: 1em;
      margin-top: 20px;
      text-align: center;
    }

    .wallet-unit {
      text-align: center;
      font-size: 15px;
      line-height: 1em;
      margin-top: 20px;
      color: rgba(128, 128, 128, 1);
    }

    .wallet-controller {
      text-align: center;
      margin-top: 36px;
    }

    .wallet-recharge {
      width: 180px;
      display: inline-block;
    }
  }

  .detail-list {
    background: #fff;

    .detail-list-title {
      padding: 15px;
      font-size: 15px;
      line-height: 1em;
      font-weight: 500;
      color: rgba(64, 64, 64, 1);
    }

    .detail-list-body {}

    .wallet-list {}

  }

</style>
