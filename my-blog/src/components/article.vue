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
                <a href="javascript:;">{{article.title}}</a>
              </h1>
              <a href="javascript:;" class="archive-article-date">
                <time datatime="article.date">
                  {{article.date}}
                </time>
              </a>
              <div class="clearfix"></div>
            </header>
            <div class="article-entry" v-html="article.contents" >
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
              <div class="article_share" style="display:none">
                分享模块
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </article>
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
      articles: []
    }
  },
  created(){
    this.getArticle();
  },
  methods: {
    getArticle(){
      this.axios({
        method: 'get',
        url: `/api/blog/getAll`,
        dataType: 'json'
      }).then(data=>{
        let article = data.data;

        article.forEach(art => {
          let oDate = new Date(art.date * 1000);
          art.date = `${oDate.getFullYear()}-${oDate.getMonth()+1}-${oDate.getDate()}`

          if(art.id == this.$route.params.id)
          {
            this.articles.push(art);
          }
        });
      }).catch(e=>{
        console.log(e);
      });
    },
    showTools(){
      this.$emit("showMobTools");
    },
    article_show(){
      this.isArticle_show = !this.isArticle_show
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/less/content.less';

</style>
