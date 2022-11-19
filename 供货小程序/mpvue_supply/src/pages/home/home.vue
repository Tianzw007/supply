<template>
  <div class="container home" v-if="homeList">
    <banner  :imgs="homeList.ads"></banner>
    <div class="advantage">
      <div class="advantage-item">
        <img mode="widthFix" src="../../../static/images/advantage-pic.png" />
        <p>图文商城联盟</p>
      </div>
      <div class="advantage-item">
        <img mode="widthFix" src="../../../static/images/advantage-pic.png" />
        <p>专注精品工艺</p>
      </div>
      <div class="advantage-item">
        <img mode="widthFix" src="../../../static/images/advantage-pic.png" />
        <p>图文7大类专家</p>
      </div>
    </div>
    <div class="home-navigation">
      <div class="home-navigation-parcel" @click="changeHomeActive(1)">
        <div class="home-navigation-item">
          <img mode="widthFix" src="../../../static/images/icon-place-order.png" />
          <p>我要订货</p>
        </div>
      </div>
      <div class="home-navigation-parcel" @click="$router.push({ path: '/pages/orderList/orderList'})">
        <div class="home-navigation-item">
          <img mode="widthFix" src="../../../static/images/icon-place-order-center.png" />
          <p>订货中心</p>
        </div>
      </div>
      <!--<div class="home-navigation-parcel" @click="$router.push({ path: '/pages/substituting/substituting'})">-->
        <!--<div class="home-navigation-item">-->
          <!--<img mode="widthFix" src="../../../static/images/icon-undertakes.png" />-->
          <!--<p>一件代发</p>-->
        <!--</div>-->
      <!--</div>-->
    </div>
    <div class="home-module">
      <div class="home-module-header">
        <p class="title">新品首发</p>
        <p class="more" @click="changeMallActive('new_goods',1)">查看更多 ></p>
      </div>
      <div class="home-module-body">
        <div class="new-products scroll-view-x">
          <div class="new-product" @click="$router.push({ path: 'productInfo/productInfo', query: { goods_id: item.goodsId } })"
            v-for="(item,index) in homeList.newGoods" :key="index">
            <img mode="widthFix" :src="item.goodsLogo" />
          </div>
        </div>
      </div>
    </div>
    <div class="home-module">
      <div class="home-module-header">
        <p class="title">精品推荐</p>
        <p class="more" @click="changeMallActive('recommedGoods',1)">查看更多 ></p>
      </div>
      <div class="home-module-body">
        <div class="product-list">
          <product-module :data="item" v-for="(item,recommendIndex) in homeList.recommedGoods" :key="recommendIndex"
            :collection="getMallCollect" :cancelCollect="cancelCollect"></product-module>
        </div>
      </div>
    </div>
    <div class="home-module">
      <div class="home-module-header">
        <p class="title">专题精选</p>
        <p class="more" @click="changeMallActive(null,3)" >查看更多 ></p>
      </div>
      <div class="home-module-body">
        <div class="project-list">
          <div class="project" v-for="(item,index) in homeList.newsList" :key="index" @click="$router.push({ path: 'projectInfo/projectInfo', query: { id: item.id } })">
            <div class="project-pic">
              <img mode="widthFix" class="product-controller-icon" :src="item.localUrl" />
            </div>
            <div class="project-info">
              <p class="project-title">{{item.title}}</p>
              <p class="project-describe">{{item.digest}}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="edit-specifications-modal"></div>
    <i-toast id="toast" />
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  // 依赖
  const {
    $Toast
  } = require("@/../static/iview/base/index");
  import productModule from "@/components/productModule";
  import Banner from "@/components/banner";
  import request from "@/api/request";
  import {
    cancelCollect,
    getIndexList,
    getMallCollect
  } from "@/utils/index";
  export default {
    components: {
      productModule,
      Banner
    },
    data() {
      return {

      }
    },
    computed: {
      ...mapState(["homeList"])
    },
    methods: {
      ...mapMutations(['setHomeList', 'changeHomeActive', 'setMallActive']),
      changeBannerStatus(val) {
        this.bannerStatus = val
      },
      changeMallActive(val,item) {
        if(val){
          this.setMallActive(val)
        }

        this.changeHomeActive(item)
      }
    },
    // // 下拉刷新方法，与methods方法同级
    // async onPullDownRefresh() {
    //   // to doing..
    //   // 停止下拉刷新
    //   console.log("开始刷新")
    //   await this.getIndexList()
    //   wx.stopPullDownRefresh();
    // },
    // // 上拉加载，拉到底部触发
    // onReachBottom() {
    //   // 到这底部在这里需要做什么事情
    //   // this.loadMore();
    // },
    mounted() {
      this.cancelCollect = cancelCollect
      this.getMallCollect = getMallCollect
      this.getIndexList = getIndexList
      this.getIndexList()
    },
  }

</script>

<style lang="less">
  .home {
    background: #fff;
  }

  .advantage {
    width: 100%;
    display: flex;
    align-items: center;
    padding: 20px 10px;

    .advantage-item {
      flex: 1;
      text-align: center;
      font-size: 0;
      display: flex;
      align-items: center;
      justify-content: center;

      img {
        width: 12px;
        height: 12px;
        margin-right: 5px;
      }

      p {
        font-size: 12px;
        color: rgba(238, 117, 89, 1);
        line-height: 12px;
      }
    }
  }

  .home-navigation {
    display: flex;
    align-items: center;
    padding: 0 10px;
    width: 100%;
    margin-bottom: 16/2px;

    .home-navigation-parcel {
      flex: 1;
      padding: 0 8/2px;

      .home-navigation-item {
        background: #f9f9f9;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 154/2px;

        img {
          width: 48/2px;
          height: 48/2px;
        }

        p {
          margin-top: 15/2px;
          font-size: 24/2px;
          color: rgba(128, 128, 128, 1);
          line-height: 24/2px;
        }
      }
    }
  }

  .home-module {
    font-size: 0;
    width: 100%;

    .home-module-header {
      padding: 0 30/2px;
      padding-top: 50/2px;
      padding-bottom: 40/2px;
      display: flex;
      align-items: center;
      justify-content: space-between;

      .title {
        font-size: 36/2px;
        color: rgba(64, 64, 64, 1);
        line-height: 36/2px;
      }

      .more {
        font-size: 24/2px;
        color: #a0a0a0;
        line-height: 24/2px;
      }
    }

    .home-module-body {}
  }

  .new-products {
    font-size: 0;
    width: 100%;
    white-space: nowrap;

    .new-product {
      width: 278/2px;
      height: 180/2px;
      display: inline-block;
      margin-right: 16/2px;

      &:first-child {
        margin-left: 30/2px;
      }

      &:last-child {
        margin-right: 30/2px;
      }

      img {
        width: 278/2px;
        height: 180/2px;
      }
    }
  }

  .product-list {
    font-size: 0;

    .product {
      margin-bottom: 10px;

      &:last-child {
        margin-bottom: 0;
      }
    }
  }

  .scroll-view-x {
    overflow-x: auto;
  }

</style>
