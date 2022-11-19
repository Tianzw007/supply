<template>
  <div class="product" @click="$router.push({ path: '/pages/productInfo/productInfo', query: { goods_id: data.goodsId } }) ">
    <div class="product-pic">
      <img mode="widthFix" :src="data.goodsLogo" />
    </div>
    <div class="product-info">
      <div class="product-header">
        <p class="product-name">{{data.goodsName}} {{data.goodsSn}}</p>
      </div>
      <!--<div class="product-body">-->
        <!--<p v-for="(attr,attrsIndex) in data.goods_attrs" :key="attrsIndex">{{attr.attr_name}}：{{attr.attr_value}}</p>-->
      <!--</div>-->
      <div class="product-footer">
        <p class="product-price">￥{{data.marketPrice}}</p>
        <div class="product-controller" v-if="!isCollection&&!data.isCollect" @click.stop="collection(data)">
          <img mode="widthFix" class="product-controller-icon" src="../../static/images/icon-collection.png" />
        </div>
        <div class="product-controller" v-if="!isCollection&&data.isCollect" @click.stop="cancelCollect(data)">
          <img mode="widthFix" class="product-controller-icon" src="../../static/images/icon-already-collected.png" />
        </div>
        <div class="product-controller" v-if="isCollection" @click.stop="cancelCollect(data)">
          <img mode="widthFix" class="product-controller-icon"  src="../../static/images/icon-already-collected.png" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['data', 'collection', 'cancelCollect', 'isCollection'],
    methods: {}
  }

</script>

<style lang="less">
  .product {
    font-size: 0;
    display: flex;
    align-items: flex-start;
    padding: 0 30/2px;

    .product-pic {
      width: 254/2px;
      height: 254/2px;
      margin-right: 40/2px;

      img {
        width: 254/2px;
        height: 254/2px;
      }
    }

    .product-info {
      flex: 1;

      .product-header {
        padding-top: 12/2px;

        .product-name {
          font-size: 28/2px;
          color: rgba(96, 96, 96, 1);
          line-height: 28/2px;
        }
      }

      .product-body {
        display: flex;
        flex-direction: column;
        margin: 28/2px 0;

        p {
          font-size: 24/2px;
          color: rgba(160, 160, 160, 1);
          line-height: 36/2px;
        }
      }

      .product-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .product-price {
        font-size: 30/2px;
        color: rgba(238, 117, 89, 1);
        line-height: 30/2px;
      }

      .product-controller {
        width: auto;
        width: 50/2px;
        height: 50/2px;
        display: flex;
        align-items: center;
        justify-content: center;

        .product-controller-icon {
          width: 32/2px;
          height: 32/2px;
        }
      }
    }
  }

</style>
