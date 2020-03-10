<template lang="html">
  <div>
    <div class="info">
      <el-input type="text"
       name="title"
       v-model="title"
       prefix-icon="el-icon-magic-stick"
       clearable
       >
     </el-input>
     <el-button
      @click="publish"
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
</template>

<script>
import {SERVER} from "../config.js"
import {mavonEditor} from "mavon-editor";
import "mavon-editor/dist/css/index.css";

import axios from 'axios'

export default {
  components: {mavonEditor},
  data(){
    return {
      //md内容
      doc: '',
      //文章标题
      title: ''
    }
  },
  //路由守卫
  beforeRouteLeave(to, from, next){
    let title = this.title;
    let markdown = this.$refs.editor.d_value;
    if(!title && !markdown){
      return next();
    }else{
      let leave = confirm('即将离开页面，你的操作将不会被保存。是否继续操作');
      if(leave){
        return next();
      }
    }
    return next(false);
  },
  methods: {
    //保存
    save(){
    },
    //发表
    publish(){
      let title = this.title;
      let date = Math.floor(Date.now()/1000);
      let markdown = this.$refs.editor.d_value;
      let html = this.$refs.editor.d_render;
      let url = "/api/admin/create"
      axios({
        method: "POST",
        url: url,
        data: {
          title,
          date,
          markdown,
          html
        }
      })
      .then(data=>{
        let res = data.data;
        if(res.err){
          this.$message(res.msg)
          return ;
        }
        this.$message({
          message: res.msg,
          type: "success"
        })
      });
    },
    //添加图片
    $imgAdd(pos, $file){
      var formdata = new FormData();
      formdata.append('image', $file);
      this.axios({
        method: "POST",
        url: "/api/admin/upload",
        data: formdata
      })
      .then(data=>{
        let src = data.data
        this.$refs.editor.$img2Url(pos, `${SERVER}images/` + src)
      });
    },
    //图片删除
    $imgDel(pos){
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
.info{
  margin: 20px 0;
  >.el-input{
    width: 50%;
    margin-right: 10px;
  }
}
</style>
