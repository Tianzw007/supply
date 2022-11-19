<template>
  <div class="container certification">
    <div class="certification-phone" v-if="step==0">
      <div class="certification-content">
        <p class="certification-title">输入手机号</p>
        <p class="certification-subtitle"></p>
        <div class="certification-controller">
          <input class="certification-input certification-input-phone" type="text" v-model="phone">
        </div>
      </div>
      <div class="cell-btn-controller">
        <i-button type="primary" size="small" @click="nextSend" i-class="cell-btn" shape="circle">下一步</i-button>
      </div>
    </div>
    <div class="certification-info" v-if="step==1">
      <div class="certification-content">
        <p class="certification-title">输入验证码</p>
        <p class="certification-subtitle">验证码已发至{{phone}}</p>
        <div class="certification-controller">
          <div class="cell-group">
            <van-cell-group>
              <van-field :value="code" placeholder="请输入短信验证码" @change="handleChange($event,'code')" use-button-slot>
                <span slot="button" v-if="countdown>0">{{countdown}}S后重新发送</span>
                <span slot="button" v-if="countdown<=0" @click="sendCode">发送验证码</span>
              </van-field>
              <van-field :value="true_name" placeholder="务必填写真实姓名" @change="handleChange($event,'true_name')">
                <span slot="label" class="rzxm">认证姓名：</span>
              </van-field>
            </van-cell-group>
          </div>
        </div>
      </div>
      <div class="cell-btn-controller">
        <i-button type="primary" size="small" @click="sendCertification" i-class="cell-btn" shape="circle">提交认证</i-button>
      </div>
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
  } = require('@/../static/iview/base/index');
  import request from "@/api/request";
  import {
    getUserInfo,
  } from '@/utils/index'
  export default {
    data() {
      return {
        phone: '',
        code: '',
        true_name: '',
        step: 0,
        countdown: 60,
      };
    },
    methods: {
      handleChange(e, type) {
        console.log(e.mp.detail)
        this[type] = e.mp.detail
      },
      nextSend() {
        this.sendCode((res) => {
          if (res.code == 0) {
            this.step = 1
          }
        })
      },
      sendCode(callback) {
        if (this.checkPhone(this.phone)) {
          $Toast({
            content: '发送中',
            type: 'loading',
            duration: 0
          });
          request.sendCode({
            phone: this.phone
          }).then(res => {
            $Toast.hide()
            callback ? callback(res) : null
            this.sendCountdown()
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            })
          }).catch(error => {
            $Toast.hide()
            $Toast({
              content: '请求失败',
              type: 'error'
            })
          });
        } else {
          $Toast({
            content: '手机号格式错误',
            type: 'warning'
          });
        }
      },
      checkPhone(value) {
        if (/^1[34578]\d{9}$/.test(value)) {
          return true;
        } else {
          return false
        }
      },
      sendCountdown() {
        let time = setInterval(() => {
          let countdown = this.countdown
          countdown--
          this.countdown = countdown
          if (this.countdown <= 0) {
            clearInterval(this.time)
          }
        }, 1000)
      },
      sendCertification() {
        if (!this.phone) {
          $Toast({
            content: '请填写手机号',
            type: 'error'
          });
          return
        }
        if (!this.code) {
          $Toast({
            content: '请输入验证码',
            type: 'error'
          });
          return
        }
        if (!this.true_name) {
          $Toast({
            content: '请输入真实姓名',
            type: 'error'
          });
          return
        }
        $Toast({
          content: '认证中',
          type: 'loading',
          duration: 0
        });
        request.submitAuth({
          phone: this.phone,
          code: this.code,
          true_name: this.true_name,
        }).then(res => {
          $Toast.hide()
           $Toast({
            content: res.message,
            type: res.code == 0 ? 'success' : 'warning'
          });
          getUserInfo()
          if (res.code == 0) {
            this.$router.push({
              path: '/pages/index'
            })
          }
         
        }).catch(error => {
          $Toast.hide()
          $Toast({
            content: '请求失败',
            type: 'error'
          })
        });
      }
    },
    mounted() {},
  };

</script>

<style lang="less">
  .certification {
    background: #fff;
  }

  .certification-content {
    padding: 15px;
    padding-top: 90px;
    background: #fff;

    .certification-title {
      font-size: 24px;
      font-weight: 500;
      line-height: 1em;
      margin: 15px 0;
      text-align: center;
      color: rgba(0, 0, 0, 1);
      margin-bottom: 10px;
    }

    .certification-subtitle {
      margin-bottom: 40px;
      font-size: 12px;
      font-weight: 500;
      line-height: 1em;
      margin-top: 8px;
      text-align: center;
      color: #A0A0A0;
    }

    .certification-controller {
      position: relative;
      overflow: hidden;

      .cell-group {
        flex: 1;
        margin-top: -1px;
      }

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
        border-bottom-width: 1px;
      }

      .certification-unit {
        font-size: 26px;
        color: #606060;
        margin-right: 15px;
      }

      .certification-input {
        height: 52px;
        font-size: 26px;
        color: #000;
      }

    }

    .certification-input-phone {
      text-align: center;
      width: 100%;
    }


    .certification-hint {
      font-size: 13px;
      color: rgba(160, 160, 160, 1);
      line-height: 1em;
      margin-top: 15px;
    }

    .cell-btn-controller {
      width: 235px;

    }
  }

  .rzxm {
    font-size: 18px;
    color: rgba(68, 68, 68, 1);
  }

</style>
