<template>
  <div class="container address">
    <i-swipeout i-class="i-swipeout-item" v-for="(item,index) in addressList" :key="index" operateWidth="64">
      <div slot="content">
        <i-cell-group>
          <i-cell :title="item.username+' '+item.phone" :label="item.cityInfo+''+item.address" @click="selectAddress(item)">
            <span slot="footer">
              <img  mode="widthFix"  class="address-edit" @click="changeAddress(item.id,item)" src="../../../static/images/icon-address-edit.png"
                alt="">
            </span>
          </i-cell>
        </i-cell-group>
      </div>
      <div slot="button" class="i-swipeout-button-group">
        <div class="i-swipeout-button" @click="deleteAddress(item.id)">删除</div>
      </div>
    </i-swipeout>
    <div class="add-address" @click="$router.push({ path: '/pages/addressEdit/addressEdit',query: { id: '' }})">新增地址</div>
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
  } = require('@/../static/iview/base/index');
  import request from "@/api/request";
  export default {
    components: {},
    data() {
      return {
        actions: [{
          name: "删除",
          color: "#fff",
          fontsize: "20",
          width: 100,
          background: "#ed3f14"
        }]
      };
    },
    computed: {
      ...mapState(["addressList"])
    },
    methods: {
      ...mapMutations(["setAddressList", 'setGoodsAddress', 'setChangeAddress']),
      changeAddress(id, item) {
        this.setChangeAddress(item)
        this.$router.push({
          path: '/pages/addressEdit/addressEdit',
          query: {
            id,
            type: 'edit'
          }
        })
      },
      getAddressList() {
        // 获取收藏列表
        request
          .getAddressList({
            page: 1,
            page_num: 9999
          })
          .then(res => {
            this.setAddressList(res.data);
          });
      },
      selectAddress(data) {
        if (this.$route.query.type == 'selectAddress') {
          this.setGoodsAddress(data)
          this.$router.back()
        }
      },
      deleteAddress(id) {
        // 获取收藏列表
        request
          .deleteAddress({
            address_id: id
          })
          .then(res => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            this.getAddressList();
          });
      }
    },
    mounted() {
      this.getAddressList();

    }
  };

</script>

<style lang="less">
  .i-swipeout-item {
    margin-top: 10px;
    border-bottom: 0 !important;
  }

  .i-swipeout-button {
    height: 58px;
    width: 64px;
    text-align: center;
    line-height: 58px;
    color: #fff;
  }

  .i-swipeout-button-group {
    background: #ee7559;
    width: 64px;
    height: 58px;
  }

  .address {
    padding-bottom: 49px;

  }

  .address-edit {
    width: 38px;
    height: 38px;
  }

  .add-address {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 49px;
    background: #fff;
    line-height: 49px;
    font-size: 15px;
    color: rgba(238, 117, 89, 1);
    text-align: center;

    &:after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 200%;
      height: 200%;
      transform: scale(0.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      border: 0 solid #e9eaec;
      border-top-width: 1px;
    }
  }

  // .collects {
  //   background: #fff;
  // }
  // .product-list {
  //   font-size: 0;
  //   .product {
  //     margin-bottom: 40/2px;

  //     &:last-child {
  //       margin-bottom: 0;
  //     }
  //   }
  // }
  // .scroll-view-x {
  //   overflow-x: auto;
  // }

</style>
