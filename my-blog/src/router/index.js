import Vue from 'vue'
import Router from 'vue-router'
// import Index from '@/components/index.vue'
// import Content from '@/components/content.vue'
// import Article from '@/components/article.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: resolve => require(['@/components/index.vue'], resolve),
      redirect: '/index',
      children: [
        {
          path: '/index',
          component: resolve => require(['@/components/content.vue'], resolve)
        },
        {
          path: 'article/:id',
          name: 'article',
          component: resolve => require(['@/components/article.vue'], resolve)
        }
      ]
    },
    {
      path: '/article',
      redirect: '/'
    }
  ]
})
