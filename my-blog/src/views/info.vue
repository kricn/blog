<template lang="html">
  <div>
    <div class="overlay"></div>
    <div class="intrude-less">
      <header id="header" class="inner">
        <router-link :to="{path: '/index'}" class="profilepic">
          <img src="../assets/profile.jpg" alt="profile">
        </router-link>
        <hgroup>
          <h1>Kricn</h1>
        </hgroup>
        <p>抬头，向前</p>
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
        <nav class="header-smart-menu">
          <a href="javascript:;" @click.stop="showList">所有文章</a>
          <a href="javascript:;" @click.stop="showMe">关于我</a>
        </nav>
        <nav class="header-nav">
          <div class="social">
            <a href="https://github.com/kricn" class="github">
              <i class="iconfont icon-github"></i>
            </a>
            <a href="mailto:mnyt2436@126.com" class="email">
              <i class="iconfont icon-email"></i>
            </a>
          </div>
        </nav>
      </header>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
    }
  },
  methods: {
    showList(){
      this.$emit("showList");
    },
    showMe(){
      this.$emit("showMe");
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/less/info.less';
</style>
