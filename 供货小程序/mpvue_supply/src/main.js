import Vue from 'vue'
import App from '@/App'
import store from '@/store'
import MpvueRouterPatch from 'mpvue-router-patch'

import Fly from "flyio/dist/npm/wx"
import api from './api/api'
Vue.prototype.$http = new Fly
Vue.config.productionTip = false
App.store = store
App.mpType = 'app'

// import '../static/weui/app.wxss'

Vue.use(MpvueRouterPatch)


const app = new Vue(App)
app.$mount()

export default {
  // 这个字段走 app.json
  config: {
    pages: [],
    window: {
      backgroundTextStyle: 'light',
      navigationBarBackgroundColor: '#fff',
      navigationBarTitleText: 'WeChat',
      navigationBarTextStyle: 'black',

    }
  }
}
