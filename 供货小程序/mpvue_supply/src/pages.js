module.exports = [

  {
    path: 'pages/index', // 首页
    config: {
      navigationBarTitleText: '供货商城',
      enablePullDownRefresh: true,
      backgroundColor: '#ffffff',
      usingComponents: {
        "i-tab-bar": "../../static/iview/tab-bar/index",
        "i-tab-bar-item": "../../static/iview/tab-bar-item/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-icon": "../../static/iview/icon/index",
        "i-checkbox-group": "../../static/iview/checkbox-group/index",
        "i-checkbox": "../../static/iview/checkbox/index",
        "i-tabs": "../../static/iview/tabs/index",
        "i-tab": "../../static/iview/tab/index",
        "i-button": "../../static/iview/button/index",
        "i-toast": "../../static/iview/toast/index",
        "i-action-sheet": "../../static/iview/action-sheet/index",
        "i-load-more": "../../static/iview/load-more/index",
        "van-dialog": "../../static/vant/dialog/index",
        "van-field": "../../static/vant/field/index",
        "i-badge": "../../static/iview/badge/index"
      }
    }
  },

  {
    path: 'pages/authorization/authorization', // 首页
    config: {
      navigationBarTitleText: '供货商城',
      usingComponents: {
        "van-dialog": "../../static/vant/dialog/index",
        "i-button": "../../static/iview/button/index",
        "i-spin": "../../static/iview/spin/index",
        "i-toast": "../../static/iview/toast/index",
      }
    }
  },

  {
    path: 'pages/productInfo/productInfo', // 商品详情
    config: {
      navigationBarTitleText: '商品详情',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-tabs": "../../static/iview/tabs/index",
        "i-tab": "../../static/iview/tab/index",
        "i-input-number": "../../static/iview/input-number/index",
        "i-button": "../../static/iview/button/index",
        "i-action-sheet": "../../static/iview/action-sheet/index",
        "i-toast": "../../static/iview/toast/index"
      }
    }
  },
  {
    path: 'pages/projectInfo/projectInfo', // 专题详情
    config: {
      navigationBarTitleText: '专题详情',
      usingComponents: {
      }
    }
  },
  {
    path: 'pages/collection/collection', // 收藏
    config: {
      navigationBarTitleText: '收藏',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",
      }
    }
  },
  {
    path: 'pages/address/address', // 地址
    config: {
      navigationBarTitleText: '地址',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-swipeout": "../../static/iview/swipeout/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-load-more": "../../static/iview/load-more/index",
      }
    }
  },
  {
    path: 'pages/addressEdit/addressEdit', // 地址
    config: {
      navigationBarTitleText: '编辑地址',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-input": "../../static/iview/input/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-toast": "../../static/iview/toast/index"
      }
    }
  },
  {
    path: 'pages/setPayPassword/setPayPassword', // 地址
    config: {
      navigationBarTitleText: '设置支付密码',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-input": "../../static/iview/input/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-toast": "../../static/iview/toast/index"
      }
    }
  },
  {
    path: 'pages/productList/productList', // 商品列表
    config: {
      navigationBarTitleText: '商品列表',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",
      }
    }
  },
  {
    path: 'pages/settlement/settlement', // 结算ß
    config: {
      navigationBarTitleText: '结算',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-action-sheet": "../../static/iview/action-sheet/index",
        "i-modal": "../../static/iview/modal/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  },
  {
    path: 'pages/coupons/coupons', // 优惠券
    config: {
      navigationBarTitleText: '优惠券',
      usingComponents: {
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",

      }
    }
  },
  {
    path: 'pages/orderList/orderList', // 订单列表
    config: {
      navigationBarTitleText: '订单列表',
      usingComponents: {
        "i-button": "../../static/iview/button/index",
        "i-icon": "../../static/iview/icon/index",
        "i-tab-bar": "../../static/iview/tab-bar/index",
        "i-tab-bar-item": "../../static/iview/tab-bar-item/index",
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",
        "i-modal": "../../static/iview/modal/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  },
  {
    path: 'pages/exchange/exchange', // 订单列表
    config: {
      navigationBarTitleText: '退换货',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",
      }
    }
  },
  {
    path: 'pages/orderInfo/orderInfo', // 订单详情
    config: {
      navigationBarTitleText: '订单详情',
      usingComponents: {
        "i-button": "../../static/iview/button/index",
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-load-more": "../../static/iview/load-more/index",
        "i-modal": "../../static/iview/modal/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  },
  {
    path: 'pages/paySuccess/paySuccess', // 支付成功
    config: {
      navigationBarTitleText: '支付成功',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-button": "../../static/iview/button/index",
        "van-icon": "../../static/vant/icon/index",
      }
    }
  },
  {
    path: 'pages/wallet/wallet', // 钱包
    config: {
      navigationBarTitleText: '余额',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
        "i-load-more": "../../static/iview/load-more/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
      }
    }
  },
  {
    path: 'pages/integral/integral', // 积分
    config: {
      navigationBarTitleText: '积分',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
      }
    }
  },
  {
    path: 'pages/recharge/recharge', // 充值
    config: {
      navigationBarTitleText: '充值',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  },
  {
    path: 'pages/rechargeType/rechargeType', // 充值方式
    config: {
      navigationBarTitleText: '充值方式',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
        "van-popup": "../../static/iview/popup/index"
      }
    }
  },
  {
    path: 'pages/substitutingInfo/substitutingInfo', // 代发详情
    config: {
      navigationBarTitleText: '代发详情',
      usingComponents: {
        "i-button": "../../static/iview/button/index",
        "i-icon": "../../static/iview/icon/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-toast": "../../static/iview/toast/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  },
  {
    path: 'pages/substitutingEdit/substitutingEdit', // 新建一件代发
    config: {
      navigationBarTitleText: '一件代发',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-input": "../../static/iview/input/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-toast": "../../static/iview/toast/index"
      }
    }
  },
  {
    path: 'pages/substituting/substituting', // 一件代发
    config: {
      navigationBarTitleText: '一件代发',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-icon": "../../static/iview/icon/index",
        "van-icon": "../../static/vant/icon/index",
        "van-notice-bar": "../../static/vant/notice-bar/index",
        "i-swipeout": "../../static/iview/swipeout/index",
        "i-cell": "../../static/iview/cell/index",
        "i-cell-group": "../../static/iview/cell-group/index",
        "i-load-more": "../../static/iview/load-more/index",
        "i-tabs": "../../static/iview/tabs/index",
        "i-tab": "../../static/iview/tab/index",
        "i-button": "../../static/iview/button/index",
        "i-toast": "../../static/iview/toast/index",
        "van-dialog": "../../static/vant/dialog/index"
      }
    }
  }, {
    path: 'pages/certification/certification', // 首页
    config: {
      navigationBarTitleText: '认证',
      usingComponents: {
        "i-icon": "../../static/iview/icon/index",
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
        "van-cell-group": "../../static/vant/cell-group/index",
        "van-field": "../../static/vant/field/index"
      }
    }
  },
  {
    path: 'pages/evaluation/evaluation', // 首页
    config: {
      navigationBarTitleText: '发布评论',
      usingComponents: {
        "i-toast": "../../static/iview/toast/index",
        "i-button": "../../static/iview/button/index",
      }
    }
  }
]
