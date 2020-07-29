import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router1 = [
  {
    path: '/',
    name: 'index',
    component: resolve => require(['@/views/index.vue'], resolve),
    redirect: '/index',
    children: [
      {
        path: '/index',
        component: resolve => require(['@/views/content.vue'], resolve)
      },
      {
        path: 'article/:id',
        name: 'article',
        component: resolve => require(['@/views/article.vue'], resolve)
      }
    ]
  },
  {
    path: '/article',
    redirect: '/'
  }
]

const router = new Router({
  routes: router1
})

export default router
