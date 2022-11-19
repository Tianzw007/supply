<template>
  <div class="container address">
    <i-panel>
      <i-input :value="pass" title="余额支付密码" @change="change($event,'pass')" placeholder="请输入余额支付密码" />
      <i-input :value="repass" title="再次输入密码" @change="change($event,'repass')" placeholder="请再次输入余额支付密码" />
    </i-panel>
    <div class="address-controller">
      <div class="add-address" @click="postAddress">保存</div>
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
  import areas from "@/utils/area";
  import request from "@/api/request";
  export default {
    components: {},

    data() {
      return {
        pass: '', //	String	支付密码
        repass: '', //	String	重复密码
      };
    },
    computed: {
      ...mapState(['addressList', 'changeAddress'])
    },
    methods: {
      ...mapMutations(['deleteAddress', 'setGoodsAddress', 'setAddressList']),
      change(e, key) {
        this[key] = e.mp.detail.detail.value
      },
      postAddress() {
        if (!this.pass) {
          $Toast({
            content: '请输入余额支付密码',
            type: 'error'
          });
          return
        }
        if (!this.repass) {
          $Toast({
            content: '请再次输入余额支付密码',
            type: 'error'
          });
          return
        }
        request
          .userSetPassword({
            pass: this.pass,
            repass: this.repass,
          })
          .then(res => {
            console.log(res)
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            if (res.code == 0) {
              setTimeout(() => {
                this.$router.back()
              }, 2000)
            }
          }).catch((res) => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'error'
            });
          });
      },
    },
    mounted() {}
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

  .address-controller {
    margin-top: 30px;
  }

  .address-edit {
    width: 38px;
    height: 38px;
  }

  .add-address {
    height: 49px;
    background: #fff;
    line-height: 49px;
    font-size: 15px;
    color: rgba(238, 117, 89, 1);
    text-align: center;
    margin-top: 14px;

  }

  .address {
    .select-city-cell {
      padding-top: 0;
      padding-bottom: 0;
    }
  }

  .select-city {
    margin: 0 -15px;
  }

  .no-border {
    border: 0;

    &:after {
      display: none;
    }
  }

</style>
