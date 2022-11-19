<template>
  <div class="container recharge">
    <div class="recharge-content">
      <div class="recharge-type">
        <p class="recharge-title">选择{{pageTitle}}方式</p>
        <div class="recharge-select-type" v-if="rechargeMethodsList">
          <div class="recharge-select-box" v-for="(item,index) in rechargeMethodsList" :key="index">
            <div class="recharge-select-item" :class="{'select':method_id==item.id}" @click="selectRecharge(item.id)">
              <img mode="widthFix" :src="item.icon" alt="">
              <p>{{item.name}}</p>
            </div>
          </div>
        </div>
      </div>
      <div v-if="rechargeMethodsList" v-for="(item,index) in rechargeMethodsList" :key="index">
        <div class="recharge-type-info" v-if="method_id==item.id && item.id==1">
          <p class="recharge-title">请转账至以下账号</p>
          <div class="recharge-info">
            <div class="recharge-cell">
              <div class="recharge-cell-hd">开户行：</div>
              <div class="recharge-cell-bd">{{item.bank_name}}</div>
              <div class="recharge-cell-ft"></div>
            </div>
            <div class="recharge-cell">
              <div class="recharge-cell-hd">账号：</div>
              <div class="recharge-cell-bd">{{item.account}}</div>
              <div class="recharge-cell-ft">
                <i-button size="small" @click="copyClipboard(item.account)" i-class="cell-btn" shape="circle">复制卡号</i-button>
              </div>
            </div>
            <div class="recharge-cell">
              <div class="recharge-cell-hd">姓名：</div>
              <div class="recharge-cell-bd">{{item.true_name}}</div>
              <div class="recharge-cell-ft"></div>
            </div>
          </div>
        </div>
        <div class="recharge-type-info" v-if="method_id==item.id && item.id==2">
          <p class="recharge-title">请转账至以下{{item.name}}账号</p>
          <div class="recharge-type-wx">
            <div class="recharge-info">
              <div class="recharge-cell">
                <div class="recharge-cell-hd">{{item.name}}：</div>
                <div class="recharge-cell-bd">{{item.account}}</div>
              </div>
              <div class="recharge-cell">
                <div class="recharge-cell-hd">昵称：</div>
                <div class="recharge-cell-bd">{{item.true_name}}</div>
              </div>
              <div class="recharge-cell">
                <div class="recharge-cell-ft">
                  <i-button size="small" @click="copyClipboard(item.account)" i-class="cell-btn" shape="circle">复制账号</i-button>
                </div>
              </div>
            </div>
            <div class="recharge-type-wx-pic">
              <img mode="widthFix" @click="openQrcode(item.qrcode)" :src="item.qrcode" alt="">
            </div>
          </div>
        </div>
        <div class="recharge-type-info" v-if="method_id==item.id && item.id==3">
          <p class="recharge-title">请添加{{item.name}}转账</p>
          <div class="recharge-type-wx">
            <div class="recharge-info">
              <div class="recharge-cell">
                <div class="recharge-cell-hd">{{item.name}}：</div>
                <div class="recharge-cell-bd">{{item.account}}</div>
              </div>
              <div class="recharge-cell">
                <div class="recharge-cell-hd">昵称：</div>
                <div class="recharge-cell-bd">{{item.true_name}}</div>
              </div>
              <div class="recharge-cell">
                <div class="recharge-cell-ft">
                  <i-button size="small" @click="copyClipboard(item.account)" i-class="cell-btn" shape="circle">复制账号</i-button>
                </div>
              </div>
            </div>
            <div class="recharge-type-wx-pic">
              <img mode="widthFix" @click="openQrcode(item.qrcode)" :src="item.qrcode" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="blank-spaces"></div>
    <div class="recharge-content">
      <p class="recharge-title">转账界面截图</p>
      <div class="weui-uploader__bd th-backwhite clearfix">
        <div class="weui-uploader__files" id="uploaderFiles" v-if="screen_pic">
          <block>
            <div class="weui-uploader__file posi-rela" @click="predivImage" :id="screen_pic">
              <icon type="cancel" size="20" class="th-icon-cancel" @click.stop="deletImg(index)" />
              <image class="weui-uploader__img" :src="screen_pic" mode="aspectFill" />
            </div>
          </block>
        </div>
        <div class="weui-uploader__input-box" v-if="!screen_pic">
          <div class="weui-uploader__input" @click="chooseImage"></div>
        </div>
      </div>
    </div>
    <div class="cell-btn-controller">
      <i-button type="primary" size="small" @click="methodNext" i-class="cell-btn" shape="circle">已转账，下一步</i-button>
    </div>
    <i-toast id="toast" />
    <van-popup :show="showQrcode" position="bottom" @close="closeQrcode">
      <div class="orcode-pic">
        <img :src="orcodePic" mode="widthFix" alt="">
        <i-button type="primary" size="small" @click="$saveImg(orcodePic)" i-class="cell-btn" shape="circle">保存到相册</i-button>
      </div>
    </van-popup>
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
  import request from "@/api/request";
  import {
    copyClipboard,
    host
  } from '@/utils/index'
  export default {
    components: {},
    data() {
      return {
        showQrcode: false,
        orcodePic: '',
        steps: 0,
        pageTitle: '',
        from_type: 1,
        method_id: null,
        screen_pic: null,
        account: null,
      };
    },
    computed: {
      ...mapState(["rechargeMethodsList", "userInfo"])
    },
    methods: {
      ...mapMutations(["setBalanceList", "setRechargeMethodsList", 'setRecharge']),
      closeQrcode() {
        this.showQrcode = false
      },
      openQrcode(str) {
        console.log(str)
        this.orcodePic = str
        this.showQrcode = true
      },
      selectRecharge(val) {
        this.method_id = val;
      },
      getRechargeMethods() {
        // 获取充值方式
        request.getRechargeMethods().then(res => {
          console.log(res.data);
          this.setRechargeMethodsList(res.data);
        });
      },
      chooseImage(e) {
        let _this = this
        wx.chooseImage({
          sizeType: ["original", "compressed"], // 可以指定是原图还是压缩图，默认二者都有
          sourceType: ["album", "camera"], // 可以指定来源是相册还是相机，默认二者都有
          success(res) {
            console.log(res)
            console.log(res.tempFilePaths)
            // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
            wx.uploadFile({ //上传到服务器
              url: `${host}/common/upload-photo`, //仅为示例，非真实的接口地址
              filePath: res.tempFilePaths[0], //文件地址
              name: 'file', //文件name值
              success: function (uploadFile) {
                console.log(JSON.parse(uploadFile.data))
                _this.screen_pic = JSON.parse(uploadFile.data).data.url;
              },
              fail(e) {
                console.log(e);
              },
            })
          },
          fail() {
            console.log("fail");
          },
          complete() {
            console.log("commplete");
          }
        });
      },
      predivImage(e) {
        console.log(e);
        wx.previewImage({
          current: e.currentTarget.id, // 当前显示图片的http链接
          urls: this.screen_pic // 需要预览的图片http链接列表
        });
      },
      deletImg(index) {
        this.screen_pic = '';
      },
      methodNext() {
        if (!this.from_type) {
          $Toast({
            content: '请选择提交方式',
            type: 'warning'
          });
          return
        }
        if (!this.method_id) {
          $Toast({
            content: '请选择充值方式',
            type: 'warning'
          });
          return
        }
        if (!this.screen_pic) {
          $Toast({
            content: '请上传转账截图',
            type: 'warning'
          });
          return
        }
        this.setRecharge({
          from_type: this.from_type + '',
          method_id: this.method_id,
          screen_pic: this.screen_pic,
        })
        this.$router.push({
          path: '/pages/recharge/recharge'
        })
      }
    },
    mounted() {
      console.log(this)
      this.copyClipboard = copyClipboard
      switch (this.$route.query.from_type) {
        case '1':
          console.log(1)
          this.from_type = 1
          this.pageTitle = '充值'
          break;
        case '2':
          console.log(2)
          this.from_type = 2
          this.pageTitle = '转账'
          break;
      }
      wx.setNavigationBarTitle({
        title: this.pageTitle //页面标题为路由参数
      })
      this.getRechargeMethods();
    }
  };

