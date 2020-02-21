import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui'
import axios from 'axios'
import VueAxios from 'vue-axios'
import 'element-ui/lib/theme-chalk/index.css';
import '@/assets/glable.css'


Vue.config.productionTip = false
Vue.use(ElementUI, VueAxios, axios);
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
