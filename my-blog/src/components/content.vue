<template>
  <div style="width: 100%;height:100%;">
    <nav id="mobile-nav">
      <div class="overlay"></div>
      <div class="btnctn">
        <div class="slider-trigger" @click.stop="showTools">
          <i class="iconfont icon-list"></i>
        </div>
      </div>
      <div class="intrude-less">
        <header id="header" class="inner">
          <div class="profilepic">
            <img src="../assets/profile.jpg" alt="profile">
          </div>
          <hgroup>
            <h1>Kricn</h1>
          </hgroup>
          <p>抬头，向前</p>
          <nav class="header-nav">
            <div class="social">
              <a href="javascript:;">
                <i class="iconfont icon-github"></i>
              </a>
              <a href="javascript:;">
                <i class="iconfont icon-email"></i>
              </a>
            </div>
          </nav>
          <nav class="header-menu">
            <ul>
              <li>
                <router-link :to="{ path: '/index' }">首页</router-link>
              </li>
              <li>
                <a href="javascript:;">掘金</a>
              </li>
            </ul>
          </nav>
        </header>
      </div>
      <div class="mobile-mask" :class="[this.isShow?'mobile-mask-show':'mobile-mask-hide']"></div>
    </nav>
    <div id="wrapper" class="body-wrap">
      <div class="menu-1">
        <div class="content-l1" id="js-content">
          <article class="article" v-for="article in articles">
            <div class="article-inner">
              <header class="article-header">
                <h1>
                  <router-link :to="{ name: 'article', params: {id: article.id} }">{{article.title}}</router-link>
                </h1>
                <a href="javascript:;" class="archive-article-date">
                  <time datatime="article.date">
                    {{article.date}}
                  </time>
                </a>
                <div class="clearfix"></div>
              </header>
              <div class="article-entry" v-html="article.contents" :style="{maxHeight: isArticle_show?'':'300px'}">

              </div>
              <div class="article-info">
                <div class="tagcloud">
                  <i class="iconfont icon-Tag"></i>
                  <ul class="article-tag">
                    <li>
                      <a href="javascript:;">
                        tag1
                      </a>
                    </li>
                    <li>
                      <a href="javascript:;">
                        tag2
                      </a>
                    </li>
                  </ul>
              </div>
                <p><router-link :to="{ name: 'article', params: {id: article.id} }">展开全文>></router-link></p>
                <div class="clearfix"></div>
              </div>
            </div>
          </article>
          <nav id="page-nav">
            <a href="javascript:;"
             @click="pageUp"
             >
             << prev</a>
            <span class="page-number" v-for="artPage in allPages">
              <span
               :class="[artPage==page?'current':'']"
               @click="pageJump(artPage)"
               >
               {{artPage}}</span>
            </span>
            <a href="javascript:;"
             @click="pageDown"
             >
             next >></a>
          </nav>
        </div>
      </div>
    </div>
    <footer class="footer">
      <div class="footer_left">
        <p>@2019 Kricn</p>
      </div>
      <div class="footer_right">

      </div>
    </footer>
  </div>
</template>

<script>
import {SERVER} from "../config.js"
export default {
  props: ["isShow"],
  data(){
    return {
      //所有文章
      all: [],
      //文章能分几页
      allPages: 1,
      //文章数据
      articles: [],
      //默认第一页
      page: 1,
      //一页展示的条数
      articles_count: 10,
      //展示全文
      isArticle_show: false
    }
  },
  created(){
    this.getAll();
    this.getArticle();
  },
  methods: {
    //获取所有文章
    getAll(){
      this.axios({
        method: "GET",
        url: '/api/blog/getAll',
        dataType: "json"
      })
      .then(data=>{
        let res = data.data;
        this.allPages = Math.ceil(res.length/this.articles_count);
      })
      .catch(e=>{
        if(e){
          console.log(e);
        }
      })
    },
    //获取展示文章
    getArticle(){
      this.axios({
        method: 'GET',
        url: "/api/blog/get",
        dataType: 'json',
        params: {
          page: this.page,
          count: this.articles_count
        }
      }).then(data=>{
        let article = data.data;

        article.forEach(art => {
          let oDate = new Date(art.date * 1000);
          art.date = `${oDate.getFullYear()}-${oDate.getMonth()+1}-${oDate.getDate()}`
        })

        this.articles = article.reverse();
      }).catch(e=>{
        console.log(e);
      });
    },
    //信息栏展示
    showTools(){
      this.$emit("showMobTools");
    },
    //全文展示
    article_show(){
      this.isArticle_show = !this.isArticle_show
    },
    //上一页
    pageUp(){
      this.page--;
      if(this.page < 1){
        this.page = 1;
        return ;
      }
      this.getArticle();
    },
    //下一页
    pageDown(){
      this.page++;
      if(this.page > this.allPages){
        this.page = this.allPages;
        return;
      }
      this.getArticle();
    },
    //指定页
    pageJump(page){
      this.page = page;
      this.getArticle();
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/less/content.less';

</style>
