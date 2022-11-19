<template>
  <div class="container collects">
    <div class="product-list" v-if="collectsList">
      <product-module :data="item" v-for="(item,index) in collectsList" :key="index" :collection="cancelCollect"
        :cancelCollect="cancelCollect" :isCollection="true"></product-module>
    </div>
    <i-toast id="toast" />
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
  import productModule from "@/components/productModule";
  import request from "@/api/request";
  import {
    getCollects,
    cancelCollect
  } from '@/utils/index'
  export default {
    components: {
      productModule
    },
    data() {
      return {};
    },
    computed: {
      ...mapState(["collectsList"])
    },
    methods: {
      ...mapMutations(["setCollectsList"]),
    },
    mounted() {
      this.cancelCollect = cancelCollect
      this.getCollects = getCollects
      this.getCollects();
    }
  };

</script>

<style lang="less">
  .collects {
    background: #fff;
  }

  .product-list {
    font-size: 0;

    .product {
      margin-bottom: 40/2px;

      &:last-child {
        margin-bottom: 0;
      }
    }
  }

  .scroll-view-x {
    overflow-x: auto;
  }

</style>
