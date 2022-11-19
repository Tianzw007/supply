<template>
  <div class="wallet-cell">
    <div class="wallet-cell-icon add" v-if="data.type==1">
      充值
    </div>
    <div class="wallet-cell-icon reduction" v-if="data.type==2">
      支出
    </div>
    <div class="wallet-cell-info">
      <div class="wallet-cell-title">{{data.title}}</div>
      <div class="wallet-cell-date">{{getDate}}</div>
    </div>
    <div class="wallet-cell-num add" v-if="data.type==1">+{{data.value}}</div>
    <div class="wallet-cell-num reduction" v-if="data.type==2">-{{data.value}}</div>
  </div>

</template>

<script>
  export default {
    props: ['data'],
    components: {},
    data() {
      return {

      };
    },
    computed: {
      getDate() {
        //console.log(this.data.create_time * 1000)
        var d = new Date(this.data.createTime * 1000);
        var curr_date = d.getDate();
        var curr_month = d.getMonth() + 1;
        var curr_year = d.getFullYear();
        var curr_hours = d.getHours();
        var curr_minutes = d.getMinutes();
        String(curr_month).length < 2 ? (curr_month = "0" + curr_month) : curr_month;
        String(curr_date).length < 2 ? (curr_date = "0" + curr_date) : curr_date;
        String(curr_hours).length < 2 ? (curr_hours = "0" + curr_hours) : curr_hours;
        String(curr_minutes).length < 2 ? (curr_minutes = "0" + curr_minutes) : curr_minutes;
        var yyyyMMdd = curr_year + "-" + curr_month + "-" + curr_date + ' ' + curr_hours + ':' + curr_minutes;
        return yyyyMMdd;
      }
    },
  };

</script>

<style lang="less">
  .wallet-cell {
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

  .wallet-cell-icon {
    background-color: rgb(245, 246, 245);
    width: 40px;
    height: 40px;
    margin-right: 10px;
    border-radius: 50%;
    line-height: 40px;
    text-align: center;
    font-size: 14px;
    color: #fff;
    &.add{
      background: #2499CF;
    }
    &.reduction{
      background: #EE755A;
    }
  }

  .wallet-cell-info {
    flex: 1;
  }

  .wallet-cell-title {
    font-size: 14px;
    color: rgb(48, 48, 48);
    line-height: 1em;
  }

  .wallet-cell-date {
    font-size: 14px;
    color: rgb(128, 128, 128);
    line-height: 1em;
    margin-top: 10px;
  }

  .wallet-cell-num {
    font-size: 14px;

    &.add {
      color: rgb(255, 133, 76);
    }

    &.reduction {
      color: rgb(48, 48, 48);

    }
  }

</style>
