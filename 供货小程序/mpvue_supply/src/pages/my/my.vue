<template>
  <div class="container user-container">
    <div class="user-box" v-if="userInfo">
      <div class="uaer-info">
        <img mode="widthFix" class="avatar" :src="userInfo.headimg" alt="">
        <div class="user-details">
          <p class="user-name">{{userInfo.nickname}}</p>
          <!--<p class="user-type">{{userInfo.level}}</p>-->
          <p class="user-id">ID：{{userInfo.id}}</p>
        </div>
      </div>
      <div class="user-account">
        <div class="user-account-item" @click="$router.push({ path: 'wallet/wallet'})">
          <p class="user-account-number">{{userInfo.userMoney}}</p>
          <p class="user-account-type">余额</p>
        </div>
        <div class="user-account-item" @click="$router.push({ path: 'integral/integral'})">
          <p class="user-account-number">{{userInfo.payPoints}}</p>
          <p class="user-account-type">积分</p>
        </div>
      </div>
    </div>
    <div class="ant-panel" v-if="userInfo">
      <div class="ant-panel-head" @click="$router.push({ path: 'orderList/orderList'})">
        <p class="ant-panel-title">我的订单</p>
        <div class="ant-panel-extra">
          <p class="ant-panel-extra-text">查看全部订单</p>
          <img mode="widthFix" class="ant-panel-extra-icon" src="../../../static/images/icon-next.png" />
        </div>
      </div>
      <div class="ant-panel-body">
        <div class="ant-grid-list">
          <div class="ant-grid-item" @click="$router.push({ path: 'orderList/orderList',query:{status:1}})">
            <i-badge :count="userInfo.countInfo.unpayCount">
              <img mode="widthFix" class="ant-grid-icon" src="../../../static/images/icon-daifukuan.png" />
              <p class="ant-grid-text">待付款</p>
            </i-badge>
          </div>
          <div class="ant-grid-item" @click="$router.push({ path: 'orderList/orderList',query:{status:2}})">
            <i-badge :count="userInfo.countInfo.undeliverCount">
              <img mode="widthFix" class="ant-grid-icon" src="../../../static/images/icon-daifahuo.png" />
              <p class="ant-grid-text">待发货</p>
            </i-badge>
          </div>
          <div class="ant-grid-item" @click="$router.push({ path: 'orderList/orderList',query:{status:3}})">
            <i-badge :count="userInfo.countInfo.deliveringCount">
              <img mode="widthFix" class="ant-grid-icon" src="../../../static/images/icon-faishouhuo.png" />
              <p class="ant-grid-text">待收货</p>
            </i-badge>
          </div>
          <div class="ant-grid-item" @click="$router.push({ path: 'orderList/orderList',query:{status:4}})">
            <i-badge :count="userInfo.countInfo.unevalCount">
              <img mode="widthFix" class="ant-grid-icon" src="../../../static/images/icon-daipingjia.png" />
              <p class="ant-grid-text">待评价</p>
            </i-badge>
          </div>
          <i-badge :count="userInfo.countInfo.returnCount">
            <div class="ant-grid-item" @click="$router.push({ path: 'exchange/exchange'})">
              <img mode="widthFix" class="ant-grid-icon" src="../../../static/images/iocn-tuihuanhuo.png" />
              <p class="ant-grid-text">退换货</p>
            </div>
          </i-badge>
        </div>
      </div>
    </div>
    <div class="list-wrap">
      <div class="blank-spaces"></div>
      <div class="list-item">
        <i-cell-group>
          <i-cell title="优惠券" :value="couponsList?couponsList.length+'张优惠券':'加载中...'" clickable is-link @click="$router.push({ path: 'coupons/coupons'})" />
          <i-cell title="我的收藏" :value="collectsList?collectsList.length+'个商品':'加载中...'" clickable is-link @click="$router.push({ path: 'collection/collection'})" />
          <i-cell title="地址管理" clickable is-link @click="$router.push({ path: 'address/address'})" />
          <!--<i-cell value-class="unauthorized" title="采购商认证" value="未认证" v-if="userInfo&&userInfo.is_auth==0" is-link-->
            <!--@click="$router.push({ path: 'certification/certification'})" />-->
          <!--<i-cell value-class="unauthorized" title="采购商认证" value="已认证" v-if="userInfo&&userInfo.is_auth==1" />-->
          <!--<i-cell value-class="unauthorized" title="采购商认证" value="已拒绝" v-if="userInfo&&userInfo.is_auth==2" />-->
          <!--<i-cell value-class="unauthorized" title="采购商认证" value="审核中" v-if="userInfo&&userInfo.is_auth==3" />-->
        </i-cell-group>
      </div>
      <div class="blank-spaces"></div>
      <div class="list-item">
        <i-cell-group>
          <i-cell title="在线客服" clickable is-link @click="openShopSheet" />
          <i-cell title="帮助中心" clickable is-link />
        </i-cell-group>
      </div>
    </div>
    <div class="blank-spaces"></div>
    <i-action-sheet :visible="shopSheetCisible" :actions="shopSheet" show-cancel @cancel="shopSheetCancel" @iclick="shopSheetClick" />
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
    getUserInfo,
    getCollects,
    getCouponsList,
    copyClipboard
  } from '@/utils/index'
  export default {
    data() {
      return {
        shopSheetCisible: false,
        shopSheet: [{
            name: '拨打电话：18859555677',
            phone: '拨打电话：18859555677'
          },
          {
            name: '添加微信：weixin233',
            wx: 'weixin233'
          },
        ],
      }
    },
    computed: {
      ...mapState(['userInfo', 'collectsList', 'couponsList'])
    },
    methods: {
      ...mapMutations(['setUserInfo', 'setCollectsList', 'setCouponsList']),
      openShopSheet() {
        this.shopSheetCisible = true
      },
      shopSheetCancel() {
        this.shopSheetCisible = false
      },
      shopSheetClick(e) {
        switch (e.mp.detail.index) {
          case 0:
            wx.makePhoneCall({
              phoneNumber: this.shopSheet[e.mp.detail.index].phone,
            })
            break;
          case 1:
            copyClipboard(this.shopSheet[e.mp.detail.index].wx)
            break;
        }
        this.shopSheetCancel()
      },
      changeBannerStatus(val) {
        this.bannerStatus = val
      },
    },
    mounted() {
      console.log(5555)
      getUserInfo()
      getCollects()
      getCouponsList()
    },
  }

