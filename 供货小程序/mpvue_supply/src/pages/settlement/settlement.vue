<template>
  <div class="container settlements">
    <div class="receipt-list" v-if="data">
      <settlement-module v-for="(item,index) in data" :key="index" :data="item" :allChecked="checked" :change="receiptChange"
        ></settlement-module>
    </div>
    <div class="list-item">
      <i-cell-group>
        <i-cell title="优惠券" :value="useCoupons?'省'+useCoupons.money+'元':'选择优惠券'" clickable is-link @click="$router.push({ path: '/pages/coupons/coupons',query: { type: 'selectCoupons',order_amount:price }})" />
      </i-cell-group>
    </div>
    <div class="blank-spaces"></div>
    <div class="list-item">
      <!--<i-cell-group>-->
        <!--<i-cell title="配送方式" :value="distribution?distribution.type:'物流/快递/自取'" clickable is-link @click="openModal" />-->
      <!--</i-cell-group>-->
      <i-cell-group>
        <i-cell title="配送方式" :value="distribution?distribution.type:'物流/快递'" clickable is-link @click="openModal" />
      </i-cell-group>
    </div>
    <div class="list-item" v-if="visibleSit&&distribution.id<2">
      <div class="list-cell sit-cell" @click="$router.push({ path: '/pages/address/address',query: { type: 'selectAddress' }})">
        <div class="list-tiele">收货地址：</div>
        <div class="list-value">
          <div class="sit-info" v-if="!goodsAddress">
            <p>请选择收货地址</p>
          </div>
          <div class="sit-info" v-if="goodsAddress">
            <p>{{goodsAddress.cityInfo+' '+goodsAddress.address}}</p>
            <p>{{goodsAddress.username+' '+goodsAddress.phone}}</p>
          </div>
        </div>
      </div>
    </div>
    <div class="list-item" v-if="visibleSit&&distribution&&distribution.id>=2">
      <div class="list-cell sit-cell">
        <div class="list-tiele">自提地址：</div>
        <div class="list-value">
          <div class="sit-info">
            <p>{{goodsAddress}}</p>
          </div>
        </div>
      </div>
    </div>
    <div class="receipt-nav">
      <div class="receipt-control">
      </div>
      <div class="receipt-settlement">
        <p class="total">合计金额：<span class="price">￥{{price-(useCoupons?useCoupons.money:0)}}</span></p>
        <div class="settlement-btn" @click="settlementOrder">提交订单</div>
      </div>
    </div>
    <i-toast id="toast" />
    <van-dialog id="van-dialog" />
    <i-modal title="请选择配送方式" :visible="visible" :actions="actions" action-mode="vertical" @iclick="selectDistribution"></i-modal>
    <i-modal title="请选择支付方式" :visible="visiblePay" :actions="actionsPay" action-mode="vertical" @iclick="pay"></i-modal>
    <van-dialog use-slot :show="noteShow" show-cancel-button showConfirmButton @close="close" @confirm="confirmNote"
      @cancel="close">
      <textarea placeholder="请输入备注" @change="dialogTextarea($event)" class="dialog-textarea"></textarea>
    </van-dialog>
    <van-dialog use-slot :show="payShow" @close="closePay">
      <div class="pay-orderAmount">
        <p>￥{{orderAmount}}</p>
        <input type="password" v-model="password" placeholder="请输入支付密码">
      </div>
    </van-dialog>
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
  import Dialog from "@/../static/vant/dialog/dialog";
  import settlementModule from "@/components/settlementModule";
  import request from "@/api/request";
  import {
    wxPay,
    onPullDownRefresh,
    getMallCartList
  } from "@/utils/index";
  export default {
    components: {
      settlementModule
    },
    data() {
      return {
        orderAmount: null,
        password: '',
        payShow: false,
        note: [],
        goods_str: '',
        noteText: "",
        noteShow: false,
        order: null,
        submitType: 1,
        data: null,
        price: 0,
        distribution: null,
        visible: false,
        visiblePay: false,
        actions: [{
            name: "物流"
          },
          {
            name: "快递"
          },
          // {
          //   name: "自取"
          // },
          {
            name: "取消",
            color: "#EE7559"
          }
        ],
        actionsPay: [{
            name: "余额支付",
            color: "#EE7559",
            pay_type: 1
          },
          {
            name: "微信支付",
            color: "#404040",
            pay_type: 2
          },
          // {
          //   name: "转账",
          //   color: "#404040",
          //   pay_type: 3
          // },
          {
            name: "取消",
            color: "#EE7559"
          }
        ],
        visibleSit: false
      };
    },
    computed: {
      ...mapState([
        "cartList",
        "checkedList",
        "useCoupons",
        "goodsAddress",
        "cartStr",
        "settlementProduct",
        "checkedNoteList",
        "userInfo"
      ])
    },
    methods: {
      ...mapMutations([
        "setGoodsAddress",
        "setPay",
        "setUserInfo",
        "changeHomeActive",
        "setNoteList",
        "setCheckedNoteList",
        "setCouponsList",
        "setUseCoupons",
        "setCartList",
        "setCheckedList",
      ]),
      close() {
        this.noteShow = false;
      },
      getNote(data) {
        if (this.checkedNoteList && this.checkedNoteList.length > 0) {
          for (let i = 0; i < this.checkedNoteList.length; i++) {
            for (let attr in this.checkedNoteList[i]) {
              console.log(data.goods_id, attr);
              if (data.goods_id == attr) {
                return this.checkedNoteList[i][attr];
              }
            }
          }
        }
      },
      dialogTextarea(e) {
        console.log(e.mp.detail.value);
        this.noteText = e.mp.detail.value;
        console.log(this.noteText);
      },
      isNote() {
        console.log("调试的内容");
        console.log(this.note);
        return new Promise((resolve, reject) => {
          let isNote = false;
          for (let i = 0; i < this.note.length; i++) {
            for (let a in this.note[i]) {
              console.log(this.eaitData.goods_id, a);
              if (this.eaitData.goods_id == a) {
                isNote = true;
                resolve([i, a]);
                break;
              }
            }
          }
          if (!isNote) {
            reject();
          }
        });
      },
      editNote(data) {
        // 增加note的商品
        this.eaitData = data;
        // 打开编辑的窗口
        this.noteShow = true;
        // 判断当前商品是否已经有note
        this.isNote()
          .then(attr => {
            // 已经有了note，将文字放到弹窗的输入框里
            this.noteText = this.note[attr[0]][attr[1]];
          })
          .catch(error => {
            // 没有note，弹窗的输入框内容为空
            console.log(error);
            this.noteText = "";
          });
      },

      async confirmNote() {
        console.log("点击确认以后");
        // 编辑完成以后，点击确认按钮，判断是否是编辑note
        await this.isNote()
          .then(attr => {
            // 是编辑，新增一个obj并且将内容更新到 this.note
            console.log("是编辑，新增一个obj并且将内容更新到 this.note ");
            let obj = {};
            obj[this.eaitData.goods_id] = this.noteText;
            this.$set(this.note, attr[0], obj);
          })
          .catch(() => {
            console.log("是新增 push 到 note 里 ");
            // 是新增 push 到 note 里
            console.log(this);
            console.log(this.noteText);
            if (this.noteText.length > 0) {
              let obj = {};
              obj[this.eaitData.goods_id] = this.noteText;
              this.note.push(obj);
            }
          });
        console.log("最新的note");
        console.log(this.note);
        // 更新nodelist
        this.setNoteList(this.note);
        // this.noteText = ''
        this.setCheNoteList();
      },
      setCheNoteList() {
        let list = [];
        console.log(2222);
        console.log(this.data, this.data.length);
        console.log(this.note, this.note.length);
        for (let i = 0; i < this.data.length; i++) {
          for (let s = 0; s < this.note.length; s++) {
            for (let attr in this.note[s]) {
              console.log(this.data[i], attr);
              if (this.data[i].goods_id == attr || this.data[i] == attr) {
                list.push(this.note[s]);
              }
            }
          }
        }
        console.log(this.checkedList);
        console.log(list);
        console.log(2222);
        this.setCheckedNoteList(list);
      },
      pay(e) {
        this.visiblePay = false;
        // 1余额支付 2-微信支付 3-转账
        let title = "";
        let message = "";
        switch (e.mp.detail.index) {
          case 0:
            title = "余额支付";
            message = "将使用平台余额支付货款！";
            break;
          // case 1:
          //   this.setPay({
          //     pay_type: this.actionsPay[e.mp.detail.index].pay_type,
          //     pay_from: 1,
          //     order_no: this.order.order_no,
          //     order_id: this.order.order_no
          //   });
          //   break;
          case 1: // 微信支付
            this.wxPayAmount({
              pay_type: this.actionsPay[e.mp.detail.index].pay_type,
              order_no: this.order.order_no,
              pay_pass: this.password,
            })
            return;
          case 2:
            this.$router.push({
              path: '/pages/orderInfo/orderInfo',
              query: {
                order_id: this.order.order_no
              }
            })
            break;
          default:
            return;
        }
        Dialog.confirm({
            title,
            message
          })
          .then(() => {
            request.payConfirmMoney({
              pay_type: e.mp.detail.index,
              order_no: this.order.order_no
            }).then(payConfirmMoney => {

              this.orderAmount = payConfirmMoney.data.order_amount
              let data = {
                pay_type: this.actionsPay[e.mp.detail.index].pay_type,
                pay_from: 1,
                order_no: this.order.order_no
              }
              this.payAmount(data)
            }).catch(error => {
              $Toast({
                content: res.message,
                type: res.code == 0 ? "success" : "warning"
              });
            });
          })
          .catch(() => {
            console.log("取消");
          });
      },
      wxPayAmount(data) {
        wxPay(data).then(res => {
          this.password = ''
          request.getUserInfo().then(u => {
            this.setUserInfo(u.data);
            this.$router.push({
              path: "/pages/paySuccess/paySuccess",
            });
          }).catch(error => {
            $Toast({
              content: error.message,
              type: "error"
            });
          });
        })
      },
      closePay(e) {
        this.payShow = false
        if (e.mp.detail === 'confirm') {
          // 异步关闭弹窗
          this.confirmPay()
        }
      },
      confirmPay() {
        this.payAmount({
          pay_type: this.actions[0].pay_type,
          pay_from: 1,
          order_no: this.order_sn,
          pay_pass: this.password
        })
      },
      payAmount(data) {
        request.pay(data).then(res => {
          console.log(res)
          if (res.code == 0) {
            $Toast({
              content: res.message,
              type: res.code == 0 ? "success" : "warning"
            });
            this.setCheckedList([])
            onPullDownRefresh()
            request.getUserInfo().then(u => {
              this.setUserInfo(u.data);
              this.$router.push({
                path: "/pages/orderInfo/orderInfo",
                query: {
                  order_id: this.order.order_no
                }
              });
            });
          } else {
            $Toast({
              content: res.message,
              type: "warning"
            });
          }
        }).catch(error => {
          $Toast({
            content: error.message,
            type: "warning"
          });
          this.$router.push({
            path: "/pages/orderInfo/orderInfo",
            query: {
              order_id: this.order.order_no
            }
          });
        });
      },
      hanblerCheckedList() {
        let data = [];
        console.log(this.cartList)
        for (let i = 0; i < this.cartList.length; i++) {
          for (let n = 0; n < this.checkedList.length; n++) {
            if (this.cartList[i].goodsId == this.checkedList[n]) {
              data.push(this.cartList[i]);
            }
          }
        }
        console.log(data)
        this.data = data;
      },
      selectDistribution(e) {
        this.closeModal();
        if (e.mp.detail.index < 3) {
          this.setGoodsAddress(null);
          this.distribution = {
            type: this.actions[e.mp.detail.index].name,
            id: e.mp.detail.index
          };
          if (this.distribution.id <= 1) {
            this.visibleSit = true;
          } else {
            this.visibleSit = true;
            request.getSelfShipping().then(res => {
              this.setGoodsAddress(res.data);
              console.log(res);
            });
          }
        }
      },
      openModal() {
        this.visible = true;
      },
      closeModal() {
        this.visible = false;
      },
      getTotalPrice() {
        let price = 0;
        //console.log(this.data)
        this.data.map(item => {
          //console.log(item)
          item.specList.map(chil => {
            //console.log(chil)
            price += chil.goodsPrice * chil.goodsNum;
          });
        });
        //console.log(price)
        this.price = price;
      },
      settlementOrder() {
        if (!this.distribution) {
          $Toast({
            content: "请选择收货方式",
            type: "warning"
          });
          return;
        }
        if (!this.goodsAddress) {
          $Toast({
            content: "请选择收货地址",
            type: "warning"
          });
          return;
        }

        // if (this.userInfo.is_auth != 1) {
        //   Dialog.alert({
        //     title: '系统提示',
        //     message: '请先去认证哦,才能操作！'
        //   }).then(() => {
        //     this.changeHomeActive(4)
        //     this.$router.push({
        //       path: '/pages/index'
        //     })
        //   });
        //   return
        // }

        if (this.submitType == 2) {
          let obj = {
            orderFrom: 2,
            cartVO: this.goods_str,
            //receive_type: this.distribution.id + 1,
            addressId: this.goodsAddress.id
          };
          if (this.useCoupons) {
            obj["couponId"] = this.useCoupons.id;
          }
          request
            .getOrderSubmit(obj)
            .then(res => {

              this.visiblePay = true;
              this.order = res.data;
              this.setCouponsList([]);
              this.setUseCoupons(null);
            })
            .catch(res => {
              $Toast({
                content: res.message,
                type: res.code == 0 ? "success" : "warning"
              });
            });
        } else {
          let obj = {
            orderFrom: 1,
            goodsIds: this.checkedList + "",
            //receive_type: this.distribution.id + 1,
            addressId: this.goodsAddress.id,
          };
          let remarks = [];
          if (this.checkedNoteList.length > 0) {
            for (let i = 0; i <= this.checkedNoteList.length; i++) {
              for (let attr in this.checkedNoteList[i]) {
                remarks.push({
                  goods_id: attr,
                  remark: this.checkedNoteList[i][attr]
                });
              }
            }
            //obj["goods_remarks"] = JSON.stringify(remarks)
          }
          if (this.useCoupons) {
            obj["couponId"] = this.useCoupons.id;
          }
          request.getOrderSubmit(obj).then(res => {
            // $Toast({
            //   content: '订单提交成功,支付迁移中',
            //   type: res.code == 0 ? "success" : "warning"
            // });
            //
            this.visiblePay = true;
            this.order = res.data;
            getMallCartList();
          }).catch(res => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? "success" : "warning"
            });
          });
        }
      }
    },
    mounted() {
     // console.log(this.$route.query);
      if (this.$route.query.type == "settlement") {
        this.submitType = 2;
        let ary = [];
        let data = {};
        //console.log(this.settlementProduct.goods_str)
        data.goodsId = this.settlementProduct.detail.goodsId;
        data.goodsLogo = this.settlementProduct.detail.goodsLogo;
        data.goodsName = this.settlementProduct.detail.goodsName;
        data.goodsSn = this.settlementProduct.detail.goodsSn;
        this.goods_str = this.settlementProduct.goods_str
        //console.log(this.settlementProduct.select)
        data.specList = [{
          goodsPrice: this.settlementProduct.select.price, //单价
          goodsNum: this.settlementProduct.select.goodsNum //数量
        }];
        // for (let attr in this.settlementProduct.spec_price) {
        //   for (
        //     let i = 0; i < this.cartStr[this.$route.query.goods_id].length; i++
        //   ) {
        //     let obj = {};
        //     if (attr == this.cartStr[this.$route.query.goods_id][i].spec_key) {
        //       obj.goods_price = this.settlementProduct.spec_price[attr].price;
        //       obj.goods_num = this.cartStr[this.$route.query.goods_id][
        //         i
        //       ].goods_num;
        //       data.spec_list.push(obj);
        //     }
        //   }
        // }
        ary.push(data);
        this.data = ary;
        console.log(this.data)
        this.getTotalPrice();
      } else {
        this.submitType = 1;
        this.hanblerCheckedList();
        this.getTotalPrice();
      }
    },
    watch: {},
    onHide() {},
    onUnload() {
      console.log(2222)
      this.setCheckedList([])
    },
  };

