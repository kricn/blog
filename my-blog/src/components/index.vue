<template>
  <div v-on:click="close">
    <div class="col-left" :class="[isShow?'left-style':'']">
      <Info @showList="showList" @showMe="showMe"></Info>
    </div>
    <!-- 文章内容 -->
    <div class="col-mid" :class="[isShow?'mid-show':'']">
      <transition name="fade" mode="out-in">
        <router-view
        :key="key"
         @showMobTools="showMobTools"
        :isShow="isShow"
        />
      </transition>
    </div>
    <!-- 展示信息栏 -->
    <div class="col-tools" v-show="isShow" @click.stop="" :class="[isShow?'tools-show':'tools-hide']" ref="colTools">
      <Tools
      :isDisplay="isDisplay"
      :isShowMobileTools="isShowMobileTools"
      :isActive="isActive"
      @showList="showList"
      @showMe="showMe"
      >
      </Tools>
    </div>
  </div>
</template>

<script>
const Info = () => import('./info.vue');
const Content = () => import('./content.vue');
const Tools = () => import('./tools.vue');
export default {
  data(){
    return {
      //控制tools
      isShow: false,
      //控制tools中的section
      isDisplay: false,
      //控制mobile下的tools
      isShowMobileTools: false,
      //控制tools下哪个section高亮
      isActive: true
    }
  },
  methods: {
    showList(){
      this.isShow = true;
      this.isDisplay = false;
      this.isActive = true;
    },
    showMe(){
      this.isShow = true;
      this.isDisplay = true;
      this.isActive = false;
    },
    showMobTools(){
      this.isShow = true;
      this.isShowMobileTools = true;
    },
    close(){
      this.isShow = false;
    }
  },
  computed: {
    //给router-view添加一个key值
    key() {
        return this.$route.name !== undefined? this.$route.name + +new Date(): this.$route + +new Date()
    }
  },
  components: {
    Info, Content, Tools
  }
}
</script>

<style lang="less" scoped>
  @import '../assets/less/Left.less';
  @import '../assets/less/Mid.less';
  @import '../assets/less/Tools.less';
  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
    opacity: 0;
  }
</style>
