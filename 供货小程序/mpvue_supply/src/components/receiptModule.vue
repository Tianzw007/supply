<template>
  <div class="receipt" v-if="data" :class="{'receipt-hide':hideChecked}">
    <div class="receipt-header">
      <div class="receipt-check" v-if="showChecked">
        <i-checkbox i-class="gxs-checkbox" color="#ee7559" :checked="checked" @change="handleFruitChange"></i-checkbox>
      </div>
      <div class="receipt-pic">
        <img mode="widthFix" :src="data.goodsLogo" />
      </div>
      <div class="receipt-info">
        <p class="receipt-title">{{data.goodsName}} {{data.goodsSn}}</p>
        <!--<div class="receipt-note" @click="changeNote">-->
          <!--<p class="receipt-note-type">备注：</p>-->
          <!--<p class="receipt-note-describe">-->
            <!--<span>-->
              <!--<span v-if="note">{{note}}</span>-->
            <!--</span>-->
            <!--<i-icon type="enter" />-->
          <!--</p>-->
        <!--</div>-->
        <p class="receipt-price">￥{{price}}</p>
      </div>
    </div>
    <div class="receipt-body" v-if="open">
      <div class="receipt-specifications" @click="$router.push({ path: '/pages/productInfo/productInfo', query: { goods_id: data.goodsId } }) ">
        <div class="receipt-specifications-header">
          <div class="receipt-specifications-tr">
            <!--<p class="receipt-specifications-th receipt-speci">规格</p>-->
            <p class="receipt-specifications-th receipt-price">单价</p>
            <p class="receipt-specifications-th receipt-num">数量</p>
          </div>
        </div>
        <div class="receipt-specifications-body">
          <div class="receipt-specifications-tr" v-for="(item , index) in data.specList" :key="index">
            <div class="receipt-specifications-td receipt-speci">{{item.specKeyName}}</div>
            <div class="receipt-specifications-td receipt-price">￥{{item.goodsPrice}}</div>
            <div class="receipt-specifications-td receipt-num">{{item.goodsNum}}</div>
          </div>
        </div>
      </div>
    </div>
    <div class="receipt-footer">
      <div class="receipt-swich receipt-down" v-if="!open" @click.stop="changeOpen(true)">
        <i-icon type="unfold" size="16" color="#D8D8D8" />
        <p>查看更多规格</p>
      </div>
      <div class="receipt-swich receipt-up" v-if="open" @click.stop="changeOpen(false)">
        <i-icon type="packup" size="16" color="#D8D8D8" />
        <p>收起</p>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['data', 'allChecked', 'change', 'showChecked', 'note', 'editNote'],
    data() {
      return {
        open: false,
        price: null,
        checked: false,
      }
    },
    methods: {
      changeNote() {
        if (this.editNote) {
          this.editNote(this.data)
        }
      },
      changeOpen(val) {
        this.open = val
      },
      changeCheckbox() {},
      handleFruitChange(e) {
        this.checked = e.mp.detail.current
        //console.log(this.checked,e.mp.detail.current)
        this.change(this.data.goodsId, e.mp.detail.current)
      },
      getTotalPrice() {
        let price = 0
        //console.log(this.data.specList)
        if(this.data.specList){
          this.data.specList.map((item) => {
            price += item.goodsPrice * item.goodsNum
          })
        }

        this.price = price
      }
    },
    mounted() {
      this.getTotalPrice()
    },
    watch: {
      data() {
        this.getTotalPrice()
      },
      allChecked() {
        this.checked = this.allChecked
      }
    }
  }

</script>

<style lang="less">
  .gxs-checkbox {
    margin-left: -5px;
    margin-right: -5px;
    transform: scale(.9, .9);

    .cell {
      padding: 0 10px;
    }
  }

  .receipt-check {
    overflow: hidden;
  }

  .gxs-check {

    .checkbox {
      border: 1px solid #CFCFCF;
      display: block;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      overflow: hidden;

      &:checked {
        &+.icon {
          background: red;
        }
      }
    }

    .icon {
      // border: 1px solid #CFCFCF;
      // display: block;
      // width: 18px;
      // height: 18px;
      // border-radius: 50%;
    }
  }

  .receipt {
    background: #fff;

    .receipt-header {
      display: flex;
      align-items: center;
      padding-top: 15px;
    }

    .receipt-pic {
      width: 80px;
      height: 80px;
      border-radius: 4px;
      overflow: hidden;
      margin-left: 15px;

      img {
        width: 100%;
        height: 100%;
        display: block;
      }
    }


    .receipt-info {
      flex: 1;
      padding: 0 15px 0;

      .receipt-title {
        font-size: 14px;
        color: rgba(96, 96, 96, 1);
        line-height: 1em;
      }

      .receipt-note {
        width: 100%;
        margin-top: 6px;
        display: flex;
        align-items: flex-start;

        .receipt-note-type {
          font-size: 10px;
          color: rgba(96, 96, 96, 1);
          white-space: nowrap;
          padding: 5px 0;
        }

        .receipt-note-describe {
          flex: 1;
          padding: 5px;
          font-size: 10px;
          color: rgba(160, 160, 160, 1);
          background: rgba(252, 252, 252, 1);
          border-radius: 5px;
          position: relative;
          display: flex;
          align-items: center;

          span {
            flex: 1;
          }

        }
      }

      .receipt-price {
        margin-top: 6px;
        font-size: 14px;
        color: rgba(238, 117, 89, 1);
        line-height: 1em;
      }
    }

    .receipt-body {
      padding-left: 47px;

      .receipt-specifications {
        background: rgba(252, 252, 252, 1);
        border-radius: 5px;
        margin-top: 15px;

        .receipt-specifications-header {
          border-bottom: 1px solid rgba(247, 247, 247, 1);
        }

        .receipt-specifications-body {
          padding-bottom: 8px;

          .receipt-price {
            color: #EE7559;
          }
        }

        .receipt-specifications-tr {
          display: flex;
          justify-content: space-around;
        }

        .receipt-specifications-th {
          line-height: 25px;
          font-size: 12px;
          color: rgba(160, 160, 160, 1);
          text-align: center;
        }


        .receipt-specifications-tr {}

        .receipt-specifications-td {
          margin-top: 10px;
          font-size: 12px;
          color: rgba(160, 160, 160, 1);
          text-align: center;
        }
      }
    }

    .receipt-footer {
      padding-left: 142px;

      .receipt-swich {
        padding: 10px 0;
        display: flex;
        align-items: center;
      }

      p {
        margin-left: 15px;
        font-size: 12px;
        color: rgba(160, 160, 160, 1);
      }

    }

    .receipt-model {
      flex: 2;
    }

    .receipt-speci {
      flex: 4;
    }

    .receipt-price {
      flex: 1;
    }

    .receipt-num {
      flex: 1;
    }

  }

  .receipt-hide {
    .receipt-header {
      padding-left: 15px;
    }

    .receipt-body {
      padding-left: 15px;
    }

    .receipt-footer {
      padding-left: 110px;
    }
  }

</style>
