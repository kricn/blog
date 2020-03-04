import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/login.vue'
import Index from '@/components/index.vue'
import Home from '@/components/home.vue'
import Modify from '@/components/modify.vue'
import Publish from '@/components/publish.vue'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      redirect: 'login'
    },
    {
      path: '/',
      name: 'index',
      component: Index,
      children: [
        {
          path: '/home',
          name: 'home',
          component: Home
        },
        {
          path: '/modify',
          name: 'modify',
          component: Modify
        },
        {
          path: '/publish',
          name: 'publish',
          component: Publish,
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    }
  ]
});

//路由守卫
router.beforeEach((to, from, next) => {
  //获取token
  const tokenStr = window.localStorage.getItem("token");
  if(to.path == '/login'){
    return next();
  }
  if(!tokenStr) return next("/login");
  next();
});

export default router;
