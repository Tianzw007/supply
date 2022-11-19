import api from "./api"
const {
    $Toast
} = require("@/../static/iview/base/index");
const returnPromise = (res) => {
    return new Promise((resolve, reject) => {
        if (res) {
            resolve(res)
        } else {
            reject(res)
        }
    })
}


const request = {
    async getIndexList(data) {
        // 请求首页列表
        let res = await api.get('shop/index-list', data)
        return returnPromise(res)
    },
    async getMallList(data) {
        // 请求商品分类列表
        let res = await api.get('shop/mall-lists', data)
        return returnPromise(res)
    },
    async getMallGoodsDetail(data) {
        // 请求商品详情
        let res = await api.get('shop/mall-goods-detail', data)
        return returnPromise(res)
    },
    async getMallAddCart(data) {
        // 添加到购物车
        let res = await api.post('shop/mall-add-cart', data)
        return returnPromise(res)
    },
    async getMallCartList(data) {
        // 获取购物车列表
        let res = await api.get('shop/mall-cart-list', data)
        return returnPromise(res)
    },
    async delMallCart(data) {
        // 删除指定购物车内容
        let res = await api.get('shop/mall-cart-del', data)
        return returnPromise(res)
    },
    async getMallCollect(data) {
        // 添加到收藏
        let res = await api.post('shop/mall-add-collect', data)
        return returnPromise(res)
    },

    /**
     *
     * ? 取消商品收藏
     * * @goods_id  Int  商品ID
     */
    async cancelCollect(data) {
        let res = await api.post('shop/mall-cancel-collect', data)
        return returnPromise(res)
    },
    async getUserInfo(data) {
        // 获取用户信息
        let res = await api.get('shop/user-my-info', data)
        return returnPromise(res)
    },
    async getCollects(data) {
        // 获取用户收藏列表
        let res = await api.get('shop/user-my-collects', data)
        return returnPromise(res)
    },
    async getNewsList(data) {
        // 获取专题列表
        let res = await api.get('shop/news-lists', data)
        return returnPromise(res)
    },
    async getNewsDetail(data) {
        // 获取专题详情
        let res = await api.get('shop/news-detail', data)
        return returnPromise(res)
    },
    async getAddressList(data) {
        // 获取地址列表
        let res = await api.get('shop/user-my-address', data)
        return returnPromise(res)
    },
    async postAddress(data) {
        // 获取地址列表
        let res = await api.post('shop/user-address-add-edit', data)
        return returnPromise(res)
    },
    async deleteAddress(data) {
        // 删除地址
        let res = await api.post('shop/user-address-del', data)
        return returnPromise(res)
    },
    async getProductList(data) {
        // 获取分类下商品列表
        let res = await api.get('shop/mall-goods-list', data)
        return returnPromise(res)
    },
    async getCouponsList(data) {
        // 获取分类下商品列表
        let res = await api.get('shop/user-my-coupons', data)
        return returnPromise(res)
    },
    async getSelfShipping(data) {
        // 获取自提地址
        let res = await api.get('shop/mall-self-shipping', data)
        return returnPromise(res)
    },
    async getOrderSubmit(data) {
        // 提交订单
        let res = await api.post('shop/mall-order-submit', data)
        return returnPromise(res)
    },
    async getOrderList(data) {
        // 订单列表
        let res = await api.get('shop/user-order-list', data)
        return returnPromise(res)
    },
    /**
     * ? 用户中心模块 - 订单操作
     * * @type  Iny  操作类型 1-取消订单 2-确认收货 3-退货
     * * @orderId  Int  订单id
     */
    async handleOrder(data) {
        let res = await api.post('shop/user-order-handle', data)
        return returnPromise(res)
    },

    async getOrderInfo(data) {
        // 订单详情
        let res = await api.get('shop/user-order-detail', data)
        return returnPromise(res)
    },
    async getPoints(data) {
        // 获取积分或者余额流水
        let res = await api.get('shop/user-points-money-logs', data)
        return returnPromise(res)
    },
    async getSubsLists(data) {
        // 代发列表
        let res = await api.get('shop/subs-lists', data)
        return returnPromise(res)
    },
    async submitsSubsOrder(data) {
        // 提交代发
        let res = await api.post('shop/subs-submit-order', data)
        return returnPromise(res)
    },
    async delSubsSinge(data) {
        // 代发删除
        let res = await api.post('shop/subs-singe-del', data)
        return returnPromise(res)
    },
    async getSbsOrderLists(data) {
        // 代发清单列表
        let res = await api.get('shop/subs-order-lists', data)
        return returnPromise(res)
    },
    async postSubsSingeDddEdit(data) {
        // 编辑代发
        let res = await api.post('shop/subs-singe-add-edit', data)
        return returnPromise(res)
    },
    async getSubsOrderDetail(data) {
        // 获取代发详情
        let res = await api.get('shop/subs-order-detail', data)
        return returnPromise(res)
    },
    async submitAuth(data) {
        // 提交认证
        let res = await api.post('shop/user-submit-auth', data)
        return returnPromise(res)
    },
    async sendCode(data) {
        // 发送验证，啊
        let res = await api.post('shop/user-send-code', data)
        return returnPromise(res)
    },
    async getRechargeMethods(data) {
        // 获取充值方式
        let res = await api.get('shop/user-recharge-methods', data)
        return returnPromise(res)
    },
    async submitRecharge(data) {
        // 提交充值
        let res = await api.post('shop/user-do-recharge', data)
        return returnPromise(res)
    },
    async pay(data) {
        let res = await api.post('shop/pay-do-pay', data)
        return returnPromise(res)
    },
    async getAccessToken(data) {
        // 获取openid
        let res = await api.post('oauth/access_token', data)
        return returnPromise(res)
    },
    async submitComment(data) {
        let res = await api.post('shop/user-add-comment', data)
        return returnPromise(res)
    },
    async userSetPassword(data) {
        let res = await api.post('shop/user-set-password', data)
        return returnPromise(res)
    },
    async payConfirmMoney(data) {
        let res = await api.post('shop/pay-confirm-money', data)
        return returnPromise(res)
    },
}

export default request
