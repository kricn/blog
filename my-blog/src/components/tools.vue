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
          <input type="text" class="searchipt" placeholder="请输入关键字...">
          <i class="iconfont icon-Search"></i>
        </div>
        <ul class="search-ul">
          <li class="search-li"  v-for="article in articles">
            <router-link :to="{ name: 'article', params: {id: article.id} }" @click="flushCom">
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
      articles: []
    }
  },
  created(){
    this.getArticle();
  },
  methods: {
    async getArticle(){
      this.axios({
        method: "GET",
        url: "/api/admin/getAll",
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
    showList(){
      this.$emit("showList");
    },
    showMe(){
      this.$emit("showMe");
    },
    flushCom(){
      this.router.go(0);
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/less/tool.less';
// .tools-nav{
//   > .tools-nav-ul{
//     display: none;
//   }
// }
// .tools-nav-show{
//   display: block;
// }
// .tools-wrap{
//   .show{
//     display: block
//   }
//   .hide{
//     display: none;
//   }
//   height: 100%;
//   position: absolute;
//   width: 300px;
//   color: #e5e5e5;
//   > .tools-section{
//     height: 100%;
//     color: #e5e5e5;
//   }
//   > .tools-section-all{
//     > .search-wrap{
//       width: 310px;
//       margin: 20px 20px 10px;
//       position: relative;
//       > .searchipt{
//         font-size: 16px;
//         width: 310px;
//         border: 0;
//         background: none;
//         color: #fff;
//         border-bottom: 2px solid #fff;
//         line-height: 1.75;
//         &:focus{
//           outline: none;
//         }
//       }
//       > .icon-Search{
//         color: #fff;
//         position: absolute;
//         top: 8px;
//         right: 0;
//         cursor: pointer;
//       }
//     }
//     > .search-ul{
//       margin-top: 10px;
//       > .search-li{
//         padding: 10px 20px;
//         .icon-Book{
//           color: #fff;
//         }
//       }
//     }
//   }
//   > .tools-section-me{
//     > .aboutme-wrap{
//       color: #fff;
//       display: flex;
//       align-items: center;
//       justify-content: center;
//       width: 100%;
//       height: 100%;
//     }
//   }
// }
//
// @media screen and (max-width: 800px){
//   .tools-nav{
//     padding: 10px 0;
//     display: flex;
//     justify-content: center;
//     > .tools-nav-ul{
//       display: block;
//       border: 1px solid #fff;
//       text-align: center;
//       font-size: 14px;
//       line-height: 24px;
//       margin-left: 28px;
//       > li{
//         float: left;
//         width: 50%;
//         &:first-child{
//           border-right: 1px solid #fff;
//         }
//         > a{
//           display: block;
//         }
//         > .active{
//           background: #a0cfe4;
//         }
//       }
//     }
//   }
//   .tools-wrap{
//     > .tools-section-all{
//       > .search-wrap{
//         width: 280px;
//       }
//     }
//   }
// }
</style>
