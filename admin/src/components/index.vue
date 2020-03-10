<template lang="html">
  <el-container class="container">
    <!-- header -->
    <!-- <el-header>
      <Header/>
    </el-header> -->
    <el-container>
      <!-- aside -->
      <el-aside width="auto">
        <el-menu
        :default-active="$route.path"
        text-color="#fff"
        :collapse="isCollapse"
        router
        >
          <!-- 首页 -->
          <el-menu-item index="/home">
              <i class="el-icon-location"></i>
              <span>首页</span>
          </el-menu-item>
          <!-- 修改文章 -->
          <el-menu-item :key="key" :index="modifyId">
              <i class="el-icon-location"></i>
              <span>修改文章</span>
          </el-menu-item>
          <!-- 发表文章 -->
          <el-menu-item index="/publish">
              <i class="el-icon-location"></i>
              <span>发表文章</span>
          </el-menu-item>
          <div class="nav_btn" v-model="isCollapse">
            <el-button @click="nav_show" icon="el-icon-star-off" circle></el-button>
          </div>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
    <ul class="animation_ul">
      <li v-for="(count,index) in animation_counts" :key="index"></li>
    </ul>
</el-container>
</template>

<script>
//import Header from '@/components/header.vue';
const Header = () => import('@/components/header.vue')

export default {
  computed: {
    modifyId(){
      let params = this.$route.params.id;
      if(!params){
        return "/modify";
      }
      return `/modify/${params}`
    },
    //添加key值，随机，可以在复用路由时（比如带参数）确保此时路由是唯一的，不然不会跳转。
    key() {
        return this.$route.name !== undefined? this.$route.name + +new Date(): this.$route + +new Date()
    }
  },
  data(){
    return {
      //nav菜单展开和折叠
      isCollapse: false,
      //动画li数量的长度
      animation_counts: 10,
    }
  },
  components: {
    Header
  },
  methods: {
    //nav展开与折叠
    nav_show(){
      this.isCollapse = !this.isCollapse
    }
  }
}
</script>

<style lang="less" scoped>
.el-container{
  .el-header{
    color: #fff;
    height: 200px;
    background: #000;
  }
  .el-aside{
    >.el-menu{
      background: #333;
      border: 0;
      height: 100%;
      overflow: hidden;
      >.el-menu-item{
        width: 200px;
        &.is-active{
          color: lightblue;
        }
        &:hover{
          background-color: rgba(200, 200, 200, 0);
        }
        &:focus{
          background-color: rgba(200, 200, 200, 0);
        }
      }
      >.nav_btn{
        width: 100%;
        border-top: 2px solid #fff;
        padding: 10px;
        position: absolute;
        bottom: 0;
        >.el-button{
          border: none;
          background: rgba(255, 255, 255, 0.3);
          color: #fff;
          &:hover{
            background: #444;
          }
        }
      }
    }
  }
  .el-main{
    width: 100%;
    padding: 0;
  }
}
</style>
