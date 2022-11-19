<template>
  <div class="container">
    <div class="search-bar">
      <div class="search">
        <input type="text" @click="focus" @blur="blur" v-model="search" placeholder="搜索商品名称搜索" />
        <div class="search-btn" @click="subSearch" v-if="searchFocus">搜索</div>
      </div>
    </div>
    <div class="classification" v-if="mallList">
      <div class="classification-nav">
        <div class="classification-nav-title" :class="{'classification-nav-active':mallActive=='collect_goods'}" v-if="mallList.collectGoods"
          @click="changeMallActive('collect_goods')">
          <p>我的收藏</p>
        </div>
        <div class="classification-nav-item" :class="{'classification-nav-active':mallActive=='recommend_goods'}" v-if="mallList.recommedGoods"
          @click="changeMallActive('recommend_goods')">
          <p>推荐</p>
        </div>
        <div class="classification-nav-item" :class="{'classification-nav-active':mallActive=='new_goods'}" v-if="mallList.newGoods"
          @click="changeMallActive('new_goods')">
          <p>新品</p>
        </div>
        <div class="classification-nav-item" :class="{'classification-nav-active':mallActive==item.id}" v-if="mallList.goodsCates"
          v-for="(item,index) in mallList.goodsCates" :key="index" @click="changeMallActive(item.id)">
          <p>{{item.cateTitle}}</p>
        </div>
      </div>
      <div class="classification-con" v-if="mallList.collectGoods && mallActive=='collect_goods'">
        <div class="c-product-list">
          <div class="c-product" @click="$router.push({ path: 'productInfo/productInfo', query: { goods_id: item.goodsId } })"
            v-for="(item,index) in mallList.collectGoods" :key="index">
            <p class="c-product-name">{{item.goodsName}}</p>
            <div class="c-product-pic">
              <img mode="widthFix" class="product-controller-icon" :src="item.goodsLogo" />
            </div>
          </div>

        </div>
      </div>
      <div class="classification-con" v-if="mallList.recommedGoods && mallActive=='recommend_goods'">
        <div class="c-product-list">
          <div class="c-product" @click="$router.push({ path: 'productInfo/productInfo', query: { goods_id: item.goodsId } })"
            v-for="(item,index) in mallList.recommend_goods" :key="index">
            <p class="c-product-name">{{item.goodsName}}</p>
            <div class="c-product-pic">
              <img mode="widthFix" class="product-controller-icon" :src="item.goodsLogo" />
            </div>
          </div>

        </div>
      </div>
      <div class="classification-con" v-if="mallList.newGoods && mallActive=='new_goods'">
        <div class="c-product-list">
          <div class="c-product" v-for="(item,index) in mallList.newGoods" :key="index">
            <p class="c-product-name">{{item.goodsName}}</p>
            <div class="c-product-pic">
              <img mode="widthFix" class="product-controller-icon" :src="item.goodsLogo" />
            </div>
          </div>
        </div>
      </div>
      <div class="classification-con" v-if="mallList.goodsCates && mallActive==new_goodsItem.id" v-for="(new_goodsItem,new_goodsIndex) in mallList.goodsCates"
        :key="new_goodsIndex">
        <p class="fl-list-title">分类</p>
        <div class="c-product-list">
          <div class="fl-list">
            <div class="c-product" v-for="(item,index) in new_goodsItem.childsList" :key="index" @click="$router.push({ path: 'productList/productList', query: { cat_id: item.id } })">
              <div class="c-product-pic">
                <img mode="widthFix" class="product-controller-icon" :src="item.imgUrl" />
              </div>
              <p class="c-product-name">{{item.cateTitle}}</p>
            </div>
          </div>
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
  import request from "@/api/request";
  import {
    getMallList
  } from '@/utils/index'
  export default {
    data() {
      return {
        search: null,
        searchFocus: false
      }
    },
    computed: {
      ...mapState(['mallList', 'mallActive', 'classificationActive'])
    },
    methods: {
      ...mapMutations(['setMallList', 'setMallActive']),
      focus() {
        this.searchFocus = true
      },
      blur() {
        if (!this.search) {
          this.searchFocus = false
        }
      },
      subSearch() {
        this.$router.push({
          path: 'productList/productList',
          query: {
            keywords: this.search
          }
        })
        console.log()
      },
      changeMallActive(val) {
        this.setMallActive(val)
      },
    },
    // // 下拉刷新方法，与methods方法同级
    // async onPullDownRefresh() {
    //   // to doing..
    //   // 停止下拉刷新
    //   await getMallList()
    //   wx.stopPullDownRefresh();
    // },
    // // 上拉加载，拉到底部触发
    // onReachBottom() {
    //   // 到这底部在这里需要做什么事情
    //   // this.loadMore();
    // },
    mounted() {
      console.log("请求数据")
      // this.getMallList()
      getMallList()
    },
  }

</script>

<style lang="less">
  .container {
    flex: 1;
    display: flex;
    flex-direction: column;
  }


  .classification {
    flex: 1;
    display: flex;
  }

  .classification-nav {
    width: 80px;
    background: rgba(255, 255, 255, 1);
    overflow: auto;
    position: fixed;
    bottom: 0;
    left: 0;
    top: 45px;

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
    margin-top: 45px;
    margin-left: 80px;
    background: rgba(249, 249, 249, 1);
    overflow: auto;
    height: 100%;
    flex: 1;
  }

  .search-bar {
    width: 100;
    height: 45px;
    background: rgba(242, 242, 242, 1);
    padding: 5px 15px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
  }

  .search {
    display: flex;

    input {
      display: block;
      flex: 1;
      height: 70rpx;
      border-radius: 35rpx;
      background: #fff;
      color: #404040;
      font-size: 14px;
      color: rgba(160, 160, 160, 1);
      text-align: center;
      padding: 0 15rpx;
    }

    .search-btn {
      height: 70rpx;
      line-height: 70rpx;
      color: #404040;
      font-size: 14px;
      text-align: right;
      margin-left: 10px;
    }
  }

  .c-product-list {
    padding: 0 15px;
  }

  .c-product {
    width: 100%;
    padding: 15px 0;
    border-bottom: 1rpx solid rgba(239, 239, 239, 1);

    .c-product-name {
      font-size: 26rpx;
      color: rgba(96, 96, 96, 1);
      margin-bottom: 15px;
      display: block;

    }

    .c-product-pic {
      width: 100%;

      image {
        width: 100%;
      }
    }
  }

  .fl-list-title {
    font-size: 13px;
    color: rgba(96, 96, 96, 1);
    margin: 15px;
  }

  .fl-list {
    display: flex;
    flex-wrap: wrap;
    background: #fff;
    padding: 8px 4px;

    .c-product {
      width: 33.333333%;
      padding: 0 4px;
      border: 0;
      margin-bottom: 10px;

      .c-product-name {
        margin-bottom: 0px;
        text-align: center;
      }

      .c-product-pic {
        width: 100%;
        margin-bottom: 10px;

        image {
          margin: 0 auto;
          display: block;
          width: 70px;
          height: 70px;
        }
      }
    }
  }

</style>
