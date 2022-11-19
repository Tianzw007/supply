<template>
  <div class="container">
    <!-- <div class="search-bar">
      <div class="search">
        <input type="text" placeholder="搜索商品，共23432件好物" />
      </div>
    </div>-->
    <div class="product-list" v-if="productList&&productList.length>0">
      <product-module
        :data="item"
        v-for="(item,index) in productList"
        :key="index"
        :collection="getMallCollect"
        :cancelCollect="cancelCollect"
      ></product-module>
    </div>
    <i-load-more tip="暂无数据" v-if="productList&&productList.length<=0" :loading="false"/>
    <i-toast id="toast"/>
  </div>
</template>

<script>
import { mapState, mapMutations } from "Vuex";
import store from '@/store/index'
// 依赖
import productModule from "@/components/productModule";
import request from "@/api/request";
import { getMallCollect, cancelCollect } from "@/utils/index";
export default {
  components: {
    productModule
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(["productList"])
  },
  methods: {
    ...mapMutations(["setProductList"]),
    getProductList() {
      // 获取首页列表
      const cat_id = this.$route.query.cat_id;
      const keywords = this.$route.query.keywords;
      let option = {
        page: 1,
        page_num: 9999
      };
      cat_id ? (option.cat_id = cat_id) : null;
      keywords ? (option.keywords = keywords) : null;
      request.getProductList(option).then(res => {
        this.setProductList(res.data.list);
      });
    },
    cancelCollect(data) {
      cancelCollect({
        goods_id: data.goodsId
      }).then(() => {
        this.getProductList();
      });
    },
    getMallCollect(data) {
      getMallCollect({
        goods_id: data.goodsId
      }).then(() => {
        this.getProductList();
      });
    }
  },
  mounted() {
    let access_token = store.state.access_token
    if(!access_token){
      this.$router.replace({
        path: '/pages/authorization/authorization'
      })
    }
    this.getProductList();
  }
};
</script>

<style lang="less">
.container {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.product-list {
  padding-top: 15px;

  .product {
    padding: 0 15px;
    margin-bottom: 10px;
  }
}

.classification {
  flex: 1;
  display: flex;
}

.classification-nav {
  width: 160rpx;
  background: rgba(255, 255, 255, 1);

  .classification-nav-title {
    height: 98rpx;
    margin-top: 20rpx;
    display: flex;
    align-items: center;

    p {
      flex: 1;
      text-align: center;
      font-size: 15px;
    }
  }

  .classification-nav-item {
    height: 98rpx;
    display: flex;
    align-items: center;

    p {
      height: 50rpx;
      flex: 1;
      text-align: center;
      font-size: 15px;
      line-height: 50rpx;
      font-family: PingFang-SC-Regular;
      color: rgba(64, 64, 64, 1);
    }
  }
}

.classification-nav-active {
  background: rgba(249, 249, 249, 1);

  p {
    color: rgba(238, 117, 89, 1);
    border-left: 3px solid rgba(238, 117, 89, 1);
  }
}

.classification-con {
  flex: 1;
  background: rgba(249, 249, 249, 1);
}

.search-bar {
  width: 750rpx;
  height: 90rpx;
  background: rgba(242, 242, 242, 1);
  padding: 10rpx 15px;
}

.search {
  input {
    display: block;
    width: 100%;
    height: 70rpx;
    border-radius: 35rpx;
    background: #fff;
    color: #404040;
    font-size: 14px;
    color: rgba(160, 160, 160, 1);
    text-align: center;
    padding: 0 15rpx;
  }
}
</style>
