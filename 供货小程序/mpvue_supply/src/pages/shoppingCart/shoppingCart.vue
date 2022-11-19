<template>
  <div class="container">
    <div class="receipt-list">
      <receipt-module :showChecked="true" v-for="(item,index) in cartList" :key="index" :data="item" :allChecked="checked"
        :change="receiptChange" ></receipt-module>
    </div>

    <div class="receipt-nav" v-if="cartList&&cartList.length&&cartList.length>0">
      <div class="receipt-control">
        <label class="gxs-check">
          <i-checkbox i-class="gxs-checkbox" value="全选" color="#ee7559" :checked="checked" @change="handleFruitChange"></i-checkbox>
        </label>
        <div class="delete" @click="delMallCart">删除</div>
      </div>
      <div class="receipt-settlement">
        <p class="total">合计：<span class="price">￥{{price}}</span></p>
        <i-button type="primary" size="small" :disabled="checkedList.length>0?false:true" i-class="settlement-btn"
          @click="settlement" shape="circle">结算</i-button>
      </div>
    </div>
    <div v-else>
      <i-load-more tip="购物车暂无商品" :loading="loading" />
    </div>
    <i-toast id="toast" />
    <van-dialog use-slot :show="noteShow" show-cancel-button showConfirmButton @close="close" @confirm="confirmNote"
      @cancel="close">
      <textarea placeholder="请输入备注" @change="dialogTextarea($event)" class="dialog-textarea"></textarea>
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
  } = require('@/../static/iview/base/index');
  import Dialog from "@/../static/vant/dialog/dialog";
  import receiptModule from "@/components/receiptModule";
  import request from "@/api/request";
  export default {
    components: {
      receiptModule
    },
    data() {
      return {
        noteShow: false,
        noteText: '',
        note: [],
        checked: false,
        price: 0,
        eaitData: null
      }
    },
    computed: {
      ...mapState(['cartList', 'checkedList'])
    },
    methods: {
      ...mapMutations(['setCartList', 'setCheckedList', 'setNoteList', 'setCheckedNoteList']),
      close() {
        this.noteShow = false
      },
      settlement() {
        this.setCheNoteList()
        this.checked = false
        this.price = 0
        if (this.checkedList.length > 0) {
          this.$router.push({
            path: 'settlement/settlement'
          })
        }
      },
      getNote(data) {
        for (let i = 0; i < this.note.length; i++) {
          for (let attr in this.note[i]) {
            if (data.goods_id == attr) {
              return this.note[i][attr]
            }
          }
        }
      },
      dialogTextarea(e) {
        console.log(e.mp.detail.value)
        this.noteText = e.mp.detail.value
        console.log(this.noteText)
      },
      isNote() {
        console.log('调试的内容')
        console.log(this.note)
        return new Promise((resolve, reject) => {
          let isNote = false
          for (let i = 0; i < this.note.length; i++) {
            for (let a in this.note[i]) {
              console.log(this.eaitData.goods_id, a)
              if (this.eaitData.goods_id == a) {
                isNote = true
                resolve([i, a])
                break;
              }
            }
          }
          if (!isNote) {
            reject()
          }
        })
      },
      editNote(data) {
        // 增加note的商品
        this.eaitData = data
        // 打开编辑的窗口
        this.noteShow = true
        // 判断当前商品是否已经有note
        this.isNote().then((attr) => {
          // 已经有了note，将文字放到弹窗的输入框里
          this.noteText = this.note[attr[0]][attr[1]]
        }).catch((error) => {
          // 没有note，弹窗的输入框内容为空
          console.log(error)
          this.noteText = ''
        })
      },

      confirmNote() {
        console.log('点击确认以后')
        // 编辑完成以后，点击确认按钮，判断是否是编辑note
        this.isNote().then((attr) => {
          // 是编辑，新增一个obj并且将内容更新到 this.note
          let obj = {}
          obj[this.eaitData.goods_id] = this.noteText
          this.$set(this.note, attr[0], obj)
        }).catch(() => {
          // 是新增 push 到 note 里
          console.log(this)
          console.log(this.noteText)
          if (this.noteText.length > 0) {
            let obj = {}
            obj[this.eaitData.goods_id] = this.noteText
            this.note.push(obj)
          }
        })
        console.log('最新的note')
        console.log(this.note)
        // 更新nodelist
        this.setNoteList(this.note)
        // this.noteText = ''
        this.setCheNoteList()
      },
      getMallCartList() {
        request.getMallCartList({
            page: 1,
            page_num: 9999,
          })
          .then(res => {
            this.setCartList(res.data)
          });
      },
      delMallCart() {
        request.delMallCart({
            goods_ids: this.checkedList + ''
          })
          .then(res => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            this.setCheckedList([])
            this.getMallCartList()
          });
      },
      handleFruitChange(e) {
        if (e.mp.detail.current) {
          let ary = []
          this.cartList.map((item) => {
            ary.push(item.goodsId)
          })
          this.setCheckedList(ary)
        } else {
          this.setCheckedList([])
        }
        this.checked = e.mp.detail.current

      },
      setCheNoteList() {
        let list = []
        for (let i = 0; i < this.checkedList.length; i++) {
          for (let s = 0; s < this.note.length; s++) {
            for (let attr in this.note[s]) {
              if (this.checkedList[i] == attr) {
                list.push(this.note[s])
              }
            }
          }
        }
        this.setCheckedNoteList(list)
      },
      receiptChange(id, type) {
        //console.log('66666666')
        //console.log(id,type)
        if (type) {
          this.checkedList.push(id)
        } else {
          for (let i = 0; i < this.checkedList.length; i++) {
            if (this.checkedList[i] == id) {
              this.checkedList.splice(i, 1)
              continue;
            }
          }
        }
        this.setCheNoteList()

        console.log(this.checkedList)
      }
    },
    // // 下拉刷新方法，与methods方法同级
    // async onPullDownRefresh() {
    //   // to doing..
    //   // 停止下拉刷新
    //   await this.getMallCartList()
    //   wx.stopPullDownRefresh();
    // },
    // // 上拉加载，拉到底部触发
    // onReachBottom() {
    //   // 到这底部在这里需要做什么事情
    //   // this.loadMore();
    // },
    mounted() {
      this.getMallCartList();
    },
    watch: {
      checkedList() {
        if (this.checkedList.length >= this.cartList.length) {
          this.checked = true
        } else {
          this.checked = false
        }
        //console.log(this.checkedList)
       // console.log(this.cartList)
        let price = 0
        this.cartList.map((item) => {
          for (let i = 0; i < this.checkedList.length; i++) {
            //console.log(item.goodsId,this.checkedList[i])
            if (item.goodsId == this.checkedList[i]) {
               //console.log(item.specList)
              item.specList.map((chil) => {
                price += chil.goodsPrice * chil.goodsNum
              })
            }
          }
        })
       // console.log(price)
        this.price = price
      }
    }
  }

</script>

<style lang="less">
  .receipt-list {
    padding: 15px;

    .receipt {
      margin-bottom: 15px;
    }
  }

  .receipt-nav {
    background: #fff;
    position: fixed;
    bottom: 46px;
    left: 0;
    right: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 46px;

    &:after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 200%;
      height: 200%;
      transform: scale(.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      border: 0 solid #E9EAEC;
      border-top-width: 1px
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
      color: #EE7559;
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
      color: #EE7559;
      // margin-left: 5px;
    }

    .settlement-btn {
      width: 80px;
      height: 30px;
      line-height: 30px;
      background: rgba(238, 117, 89, 1);
      border-radius: 15px;
      font-size: 15px;
      color: rgba(255, 255, 255, 1);
      text-align: center;
      margin: 0;
      margin-left: 15px;
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

  .gxs-checkbox {
    label {
      display: flex;
      align-items: center;
    }
  }

</style>
