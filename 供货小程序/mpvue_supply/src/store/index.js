import Vue from 'vue'
import Vuex from 'Vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    count: 0,
    access_token: null,
    homeActive: 0,
    homeList: null,
    mallActive: 'collect_goods',
    mallList: null,
    userInfo: null,
    collectsList: null,
    newsList: null,
    addressList: null,
    productList: null,
    cartList: null,
    checkedList: [],
    couponsList: null,
    useCoupons: null,
    goodsAddress: null,
    cartStr: '',
    settlementProduct: null,
    orderList: null,
    exchangeList: null,
    pointsList: null,
    balanceList: null,
    rechargeNum: null,
    subsLists: null,
    sbsOrderLists: null,
    rechargeMethodsList: null,
    recharge: null,
    changeAddress: null,
    changeSubstituting: null,
    pay: null,
    noteList: null,
    checkedNoteList: null,
    classificationActive: null,
    evaluationList:[],
  },
  mutations: {
    setAccess_token(state, value) {
      state.access_token = value
    },
    changeHomeActive(state, value) {
      state.homeActive = value
    },
    setHomeList(state, value) {
      state.homeList = value
    },
    setMallActive(state, value) {
      state.mallActive = value
    },
    setMallList(state, value) {
      state.mallList = value
    },
    setUserInfo(state, value) {
      state.userInfo = value
    },
    setCollectsList(state, value) {
      state.collectsList = value
    },
    setNewsList(state, value) {
      state.newsList = value
    },
    setAddressList(state, value) {
      state.addressList = value
    },
    setProductList(state, value) {
      state.productList = value
    },
    setCartList(state, value) {
      state.cartList = value
    },
    setCheckedList(state, value) {
      state.checkedList = value
    },
    setCouponsList(state, value) {
      state.couponsList = value
    },
    setUseCoupons(state, value) {
      state.useCoupons = value
    },
    setGoodsAddress(state, value) {
      state.goodsAddress = value
    },
    setCartStr(state, value) {
      state.cartStr = value
    },
    setSettlementProduct(state, value) {
      state.settlementProduct = value
    },
    setOrderList(state, value) {
      state.orderList = value
    },
    setExchangeList(state, value) {
      state.exchangeList = value
    },
    setPointsList(state, value) {
      state.pointsList = value
    },
    setBalanceList(state, value) {
      state.balanceList = value
    },
    setRechargeNum(state, value) {
      state.rechargeNum = value
    },
    setSubsLists(state, value) {
      state.subsLists = value
    },
    setSbsOrderLists(state, value) {
      state.sbsOrderLists = value
    },
    setRechargeMethodsList(state, value) {
      state.rechargeMethodsList = value
    },
    setRecharge(state, value) {
      state.recharge = value
    },
    setChangeAddress(state, value) {
      state.changeAddress = value
    },
    setChangeSubstituting(state, value) {
      state.changeSubstituting = value
    },
    setPay(state, value) {
      state.pay = value
    },
    setNoteList(state, value) {
      state.noteList = value
    },
    setCheckedNoteList(state, value) {
      state.checkedNoteList = value
    },
    setClassificationActive(state, value) {
      state.classificationActive = value
    },
    setEvaluationList(state, value) {
      state.evaluationList = value
    },
  }
})

export default store
