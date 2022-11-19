<template>
  <div class="container evaluation">
    <div class="evaluation-box" v-if="evaluationList&&content" v-for="(item, index) in evaluationList.goods_list" :key="index">
      <div class="evaluation-box-hd">
        <img :src="item.goods_logo" alt="">
        <p>{{item.goods_name}}</p>
      </div>
      <textarea v-model="content[index].content" rows="10" class="evaluation-textarea"></textarea>
    </div>
    <div class="address-controller">
      <div class="add-address" @click="postAddress">发布评价</div>
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
  import request from "@/api/request";
  import {
    onPullDownRefresh
  } from '@/utils/index'
  export default {
    components: {},
    data() {
      return {
        content: null, //	String	详细地址
      };
    },
    computed: {
      ...mapState(['evaluationList'])
    },
    methods: {
      ...mapMutations(['deleteAddress', 'setGoodsAddress', 'setAddressList']),
      postAddress() {
        request
          .submitComment({
            order_id: this.evaluationList.order_id,
            comments: JSON.stringify(this.content)
          })
          .then(res => {
            console.log(res)
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'warning'
            });
            onPullDownRefresh()
            this.$router.push({
              path: '/pages/orderInfo/orderInfo',
              query: {
                order_id: this.evaluationList.order_id
              }
            })
          }).catch((res) => {
            $Toast({
              content: res.message,
              type: res.code == 0 ? 'success' : 'error'
            });
            
          });
      },
    },
    mounted() {
      let content = []
      for (let i = 0; i < this.evaluationList.goods_list.length; i++) {
        content.push({
          goods_id: this.evaluationList.goods_list[i].goods_id,
          content: ''
        })
      }
      this.content = content
      console.log(this.evaluationList)
    }
  };

</script>

<style lang="less">
  .evaluation-textarea {
    width: 100%;
    padding: 8px 15px;
    font-size: 14px;
    color: #606060;
  }

  .evaluation-box {
    margin-top: 10px;
    background: #fff;

    .evaluation-box-hd {
      border-bottom: 1rpx solid #f8f8f8;
      display: flex;
      align-items: center;
      padding: 5px 15px;

      img {
        width: 30px;
        height: 30px;
        margin-right: 20px;
      }

      p {
        font-size: 14px;
        color: #606060;
      }
    }
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

</style>
