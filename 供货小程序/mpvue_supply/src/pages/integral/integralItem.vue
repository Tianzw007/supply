<template>
  <div class="integral-cell">
    <div class="integral-cell-icon">
    </div>
    <div class="integral-cell-info">
      <div class="integral-cell-title">{{data.title}}</div>
      <div class="integral-cell-date">{{getDate}}</div>
    </div>
    <div class="integral-cell-num add" v-if="data.type==1">+{{data.value}}</div>
    <div class="integral-cell-num reduction" v-if="data.type==2">-{{data.value}}</div>
  </div>

</template>

<script>
  import {
    getDate
  } from '@/utils/index'
  export default {
    props: ['data'],
    components: {},
    data() {
      return {

      };
    },
    computed: {
      getDate() {
        return getDate(this.data.createTime)
      }
    },
  };

</script>

<style lang="less">
  .integral-cell {
    display: flex;
    align-items: center;
    padding: 15px;
    position: relative;

    &:after {
      content: '';
      position: absolute;
      top: 0;
      left: 15px;
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

  .integral-cell-icon {
    background-color: rgb(245, 246, 245);
    width: 34px;
    height: 34px;
    margin-right: 10px;
  }

  .integral-cell-info {
    flex: 1;
  }

  .integral-cell-title {
    font-size: 14px;
    color: rgb(48, 48, 48);
    line-height: 1em;
  }

  .integral-cell-date {
    font-size: 14px;
    color: rgb(128, 128, 128);
    line-height: 1em;
    margin-top: 10px;
  }

  .integral-cell-num {
    font-size: 14px;

    &.add {
      color: rgb(255, 133, 76);
    }

    &.reduction {
      color: rgb(48, 48, 48);

    }
  }

</style>
