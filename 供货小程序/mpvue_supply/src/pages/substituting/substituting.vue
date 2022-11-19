<template>
  <div class="container substituting">
    <i-tabs :current="current" color="#EE7559" @change="handleChange">
      <i-tab key="addSubstituting" title="新增代发"></i-tab>
      <i-tab key="substitutingList" title="代发清单"></i-tab>
    </i-tabs>
    <div v-if="current=='addSubstituting'" class="substituting-scroll">
      <van-notice-bar text="注意：多个不同地址的代发订单请单独提交" />
      <i-swipeout i-class="i-swipeout-item" v-for="(item,index) in subsLists" :key="index" operateWidth="64">
        <div slot="content">
          <i-cell-group>
            <i-cell :title="item.city_info+' '+item.address" :label="item.username+''+item.phone" :labeln="item.product_info">
              <span slot="footer">
                <img mode="widthFix" class="address-edit" @click="changeSubstituting(item.id,item)" src="../../../static/images/icon-address-edit.png"
                  alt="">
              </span>
            </i-cell>
          </i-cell-group>
        </div>
        <div slot="button" class="i-swipeout-button-group">
          <div class="i-swipeout-button" @click="delSubsSinge(item.id)">删除</div>
        </div>
      </i-swipeout>
      <!-- <div class="add-substituting">
        <div class="add-substituting-icon">
          <img  mode="widthFix"  src="../../../static/images/oa_wpsExcel.png" alt="">
        </div>
        <div class="add-substituting-info">
          <p class="add-substituting-title">新建表格-进货单</p>
          <p class="add-substituting-date">2018-08-06 13：25</p>
        </div>
      </div> -->
      <div class="substituting-controller">
        <i-button size="small" @click="$router.push({ path: '/pages/substitutingEdit/substitutingEdit'})" i-class="add-substituting-btn"
          shape="circle">
          <van-icon name="add" color="#F1917A" size="18" custom-class="icon-add" />
          <span>新增代发</span>
        </i-button>
        <i-button size="small" @click="bulkUpload" i-class="up-substituting-btn" shape="circle">
          <span>批量上传</span>
        </i-button>
      </div>
      <div class="add-address" @click="submitsSubsOrder">提交</div>
    </div>
    <div v-if="current=='substitutingList'">
      <i-cell-group>
        <substituting-item v-for="(item,index) in sbsOrderLists" :data="item" :key="index"></substituting-item>
      </i-cell-group>
    </div>
    <i-toast id="toast" />
    <van-dialog id="van-dialog" />
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
  import Dialog from '@/../static/vant/dialog/dialog';
  import substitutingItem from "@/pages/substituting/substitutingItem";
  import request from "@/api/request";
  import {
    getSubsLists,
    getSbsOrderLists
  } from "@/utils/index";
  export default {
    components: {
      substitutingItem
    },
    data() {
      return {
        current: 'addSubstituting',
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
      ...mapState(['subsLists', 'sbsOrderLists', 'userInfo']),

    },
    methods: {
      ...mapMutations(['setSubsLists', 'setSbsOrderLists', 'setChangeSubstituting', 'changeHomeActive']),
      getDate() {
        return 1;
      },
      submitsSubsOrder() {
        let ary = []
        for (let i = 0; i < this.subsLists.length; i++) {
          ary.push(this.subsLists[i].id)
        }

        if (ary.length <= 0) {
          $Toast({
            content: '请添加代发后再提交',
            type: 'warning'
          });
          return
        }
        if (this.userInfo.is_auth != 1) {
          Dialog.alert({
            title: '系统提示',
            message: '请先去认证哦,才能操作！'
          }).then(() => {
            this.changeHomeActive(4)
            this.$router.push({
              path: '/pages/index'
            })
          });
          return
        }
        request.submitsSubsOrder({
          sub_ids: ary.toString()
        }).then(res => {
          $Toast({
            content: res.message,
            type: res.code == 0 ? 'success' : 'warning'
          });
          getSubsLists();
          getSbsOrderLists();
        })
      },
      changeSubstituting(id, item) {
        this.setChangeSubstituting(item)
        console.log()
        this.$router.push({
          path: '/pages/substitutingEdit/substitutingEdit',
          query: {
            id,
            type: 'edit'
          }
        })
      },
      handleChange(e) {
        console.log(e.mp.detail)
        this.current = e.mp.detail.key
      },
      selectAddress(data) {
        if (this.$route.query.type == 'selectAddress') {
          this.setGoodsAddress(data)
          this.$router.back()
        }
      },
      delSubsSinge(id) {
        request
          .delSubsSinge({
            id: id
          })
          .then(res => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            getSubsLists();
          });
      },
      bulkUpload() {
        Dialog.alert({
          title: '系统提示',
          message: '请在使用电脑登录(http://39.106.196.3:6002/index/index/subsLogin)',
          confirmButtonText: '复制'
        }).then(() => {
          wx.setClipboardData({
            data: 'http://39.106.196.3:6002/index/index/subsLogin',
            success: function (res) {
              // wx.showModal({
              //   title: '提示',
              //   content: '复制成功',
              //   success: function (res) {
              //     if (res.confirm) {
              //       console.log('确定')
              //     } else if (res.cancel) {
              //       console.log('取消')
              //     }
              //   }
              // });
            },
            fail: function () {
              wx.showModal({
                title: '提示',
                content: '复制失败，请手动复制',
                success: function (res) {
                  if (res.confirm) {
                    console.log('确定')
                  } else if (res.cancel) {
                    console.log('取消')
                  }
                }
              });
            }
          })
        })
      }
    },
    mounted() {
      getSubsLists();
      getSbsOrderLists();

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

  .substituting {
    padding-bottom: 49px;
  }

  .substituting-scroll {
    overflow: auto;
    flex: 1;
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
    background: #EE7559;
    line-height: 49px;
    font-size: 15px;
    color: #fff;
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

  .add-substituting {
    display: flex;
    background: #fff;
    align-items: center;
    margin-top: 10px;
    padding: 12px 15px;

    .add-substituting-icon {
      img {
        width: 40px;
        height: 46px;
      }

      margin-right: 15px;
    }

    .add-substituting-info {}

    .add-substituting-title {
      font-size: 12px;
      color: #606060;
      line-height: 1em;
    }

    .add-substituting-date {
      margin-top: 8px;
      font-size: 12px;
      color: #a0a0a0;
      line-height: 1em;
    }
  }

  .substituting-controller {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 10px;

    .add-substituting-btn {
      width: 436rpx;
      display: flex;
      align-items: center;
      font-size: 16px;
      justify-content: center;
      background: #fff !important;

      span {
        color: #EE7559;
      }

      .icon-add {
        width: 18px;
        height: 18px;
        display: block;
        margin-right: 15px;
      }
    }

    .up-substituting-btn {
      width: 230rpx;
      font-size: 16px;
      color: #A0A0A0;
      background: #fff !important;
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
