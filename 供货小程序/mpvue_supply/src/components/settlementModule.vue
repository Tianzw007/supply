<template>
  <div class="settlement" v-if="data">
    <div class="settlement-header">
      <div class="settlement-pic">
        <img  mode="widthFix"  :src="data.goodsLogo" />
      </div>
      <div class="settlement-info">
        <p class="settlement-title">{{data.goodsName}} {{data.goodsSn}}</p>
        <!--<div class="receipt-note" @click="changeNote">-->
          <!--<p class="receipt-note-type">备注：</p>-->
          <!--<p class="receipt-note-describe">-->
            <!--<span>-->
              <!--<span v-if="note">{{note}}</span>-->
            <!--</span>-->
            <!--<i-icon type="enter" />-->
          <!--</p>-->
        <!--</div>-->
        <div class="settlement-option">
          <p class="settlement-price">￥{{price}}</p>
          <p class="settlement-num">X{{num}}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['data', 'note', 'editNote'],
    data() {
      return {
        price: null,
        num: null
      }
    },
    methods: {
      changeNote() {
        if (this.editNote) {
          this.editNote(this.data)
        }
      },
      getTotalPrice() {
        let price = 0
        let num = 0
        //console.log(this.data.spec_list)
        this.data.specList.map((item) => {
          price += Number(item.goodsPrice) * item.goodsNum
          num += item.goodsNum
        })
        this.price = price
        this.num = num
      }
    },
    mounted() {
      this.getTotalPrice()
    },
    watch: {
      data() {
        this.getTotalPrice()
      },
    }
  }

</script>

<style lang="less">
  .settlement {
    background: #F9F9F9;
    padding: 15px;
    border-radius: 5px;

    .settlement-header {
      display: flex;
      align-items: center;
    }

    .settlement-pic {
      width: 80px;
      height: 80px;
      border-radius: 4px;
      overflow: hidden;
      margin-right: 15px;

      img {
        width: 100%;
        height: 100%;
        display: block;
      }
    }


    .settlement-info {
      flex: 1;

      .settlement-title {
        font-size: 14px;
        color: rgba(96, 96, 96, 1);
        line-height: 1em;
      }

      .settlement-note {
        margin-top: 6px;
        display: flex;
        align-items: flex-start;

        .settlement-note-type {
          font-size: 10px;
          color: rgba(96, 96, 96, 1);
          white-space: nowrap;
          padding: 5px 0;
        }

        .settlement-note-describe {
          flex:1;
          padding: 5px;
          font-size: 10px;
          color: rgba(160, 160, 160, 1);
          background: #FFFFFF;
          border-radius: 5px;
          position: relative;
          display: flex;
          align-items: center;

          span {
            flex: 1;
          }

        }
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
      .settlement-price {
        font-size: 14px;
        color: rgba(238, 117, 89, 1);
        line-height: 1em;
      }
    }
  }

  .settlement-option {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 6px;

    .settlement-num {
      font-size: 14px;
      color: #606060;
      line-height: 1em;
    }
  }

</style>
