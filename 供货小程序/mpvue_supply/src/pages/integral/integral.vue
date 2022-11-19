<template>
  <div class="container integral">
    <div class="integral-info">
      <div class="integral-amount">{{userInfo.payPoints}}</div>
      <div class="integral-unit">积分</div>
      <div class="integral-init">
        <p>注：积分由消费产生，进货消费的金额按一定比例获得积分, <br>年底，厂家将根据积分获得情况进行优惠返现福利</p>
      </div>
    </div>
    <div class="detail-list">
      <div class="detail-list-title">积分明细</div>
      <div class="detail-list-body">
        <div class="integral-list" v-if="balanceList">
          <integral-item v-for="(item ,index) in balanceList" :key="index" :data="item"></integral-item>
        </div>
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
  import integralItem from "@/pages/integral/integralItem";
  import request from "@/api/request";
  export default {
    components: {
      integralItem
    },
    data() {
      return {};
    },
    computed: {
      ...mapState(['pointsList', 'userInfo']),
    },
    methods: {
      ...mapMutations(["setPointsList"]),
      getPoints() {
        // 获取收藏列表
        request
          .getPoints({
            page: 1,
            page_num: 9999,
            type: 1
          })
          .then(res => {
            this.setPointsList(res.data);
          });
      },

    },
    mounted() {
      this.getPoints();
    }
  };

</script>

<style lang="less">
  .integral-info {
    padding: 30px 0;

    .integral-amount {
      font-size: 44px;
      font-weight: bold;
      color: rgba(238, 117, 89, 1);
      line-height: 1em;
      margin-top: 20px;
      text-align: center;
    }

    .integral-unit {
      text-align: center;
      font-size: 15px;
      line-height: 1em;
      margin-top: 20px;
      color: rgba(128, 128, 128, 1);
    }

    .integral-init {
      margin-top: 36px;
      p {
        text-align: center;
        font-size: 12px;
        font-weight: 500;
        line-height: 1.5em;
        color: rgba(160, 160, 160, 1);
      }
    }

    .integral-controller {
      text-align: center;
      margin-top: 36px;
    }

    .integral-recharge {
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

    .integral-list {}

  }

</style>
