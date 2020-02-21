import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/index.vue'
import Content from '@/components/content.vue'
import Article from '@/components/article.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: Index,
      redirect: '/index',
      children: [
        {
          path: '/index',
          component: Content
        },
        {
          path: 'article/:id',
          name: 'article',
          component: Article
        }
      ]
    },
    {
      path: '/article',
      redirect: '/'
    }
  ]
})
