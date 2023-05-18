<template>
  <div class="container">
    <div v-if="!isAuthorization">
      <authorization></authorization>
    </div>
    <div class="view-item" :class="{'view-item-active':homeActive==0}">
      <home></home>
    </div>
    <div class="view-item" :class="{'view-item-active':homeActive==1}">
      <classification></classification>
    </div>
    <div class="view-item" v-if="access_token" :class="{'view-item-active':homeActive==2}">
      <shopping-cart></shopping-cart>
    </div>
    <div class="view-item"  v-if="access_token" :class="{'view-item-active':homeActive==3}">
      <project></project>
    </div>
    <div class="view-item"  v-if="access_token" :class="{'view-item-active':homeActive==4}">
      <my></my>
    </div>
    <div class="tab-bar-bg"></div>
    <i-tab-bar :current="homeActive" color="#ee7559" @change="changeTab" fixed="true">
      <i-tab-bar-item key="0" img="../../../static/images/icon-home.png" current-img="../../../static/images/icon-home-active.png"
        title="首页"></i-tab-bar-item>
      <i-tab-bar-item key="1" img="../../../static/images/icon-fenlei.png" current-img="../../../static/images/icon-fenlei-active.png"
        title="分类"></i-tab-bar-item>
      <i-tab-bar-item key="2" :count="cartList&&cartList.length>0?cartList.length:0" img="../../../static/images/icon-jinhuo.png"
        current-img="../../../static/images/icon-jinhuo-active.png" title="进货单"></i-tab-bar-item>
<!--      <i-tab-bar-item key="3" img="../../../static/images/icon-zhuanti.png" current-img="../../../static/images/icon-zhuanti-active.png"-->
<!--        title="专题"></i-tab-bar-item>-->
      <i-tab-bar-item key="4" img="../../../static/images/icon-me.png" current-img="../../../static/images/icon-me-active.png"
        title="我的"></i-tab-bar-item>
    </i-tab-bar>
<!--    <div v-if="!isAuthorization">-->
<!--      <van-dialog use-slot :show="!isAuthorization" :showConfirmButton="false" :show-confirm-button="false" :z-index="99999999999">-->
<!--        <div class="getUserInfo">-->
<!--          <p>您还未允许微信登录授权，请点击下方按钮允许微信授权登录。</p>-->
<!--          <i-button type="primary" open-type="getUserInfo" i-class="cell-btn" shape="circle">允许微信登录授权</i-button>-->
<!--        </div>-->
<!--      </van-dialog>-->
<!--    </div>-->
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 组件
  import home from "@/pages/home/home";
  import classification from "@/pages/classification/classification";
  import shoppingCart from "@/pages/shoppingCart/shoppingCart";
  import project from "@/pages/project/project";
  import my from "@/pages/my/my";
  import authorization from "./authorization/authorization";
  // 依赖
  import api from "@/api/api";
  import request from "@/api/request";
  import store from '@/store/index'
    import {
    onPullDownRefresh
  } from '@/utils/index'
  export default {
    components: {
      authorization,
      home,
      classification,
      shoppingCart,
      project,
      my
    },
    data() {
      return {
        isAuthorization: false
      }
    },
    computed: {
      ...mapState(['homeActive', 'cartList', 'access_token'])
    },
    methods: {
      ...mapMutations(['changeHomeActive']),
      changeTab(e) {
        let access_token = store.state.access_token
        if(e.mp.detail.key > 1 && !access_token){
          this.$router.replace({
            path: '/pages/authorization/authorization'
          })
        }
        this.changeHomeActive(e.mp.detail.key)
      },

    },
    async onPullDownRefresh() {
      // 停止下拉刷新
      console.log("停止下拉刷新")
      await onPullDownRefresh()
      wx.stopPullDownRefresh();
    },

    // 上拉加载，拉到底部触发
    onReachBottom() {
      // 到这底部在这里需要做什么事情
      // this.loadMore();
    },
    mounted() {
       wx.showShareMenu({
        withShareTicket: true
      })
    },
  };

</script>

<style lang="less">
  .container {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
  }

  .tab-bar {
    font-size: 0;
    display: flex;
    align-items: center;
    background: rgba(255, 255, 255, 0.9);
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 99;
    border-top: 1px solid rgba(248, 248, 248, 1);

    .tab-bar-item {
      flex: 1;
      height: 49px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;

      &.active {
        text {
          color: #ee7559;
        }

        .tab-bar-pic {
          display: none;

          &.active {
            display: block;
          }
        }
      }

      .tab-bar-pic {
        display: block;

        &.active {
          display: none;
        }
      }
    }

    .tab-bar-pic {
      width: 25px;
      height: 25px;

      image {
        width: 25px;
        height: 25px;
      }
    }，

    text {
      font-size: 10px;
      color: rgb(160, 160, 160);
      line-height: 10px;
      margin-top: 5px;
    }
  }

  .tab-bar-bg {
    padding-top: 46px;
    width: 100%;
  }

  .view-item {
    display: none;
    width: 100%;
  }

  .view-item-active {
    display: block;
  }

  .getUserInfo {
    display: flex;
    align-items: center;
    flex-direction: column;
    padding: 30px;

    p {
      margin-bottom: 20px;
    }
  }

  ._van-dialog {
    z-index: 99999999999;
  }

</style>
