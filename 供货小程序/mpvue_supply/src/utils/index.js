import vue from "vue";
import request from "@/api/request";
import store from '@/store/index'
const { $Toast } = require("@/../static/iview/base/index");


// export const host = 'https://app2.dayouqiantu.cn/'
export const host = 'http://localhost:8009/'

vue.prototype.$saveImg = function (imgSrc) {
  wx.downloadFile({
    url: imgSrc,
    success: function (res) {
      console.log(res);
      //图片保存到本地
      wx.saveImageToPhotosAlbum({
        filePath: res.tempFilePath,
        success: function (data) {
          wx.showToast({
            title: '保存成功',
            icon: 'success',
            duration: 2000
          })
        },
        fail: function (err) {
          console.log(err);
          if (err.errMsg === "saveImageToPhotosAlbum:fail auth deny") {
            console.log("当初用户拒绝，再次发起授权")
            wx.openSetting({
              success(settingdata) {
                console.log(settingdata)
                if (settingdata.authSetting['scope.writePhotosAlbum']) {
                  console.log('获取权限成功，给出再次点击图片保存到相册的提示。')
                  // $Toast({
                  //   content: res.message,
                  //   type: res.code == 0 ? "success" : "warning"
                  // });
                } else {
                  console.log('获取权限失败，给出不给权限就无法正常使用的提示')
                }
              }
            })
          }
        },
        complete(res) {
          console.log(res);
        }
      })
    }
  })
}

// 获取首页列表
export const getIndexList = () => {
  request.getIndexList().then(res => {
    console.log(res)
    store.commit('setHomeList', res.data)
  });
}

// 请求商品分类列表
export const getMallList = () => {
  request.getMallList({
    page: 1,
    page_num: 99999
  }).then(res => {
    console.log(res, 1111)
    store.commit('setMallList', res.data)
  });
}

// 添加到收藏
export const getMallCollect = (data) => {
  return new Promise((resolve, reject) => {
    request
      .getMallCollect({
        goodsId: data.goods_id
      })
      .then(res => {
        getCollects()
        getIndexList()
        getMallList()
        $Toast({
          content: res.message,
          type: res.code == 0 ? "success" : "warning"
        })
        console.log(res)
        if (res.code == 0) {
          resolve(res)
        } else {
          reject(res)
        }
      })
  });
}


// 获取收藏列表
export const getCollects = () => {
  request
    .getCollects({
      page: 1,
      page_num: 9999
    })
    .then(res => {
      store.commit('setCollectsList', res.data);
    });
}

// 取消收藏
export const cancelCollect = (data) => {
  return new Promise((resolve, reject) => {
    request
      .cancelCollect({
        goodsId: data.goods_id
      })
      .then(res => {
        getCollects()
        getIndexList()
        getMallList()
        $Toast({
          content: res.message,
          type: res.code == 0 ? "success" : "warning"
        });
        if (res.code == 0) {
          resolve(res)
        } else {
          reject(res)
        }
      })
  });
}

// 更新购物车
export const getMallCartList = (data) => {
  request.getMallCartList({
    page: 1,
    page_num: 9999,
  }).then(res => {
    store.commit('setCartList', res.data);
  })
};


// 获取用户信息
export const getUserInfo = () => {
  request.getUserInfo().then(res => {
    store.commit('setUserInfo', res.data)
  });
}

// 获取优惠券列表
export const getCouponsList = () => {
  request
    .getCouponsList()
    .then(res => {
      store.commit('setCouponsList', res.data);
    });
}

// 复制到剪切板
export const copyClipboard = (data) => {
  wx.setClipboardData({
    data: data,
    success: (res) => {
      console.log(res)
    }
  })
}

// 请求所有订单列表
export const getOrderList = () => {
  request
    .getOrderList({
      status: this.active,
      page: 1,
      page_num: 9999
    })
    .then(res => {
      let time = setTimeout(() => {
        clearTimeout(time);
        store.commit('setOrderList', res.data);
      }, 300);
    });
}

// 请求所有订单列表
export const getDate = (date) => {
  var d = new Date(date * 1000);
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

export const getSubsLists = () => {
  // 列表
  request
    .getSubsLists({
      page: 1,
      page_num: 9999
    })
    .then(res => {
      store.commit('setSubsLists', res.data)
    });
}

export const getSbsOrderLists = () => {
  // 获取订单列表
  request
    .getSbsOrderLists({
      page: 1,
      page_num: 9999
    })
    .then(res => {
      store.commit('setSbsOrderLists', res.data)
    });
}


// 下拉刷新更新的内容
export const onPullDownRefresh = () => {
  getSubsLists()
  getSbsOrderLists()
  getCollects()
  getIndexList()
  getMallList()
  getMallCartList()
  getCouponsList()
  getUserInfo()
}

// 支付模块
export const wxPay = (option) => {
  return new Promise((resolve, reject) => {
    // 调用支付接口，如果是余额支付，就直接支付了，如果是微信支付，则吊起微信支付
    request.pay(option).then(res => {
      ///console.log(res.data);
      if (res.data) {
        const {
          timeStamp,
          packageValue,
          nonceStr,
          signType,
          paySign
        } = res.data
        console.log(res.data);
        // 吊起微信支付
        wx.requestPayment({
          //...res.data.result,
          package: packageValue,
          timeStamp: timeStamp,
          nonceStr: nonceStr,
          signType: signType,
          paySign: paySign,
          success: (success) => {
            $Toast({
              content: "支付成功",
              type: "success"
            });
            resolve(success)
          },
          fail: (error) => {
            $Toast({
              content: "支付失败",
              type: "error"
            });
            reject(error)
          }
        })
      } else {
        $Toast({
          content: res.message,
          type: res.code == 0 ? "success" : "warning"
        });
        resolve(res.data)
      }
    }).catch(error => {
      $Toast({
        content: error.message,
        type: error.code == 0 ? "success" : "warning"
      });
      reject(error)
    });
  })

}
