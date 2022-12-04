<template>
  <div class="container">
    <div v-if="isAuthorization">
      <van-dialog use-slot :show="isAuthorization" :showConfirmButton="false" :show-confirm-button="false" :z-index="99999999999">
        <div class="getUserInfo">
          <p>您还未允许微信登录授权，请点击下方按钮允许微信授权登录。</p>
          <i-button type="primary" open-type="getUserInfo" i-class="cell-btn" shape="circle" @click="getUserinfo">允许微信登录授权</i-button>
<!--          <i-button type="primary"  i-class="cell-btn" shape="circle" @click="cancelLogin">取消登录授权</i-button>-->
        </div>
      </van-dialog>
    </div>
    <i-spin v-if="loading" fix></i-spin>
    <i-toast id="toast" />
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 组件
  const {
    $Toast
  } = require("@/../static/iview/base/index");
  import api from "@/api/api";
  import request from "@/api/request";
  export default {
    data() {
      return {
        isAuthorization: true,
        code: null,
        encrypted_data: null,
        iv: null,
        user: null,
        jscodeRes: null,
        loading: false,
      }
    },
    computed: {
      ...mapState(['homeActive', 'cartList'])
    },
    methods: {
      ...mapMutations(['setAccess_token','changeHomeActive']),
      getUserinfo(e) {
        console.log("e")
        console.log(e)
        console.log("this.code")
        console.log(this.code)

        if (this.code) {
          wx.getUserProfile({
            desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
            success: (data) => {
              // this.setData({
              //   userInfo: data.userInfo,
              //   hasUserInfo: true
              // })
              console.log("data")
              console.log(data)
              this.isAuthorization = false
              this.loading = true
              this.encrypted_data = data.encryptedData
              this.iv = data.iv
              this.getAccessToken()
            }
          })
        } else {
          console.log('获取用户登录失败：' + res.errMsg);
        }

      },

      cancelLogin() {
        //console.log(44444)
        this.isAuthorization = false
        this.loading = false
        this.changeHomeActive(0)
        this.$router.replace({
          path: '/pages/index'
        })
      },

      /*

      * @getAccessToken()
      *
      * @getAccessToken => 使用code换取 access_token
      *
      * @grant_type
      * @client_id
      * @client_secret
      * @encrypted_data
      * @iv
      * @code
      *
      * @then => 获取到 access_token， 存储到 store里
      *
      *
      * @catch =>

      */
      getAccessToken() {
        console.log("getAccessToken")
        console.log({
          grant_type: 'password',
          client_id: 'f3d259ddd3ed8ff3843839b',
          client_secret: '4c7f6f8fa93d59c45502c0ae8c4a95b',
          encrypted_data: this.encrypted_data,
          iv: this.iv,
          code: this.code
        })
        request.getAccessToken({
          grant_type: 'password',
          client_id: 'f3d259ddd3ed8ff3843839b',
          client_secret: '4c7f6f8fa93d59c45502c0ae8c4a95b',
          encrypted_data: this.encrypted_data,
          iv: this.iv,
          code: this.code
        }).then((res) => {
          this.loading = false
          console.log("getAccessToken")
          console.log(res)
          this.setAccess_token(res.data)
          console.log(this.$router)
          this.$router.replace({
            path: '/pages/index'
          })
        }).catch((error) => {
          this.loading = false
          console.log("error")
          console.log(error)
          $Toast({
            content: '登陆失败',
            type: 'error'
          });
        })
      },

      /*

      * @Authorization()
      *
      * @getSetting => 判断是否获取过微信授权
      *
      * @success =>
      * 授权成功 @isAuthorization=true @getUserInfo 拿到用户信息 @getAccessToken
      * 授权失败 @isAuthorization=false 弹出授权窗口

      */
      Authorization() {
        console.log("验证登陆请求")
        wx.getSetting({
          success: (resCode) => {
            // * 验证授权
            console.log("验证授权")
            console.log(resCode)
            if (resCode.authSetting['scope.userInfo']) {
              this.isAuthorization = false
              this.loading = true
              wx.getUserInfo({
                success: (resUser) => {
                  this.isAuthorization = false
                  // * 获取用户信息
                  console.log("获取用户信息")
                  console.log(resUser)
                  this.user = resUser
                  // * 请求 accessToken
                  this.getAccessToken()
                },
                fail: (res) => {
                  console.log(res)
                }
              })
            } else {
              console.log("未授权")
              this.isAuthorization = true
            }
          }
        })
      }
    },
    mounted() {
      console.log("开始登陆")
      wx.login({
        success: (res) => {
          this.code = res.code;
          if (this.code) {
          } else {
            console.log('获取用户登录失败：' + res.errMsg);
          }
        }
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
    position: relative;
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
    }

    .tab-bar-pic-active {}

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
