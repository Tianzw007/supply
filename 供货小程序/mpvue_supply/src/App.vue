<script>
  export default {
    created() {
      // 调用API从本地缓存中获取数据
      const logs = wx.getStorageSync('logs') || []
      logs.unshift(Date.now())
      wx.setStorageSync('logs', logs)
      wx.showShareMenu({
        withShareTicket: true
      })
      // eslint-disable-next-line
      console.log('app created and cache logs by setStorageSync')
    }
  }

</script>

<style lang="less">
  page {
    height: 100%;
    background: rgba(249, 249, 249, 1);

  }

  div {
    box-sizing: border-box;

    &.list__body {
      border-bottom: 1rpx solid #f9f9f9;

      .list__title--main {
        color: #404040;
        font-size: 30rpx;
      }
    }
  }

  .cell-btn-controller {
    text-align: center;
    margin-top: 30px;
  }

  .cell-btn {
    width: 180px;
    display: inline-block;
  }


  .blank-spaces {
    display: block;
    width: 100%;
    padding-top: 10px;
    background: rgba(249, 249, 249, 1);
  }

  .container {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
  }

  .zan-pull-left {
    float: left
  }

  .zan-pull-right {
    float: right
  }

  .zan-center {
    text-align: center
  }

  .zan-right {
    text-align: right
  }

  .zan-text-deleted {
    text-decoration: line-through
  }

  .zan-font-8 {
    font-size: 8px
  }

  .zan-font-10 {
    font-size: 10px
  }

  .zan-font-12 {
    font-size: 12px
  }

  .zan-font-14 {
    font-size: 14px
  }

  .zan-font-16 {
    font-size: 16px
  }

  .zan-font-18 {
    font-size: 18px
  }

  .zan-font-20 {
    font-size: 20px
  }

  .zan-font-22 {
    font-size: 22px
  }

  .zan-font-24 {
    font-size: 24px
  }

  .zan-font-26 {
    font-size: 26px
  }

  .zan-font-30 {
    font-size: 30px
  }

  .zan-font-bold {
    font-weight: 700
  }


  .zan-arrow {
    position: absolute;
    right: 15px;
    top: 50%;
    display: inline-block;
    height: 6px;
    width: 6px;
    border-width: 2px 2px 0 0;
    border-color: #c8c8c8;
    border-style: solid;
    -webkit-transform: translateY(-50%) matrix(.71, .71, -.71, .71, 0, 0);
    transform: translateY(-50%) matrix(.71, .71, -.71, .71, 0, 0)
  }

  .zan-ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal
  }

  .zan-ellipsis--l2 {
    max-height: 40px;
    line-height: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical
  }

  .zan-ellipsis--l3 {
    max-height: 60px;
    line-height: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical
  }

  .zan-clearfix {
    zoom: 1
  }

  .zan-clearfix::after {
    content: '';
    display: table;
    clear: both
  }

  .zan-c-red {
    color: #f44
  }

  .zan-c-black {
    color: #000
  }

  .zan-c-green {
    color: #06bf04
  }

  .zan-c-blue {
    color: #38f
  }

  .zan-c-gray {
    color: #c9c9c9
  }

  .zan-c-gray-dark {
    color: #999
  }

  .zan-c-gray-darker {
    color: #666
  }

  .zan-hairline,
  .zan-hairline--bottom,
  .zan-hairline--left,
  .zan-hairline--right,
  .zan-hairline--surround,
  .zan-hairline--top,
  .zan-hairline--top-bottom {
    position: relative
  }

  .zan-hairline--bottom::after,
  .zan-hairline--left::after,
  .zan-hairline--right::after,
  .zan-hairline--surround::after,
  .zan-hairline--top-bottom::after,
  .zan-hairline--top::after,
  .zan-hairline::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 200%;
    height: 200%;
    -webkit-transform: scale(.5);
    transform: scale(.5);
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    pointer-events: none;
    box-sizing: border-box;
    border: 0 solid #e5e5e5
  }

  .zan-hairline--top::after {
    border-top-width: 1px
  }

  .zan-hairline--left::after {
    border-left-width: 1px
  }

  .zan-hairline--right::after {
    border-right-width: 1px
  }

  .zan-hairline--bottom::after {
    border-bottom-width: 1px
  }

  .zan-hairline--top-bottom::after {
    border-width: 1px 0
  }

  .zan-hairline--surround::after {
    border-width: 1px
  }

  /* this rule will be remove */

  * {
    transition: width 2s;
    -moz-transition: width 2s;
    -webkit-transition: width 2s;
    -o-transition: width 2s;
  }
  .pay-orderAmount {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 15px;

    p {
      margin-bottom: 10px;
    }
  }
</style>
