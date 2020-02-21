<template lang="html">
  <el-container class="container">
    <!-- header -->
    <el-header>
      <Header/>
    </el-header>
    <el-container>
      <!-- aside -->
      <el-aside width="auto">
        <el-menu
        default-active="/home"
        text-color="#fff"
        background-color="#333"
        :collapse="isCollapse"
        router
        >
          <!-- 首页 -->
          <el-menu-item index="/home">
              <i class="el-icon-location"></i>
              <span>首页</span>
          </el-menu-item>
          <!-- 修改文章 -->
          <el-menu-item index="/modify">
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
        <div class="clearfix"></div>
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
</el-container>
  <!-- <div>
    <Header/>
    <div class="">
      <router-view></router-view>
    </div>
  </div> -->
</template>

<script>
import Header from '@/components/header.vue';

export default {
  data(){
    return {
      //nav菜单展开和折叠
      isCollapse: false
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
.el-header{
  color: #fff;
  height: 120px;
  background: #262626;
}
.el-aside{
  >.el-menu{
    border: 0;
    height: 100%;
    overflow: hidden;
    >.el-menu-item{
      width: 200px;
    }
    >.nav_btn{
      width: 100%;
      border-top: 2px solid #222;
      padding: 10px;
      position: absolute;
      bottom: 0;
      >.el-button{
        border: none;
        background: #333;
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
}
</style>
