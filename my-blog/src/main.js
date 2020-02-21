import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
//引入axios
import axios from 'axios'
import VueAxios from 'vue-axios'
//全局css和字体文件
import './assets/glable.css'
import './assets/fonts/iconfont.css'
Vue.config.productionTip = false
//挂载axios
Vue.use(VueAxios, axios)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
