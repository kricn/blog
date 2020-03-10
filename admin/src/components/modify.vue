<template lang="html">
  <div
   v-if="this.$route.params.id"
   class="modifyId">
   <div class="info">
     <el-input type="text"
      name="title"
      v-model="title"
      prefix-icon="el-icon-magic-stick"
      clearable
      >
    </el-input>
    <el-button
     @click="modify"
     plain
     type="primary"
     >
     publish
     </el-button>
   </div>
   <mavon-editor
    ref="editor"
    v-model="doc"
    @imgAdd="$imgAdd"
    @imgDel="$imgDel"
    @change="change"
    :ishljs="true"
    ></mavon-editor>
  </div>
  <!--——————————————————————————————————————————————————————————————————————————————————-->
  <div
   v-else
   class="modify">
     <ul class="animation_ul">
       <li v-for="(count,index) in animation_counts" :key="index"></li>
     </ul>
     <div class="text">
       去首页选择一篇文章修改吧！
     </div>
  </div>
</template>

<script>
//引入mavon-editor
import {mavonEditor} from "mavon-editor";
import "mavon-editor/dist/css/index.css";
//引入axios
import axios from 'axios'

export default {
  components: {mavonEditor},
  created(){
    this.getData();
  },
  beforeRouteLeave(to, from, next){
    if(this.id){
      if(this.doc != this.md && this.isModify){
        let leave = confirm("文章相关作出了改变，离开页面所更改内容将不出被保存，是否退出？")
        if(leave){
          return next();
        }
        return next(false)
      }
    }
    next();
  },
  data(){
    return {
      doc: '',
      //文章标题
      title: '',
      //修改文章的id
      id: this.$route.params.id || '',
      //文章原始md文件
      md: '',
      //文章原始标题
      oldTitle: '',
      //是否已经修改标志，路由守卫上用
      isModify: true,
      //动画li数量的长度
      animation_counts: 10,
    }
  },
  methods: {
    //获取修改文章的信息
    getData(){
      if(this.id){
        this.axios({
          type: "GET",
          url: `/api/admin/modify/${this.id}`,
          dataType: "json"
        }).then(data=>{
          let res = data.data;
          if(res.err){
            this.$message.error(res.msg);
            this.$router.push("/home");
            return ;
          }
          this.md = res.md;
          this.doc = res.md;
          this.title = res.title;
          this.oldTitle = res.title;
        })
      }
    },
    save(){
      console.log("s")
    },
    modify(){
      if(this.md != this.doc){
        let title = this.title;
        let markdown = this.$refs.editor.d_value;
        let html = this.$refs.editor.d_render;
        let url = `/api/admin/modify/${this.id}`
        axios({
          method: "POST",
          url: url,
          data: {
            title,
            markdown,
            html
          }
        })
        .then(data=>{
          let res = data.data;
          if(res.err){
            this.$message.error(res.msg);
            return ;
          }
          this.$message({
            message: res.msg,
            type: "success"
          });
          //清除路由守卫离开标志
          this.isModify = false
          this.$router.push("/modify");
        });
      }else{
        this.$message("文章相关内容未改变，不需要提交");
      }
    },
    async $imgAdd(pos, $file){
      var formdata = new FormData();
      formdata.append('image', $file);
      axios({
        method: "POST",
        url: "/api/admin/upload",
        data: formdata
      })
      .then(data=>{
        let src = data.data
        this.$refs.editor.$img2Url(pos, `${SERVER}images/` + src)
      });
    },
    async $imgDel(pos){
      let name = pos[0];
      axios({
        method: "POST",
        url: "/api/admin/imgdel",
        data: {name}
      })
      .then()
    },
    change(){

    }
  }
}
</script>

<style lang="less" scoped>
@import "../assets/less/modify.less";
.info{
  margin: 20px 0;
  .el-input{
    width: 50%;
    margin-right: 10px;
  }
}
</style>
