<template lang="html">
  <div style="height:100%;">
    <div class="tools-nav" :class="[isShowMobileTools?'tools-nav-show':'']">
      <ul class="tools-nav-ul" style="width:70%;">
        <li> <a href="javascript:;" @click.stop="showList" :class="
        [isActive?'active':'']">所有文章</a> </li>
        <li> <a href="javascript:;" @click.stop="showMe" :class="
        [isActive?'':'active']">关于我</a> </li>
      </ul>
    </div>
    <div class="tools-wrap">
      <section class="tools-section tools-section-all" :style="{display: isDisplay?'none':''}">
        <div class="search-wrap">
          <input
            type="text"
            class="searchipt"
            placeholder="请输入关键字..."
            ref="searchInfo"
            v-model="searchInfo"
            @keyup="search"
          />
          <i class="iconfont icon-Search" @click="search"></i>
        </div>
        <ul class="search-ul">
          <li class="search-li"  v-for="article in articles">
            <router-link v-if="article" :to="{ name: 'article', params: {id: article.id} }" @click="flushCom">
              <i class="iconfont icon-Book"></i>
              <span>{{article.title}}</span>
            </router-link>
          </li>
        </ul>
      </section>
      <section class="tools-section tools-section-me" :style="{display: isDisplay?'':'none'}">
        <div class="aboutme-wrap">
          毕业于广东技术师范大学<br><br><br>
          专业：光电信息科学与工程<br><br><br>
          联系方式：<br><br><br>
          QQ: 1344566520<br><br><br>
          微信: mnyt2436<br>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import {SERVER} from "../config.js"
export default {
  props: ["isDisplay", "isShowMobileTools", "isActive"],
  data(){
    return {
      articles: [],
      searchInfo: this.$refs.searchInfo,
    }
  },
  created(){
    this.getArticle();
  },
  methods: {
    //获取全部文章的数据
    async getArticle(){
      this.axios({
        method: "GET",
        url: "/api/blog/getAll",
      })
      .then(data=>{
        let res = data.data;

        res.forEach(arr=>{
          let oDate = new Date(arr.date * 1000);
          arr.date = `${oDate.getFullYear()}-${oDate.getMonth()+1}-${oDate.getDate()}`
        });
        this.articles = res;
      })
    },
    //展示文章列表
    showList(){
      this.$emit("showList");
    },
    //展示关于我列表
    showMe(){
      this.$emit("showMe");
    },
    flushCom(){
      this.router.go(0);
    },
    //搜索请求
    search(){
      let url = `/api/blog/search`;
      //搜索框数据
      let val = this.searchInfo;
      this.axios({
        method: "POST",
        dataType: "json",
        url: url,
        data: {
          key: val
        }
      }).
      then(data=>{
        let res = data.data;
        this.articles = res;
      }).catch(e=>{
        console.log(e)
      });
    },
  }
}
</script>

<style lang="less" scoped>
@import '../assets/less/tool.less';
</style>
