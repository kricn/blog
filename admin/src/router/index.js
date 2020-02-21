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
      component: Index,
      children: [
        {
          path: '/home',
          component: Home
        },
        {
          path: '/modify',
          component: Modify
        },
        {
          path: '/publish',
          component: Publish
        }
      ]
    },
    {
      path: '/login',
      component: Login
    }
  ]
});

//路由守卫
router.beforeEach((to, from, next) => {
  if(to.path == '/login') return next();
  //获取token
  const tokenStr = window.localStorage.getItem("token");

  if(!tokenStr) return next("/login");
  next()
});

export default router;
