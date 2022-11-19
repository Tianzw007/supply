<template>
  <div class="container substituting">
    <i-panel>
      <i-input :value="username" title="联系人" @change="change($event,'username')" placeholder="名字" />
      <i-input :value="phone" title="手机号：" @change="change($event,'phone')" placeholder="请输入手机号" />
      <i-cell is-link i-class="select-city-cell">
        <picker mode="multiSelector" @change="bindPickerChange" @columnchange="bindColumnPickerChange" :value="index"
          range-key="name" :range="array" class="select-city">
          <i-input :value="city_info" title="收货地址：" disabled="disabled" placeholder="收货人所在地址" i-class="" />
        </picker>
      </i-cell>
      <i-input :value="address" type="textarea" title=" " @change="change($event,'address')" i-class="no-border"
        placeholder="详细地址楼栋号 门牌号" />
    </i-panel>
    <div class="blank-spaces"></div>
    <i-panel>
      <i-input :value="product_info" type="textarea" title="产品：" @change="change($event,'product_info')" i-class="no-border"
        placeholder="参考：#1234 蓝色 180*220cm *1" />
    </i-panel>
    <div class="substituting-controller">
      <div class="add-substituting" @click="postSubsSingeDddEdit">保存</div>
      <div class="add-substituting" v-if="isEdit" @click="delSubsSinge">删除</div>
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
        isEdit: false,
        index: [0, 0, 0],
        array: null,
        id: null,
        username: '', //	String	联系人
        phone: '', //	String	手机号
        city_info: '', //	String	收货地址城市信息
        address: '', //	String	详细地址
        product_info: '', //	String	产品信息
        actions: [{
          name: '删除',
          color: '#fff',
          fontsize: '20',
          width: 100,
          background: '#ed3f14'
        }]
      };
    },
    computed: {
      ...mapState(['addressList', 'changeSubstituting'])
    },
    methods: {
      ...mapMutations(['setAddressList', 'setGoodsAddress', 'setSbsOrderLists', 'setSubsLists']),
      change(e, key) {
        this[key] = e.mp.detail.detail.value
        console.log(e.mp.detail.detail.value)
      },
      bindPickerChange(e) {
        console.log(this)
        this.city_info =
          `${this.array[0][e.mp.detail.value[0]].name}${this.array[1][e.mp.detail.value[1]].name}${this.array[2][e.mp.detail.value[2]].name}`
      },
      bindColumnPickerChange(e) {
        this.$set(this.index, e.mp.detail.column, e.mp.detail.value)
        this.getArray(e.mp.detail)
      },
      getSubsLists() {
        // 列表
        request
          .getSubsLists({
            page: 1,
            page_num: 9999
          })
          .then(res => {
            this.setSubsLists(res.data);
          });
      },
      getSbsOrderLists() {
        // 获取订单列表
        request
          .getSbsOrderLists({
            page: 1,
            page_num: 9999
          })
          .then(res => {
            this.setSbsOrderLists(res.data);
          });
      },
      postSubsSingeDddEdit() {
        // 获取收藏列表
        if (!this.username) {
          $Toast({
            content: '请输入姓名',
            type: 'error'
          });
          return
        }
        if (!this.phone) {
          $Toast({
            content: '请输入手机号',
            type: 'error'
          });
          return
        }
        if (!this.city_info) {
          $Toast({
            content: '请选择地区',
            type: 'error'
          });
          return
        }
        if (!this.address) {
          $Toast({
            content: '请输入详细地址',
            type: 'error'
          });
          return
        }
        if (!this.product_info) {
          $Toast({
            content: '请输入产品信息',
            type: 'error'
          });
          return
        }
        let data = {
          username: this.username,
          phone: this.phone,
          city_info: this.city_info,
          address: this.address,
          product_info: this.product_info,
        }
        if (this.id) {
          data['id'] = this.id
        }
        request
          .postSubsSingeDddEdit(data)
          .then(res => {
            console.log(res)
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'error'
            });
            if (res.code == 0) {
              this.getSubsLists()
              this.getSbsOrderLists()
              setTimeout(() => {
                clearTimeout()
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
      selectAddress(data) {
        if (this.$route.query.type == 'selectAddress') {
          this.setGoodsAddress(data)
          this.$router.back()
        }
      },
      getArray(option) {
        console.log(option)
        let province = []
        let city = []
        let area = []
        if (!option) {
          this.array = [
            [],
            [],
            []
          ]
          for (let i = 0; i < areas.length; i++) {
            if (areas[i].level == 1) {
              province.push(areas[i])
            }
          }
          this.$set(this.array, 0, province)
          for (let i = 0; i < areas.length; i++) {
            if (areas[i].level == 2) {
              if (areas[i].sheng == this.array[0][0].sheng) {
                city.push(areas[i])
              }
            }
          }
          this.$set(this.array, 1, city)
          for (let i = 0; i < areas.length; i++) {
            if (areas[i].level == 3) {
              if (areas[i].sheng == this.array[1][0].sheng && areas[i].di == this.array[1][0].di) {
                area.push(areas[i])
              }
            }
          }
          this.$set(this.array, 2, area)
        }
        // column value

        if (option) {
          if (option.column == 0) {
            for (let i = 0; i < areas.length; i++) {
              if (areas[i].level == 2) {
                if (areas[i].sheng == this.array[option.column][option.value].sheng) {
                  city.push(areas[i])
                }
              }
            }
            this.$set(this.array, 1, city)
            for (let i = 0; i < areas.length; i++) {
              if (areas[i].level == 3) {
                if (areas[i].sheng == this.array[option.column + 1][0].sheng && areas[i].di == this.array[option.column +
                    1][0].di) {
                  area.push(areas[i])
                }
              }
            }
            this.$set(this.array, 2, area)
          }
          if (option.column == 1) {
            for (let i = 0; i < areas.length; i++) {
              if (areas[i].level == 3) {
                if (areas[i].sheng == this.array[option.column][option.value].sheng && areas[i].di == this.array[option
                    .column][option.value].di) {
                  area.push(areas[i])
                }
              }
            }
            this.$set(this.array, 2, area)
          }
        }
      },
      delSubsSinge() {
        // 删除 delSubsSinge
        request
          .delSubsSinge({
            id: this.$route.query.id
          })
          .then(res => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            if (res.code == 0) {
              setTimeout(() => {
                clearTimeout()
                this.$router.back()
              }, 2000)
            }
          });
      }
    },
    mounted() {
      this.getArray()
      // 修改模式
      if (this.$route.query.type == 'edit') {
        this.isEdit = true
        this.id = this.$route.query.id
        this.username = this.changeSubstituting.username;
        this.phone = this.changeSubstituting.phone;
        this.city_info = this.changeSubstituting.city_info;
        this.address = this.changeSubstituting.address;
        this.product_info = this.changeSubstituting.product_info;
      }
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

  .substituting-controller {
    margin-top: 30px;
  }

  .substituting-edit {
    width: 38px;
    height: 38px;
  }

  .add-substituting {
    height: 49px;
    background: #fff;
    line-height: 49px;
    font-size: 15px;
    color: rgba(238, 117, 89, 1);
    text-align: center;
    margin-top: 14px;

  }

  .substituting {
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