</script>

<style lang="less">
  .weui-uploader__hd {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    padding-bottom: 10px;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center
  }

  .weui-uploader__title {
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    flex: 1
  }

  .weui-uploader__info {
    color: #b2b2b2
  }

  .weui-uploader__bd {
    margin-bottom: -4px;
    margin-right: -9px;
    overflow: hidden
  }

  .weui-uploader__file {
    float: left;
    margin-right: 9px;
    margin-bottom: 9px
  }

  .weui-uploader__img {
    display: block;
    width: 79px;
    height: 79px
  }

  .weui-uploader__file_status {
    position: relative
  }

  .weui-uploader__file_status:before {
    content: " ";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0, 0, 0, .5)
  }

  .weui-uploader__file-content {
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    color: #fff
  }

  .weui-uploader__input-box {
    float: left;
    position: relative;
    margin-right: 9px;
    margin-bottom: 9px;
    width: 77px;
    height: 77px;
    border: 1px solid #d9d9d9
  }

  .weui-uploader__input-box:after,
  .weui-uploader__input-box:before {
    content: " ";
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    background-color: #d9d9d9
  }

  .weui-uploader__input-box:before {
    width: 2px;
    height: 39.5px
  }

  .weui-uploader__input-box:after {
    width: 39.5px;
    height: 2px
  }

  .weui-uploader__input-box:active {
    border-color: #999
  }

  .weui-uploader__input-box:active:after,
  .weui-uploader__input-box:active:before {
    background-color: #999
  }

  .weui-uploader__input {
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0
  }

  .recharge-content {
    padding: 0 15px 15px;
    background: #fff;

    .recharge-title {
      font-size: 14px;
      font-weight: 500;
      line-height: 1em;
      margin: 25px 0 20px;
    }
  }

  .recharge-info {
    display: flex;
    flex-direction: column;
  }


  .recharge-cell {
    display: flex;
    align-items: center;

    .recharge-cell-hd {
      font-size: 12px;
      color: rgba(160, 160, 160, 1);
      line-height: 24px;
      flex: 0 50px;
    }

    .recharge-cell-bd {
      font-size: 14px;
      color: rgba(68, 68, 68, 1);
      line-height: 24px;
      flex: 1;
    }

    .recharge-cell-ft {
      .cell-btn {
        display: block;
        height: 24px;
        line-height: 24px;
        width: 66px;
        margin: 0;
        padding: 0;
        font-size: 11px;
      }
    }
  }


  .recharge-select-type {
    display: flex;
    align-items: center;
    padding: 0 -8px;

    .recharge-select-box {
      flex: 1;
      padding: 0 4px;
      display: flex;
      align-items: center;

      .recharge-select-item {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 80px;
        border-radius: 8px;
        background: #F3F3F3;

        &.select {
          background: #fff;
          border: 1px solid #F4E9E7;
        }

        img {
          width: 25px;
          height: 25px;
        }

        p {
          margin-top: 8px;
          font-size: 12px;
          color: rgba(128, 128, 128, 1);
          line-height: 1em;
        }
      }
    }
  }

  .th-icon-cancel {
    position: absolute;
    background-color: #fff;
    border-radius: 50%;
    right: -14rpx;
    top: -14rpx;
  }

  .weui-uploader__input-box {
    margin-right: 0;
    background: #F9F9F9;
  }

  .weui-uploader__bd {
    margin-bottom: 0;
  }

  .posi-rela {
    position: relative;
    overflow: visible;
  }

  .weui-uploader__file:nth-child(4n) {
    margin-right: 0;
  }

  .th-backwhite {
    width: 750rpx;
    margin-left: -30rpx;
    padding: 10rpx 30rpx 0;
    box-sizing: border-box;
    background-color: #fff;
  }

  .recharge-type-wx {
    display: flex;
    align-items: flex-start;

    .recharge-info {
      flex: 1;
    }

    .recharge-type-wx-pic {
      width: 154rpx;
      height: 154rpx;
      background: rgba(243, 243, 243, 1);
      border-radius: 15rpx;
      overflow: hidden;

      img {
        width: 154rpx;
        height: 154rpx;
      }
    }
  }

  .orcode-pic {
    padding: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;

    img {
      widows: 100%;
      height: auto;
    }
  }

</style>