</script>

<style lang="less">
  .settlements {
    background: #fff;
  }

  .receipt-list {
    padding: 15px;

    .settlement {
      margin-bottom: 15px;
    }
  }

  .receipt-nav {
    background: #fff;
    position: fixed;
    bottom: 0px;
    left: 0;
    right: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 46px;

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

  .receipt-control {
    display: flex;
    align-items: center;
    padding-left: 15px;

    .gxs-check {
      display: flex;
      align-items: center;

      p {
        font-size: 14px;
        color: #606060;
        z-index: 9;
      }
    }

    .checkbox {
      margin-right: 5px;
    }

    .delete {
      margin-left: 10px;
      font-size: 14px;
      color: #ee7559;
    }
  }

  .receipt-settlement {
    display: flex;
    align-items: center;
    padding-right: 15px;

    .total {
      font-size: 14px;
      color: rgba(96, 96, 96, 1);
    }

    .price {
      font-size: 15px;
      color: #ee7559;
      // margin-left: 5px;
    }

    .settlement-btn {
      margin-left: 15px;
      width: 80px;
      height: 30px;
      line-height: 30px;
      background: rgba(238, 117, 89, 1);
      border-radius: 15px;
      font-size: 15px;
      color: rgba(255, 255, 255, 1);
      text-align: center;
    }
  }

  .list-item {
    .list-cell.sit-cell {
      display: flex;

      .list-tiele {
        padding: 5px 15px;
        font-size: 12px;
        line-height: 1.5em;
        color: rgba(96, 96, 96, 1);
      }

      .list-value {
        flex: 1;
        padding: 5px;
        display: flex;
        align-items: center;
        background: rgba(249, 249, 249, 1);
        border-radius: 5px;
        overflow: hidden;
        margin-right: 13px;
        position: relative;

        :after {
          content: " ";
          display: inline-block;
          width: 6px;
          height: 6px;
          position: absolute;
          top: 50%;
          right: 2px;
          border-width: 1px 1px 0 0;
          border-color: #dddee1;
          border-style: solid;
          transform: translateY(-50%) matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
        }
      }

      .sit-info {
        flex: 1;
        margin-right: 10px;

        p {
          font-size: 12px;
          color: rgba(160, 160, 160, 1);
          line-height: 1.5em;
          text-align: right;
        }
      }
    }
  }

  .dialog-textarea {
    width: 100%;
    padding: 15px;
    font-size: 14px;
    color: #000;
    height: 100px;
    box-sizing: border-box;
  }

</style>