</script>

<style lang="less">
  .user-container {}

  .user-box {
    width: 100%;
    background: rgba(249, 249, 249, 1);
    display: flex;
    align-items: center;
    justify-content: space-between;

    .uaer-info,
    .user-account {
      display: flex;
      align-items: center;
    }

    .uaer-info {
      padding: 30rpx;

      .avatar {
        display: block;
        width: 100rpx;
        height: 100rpx;
        margin-right: 30rpx;
        background: #fff;
        border-radius: 50rpx;
        overflow: hidden;
      }

      .user-details {
        display: flex;
        flex-direction: column;

        .user-name {
          line-height: 1em;
          font-size: 34rpx;
          color: rgba(64, 64, 64, 1);
          margin-bottom: 20rpx;
        }

        .user-type {
          line-height: 1em;
          font-size: 26rpx;
          color: rgba(64, 64, 64, 1);
          margin-bottom: 10rpx;
        }

        .user-id {
          line-height: 1em;
          font-size: 26rpx;
          font-family: PingFang-SC-Medium;
          color: rgba(64, 64, 64, 1);
        }
      }
    }

    .user-account {
      width: 50%;

      .user-account-item {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 30rpx;

        .user-account-number {
          line-height: 1em;
          font-size: 30rpx;
          color: rgba(238, 117, 89, 1);
          margin-bottom: 14rpx;
        }

        .user-account-type {
          line-height: 1em;
          font-size: 24rpx;
          color: rgba(160, 160, 160, 1);
        }
      }
    }
  }

  .ant-panel {
    background: #fff;
    width: 100%;

    .ant-panel-head {
      border-bottom: 1rpx solid #f9f9f9;
      padding: 30rpx;
      display: flex;
      justify-content: space-between;
      align-items: center;

      .ant-panel-title {
        line-height: 1em;
        font-size: 28rpx;
        color: rgba(64, 64, 64, 1);
      }

      .ant-panel-extra {
        display: flex;
        align-items: center;

        .ant-panel-extra-text {
          line-height: 1em;
          font-size: 24rpx;
          color: rgba(160, 160, 160, 1);
        }

        .ant-panel-extra-icon {
          line-height: 1em;
          width: 12rpx;
          height: 24rpx;
          margin-left: 20rpx;
        }
      }
    }
  }

  .ant-grid-list {
    display: flex;
    align-items: center;
    width: 100%;

    .ant-grid-item {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 20rpx;

      .ant-grid-icon {
        width: 50rpx;
        height: 50rpx;
      }

      .ant-grid-text {
        margin-top: 20rpx;
        line-height: 1em;
        font-size: 24rpx;
        color: rgba(160, 160, 160, 1);
      }
    }
  }

  .list-wrap {
    width: 100%;
  }

  .list-item {
    background: #fff;
  }

  .list-item:last-child {
    margin: 0;
  }

  .item {
    flex: 1;
  }


  .van-cell__value.unauthorized {
    color: #EE7559;
  }

</style>
