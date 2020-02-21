<template lang="html">
  <div>
    <input type="text" name="title" ref="title">
    <a href="javascript:;" @click="test" style="color:#ccc;">clickit</a>
    <mavon-editor
     ref="editor"
     v-model="doc"
     @imgAdd="$imgAdd"
     @imgDel="$imgDel"
     @change="change"
     :ishljs="true"
     > </mavon-editor>
  </div>
</template>

<script>
import {SERVER} from "../config"
import {mavonEditor} from "mavon-editor";
import "mavon-editor/dist/css/index.css";

import axios from 'axios'

export default {
  name: "Create",
  components: {mavonEditor},
  data(){
    return {
      doc: ''
    }
  },
  methods: {
    save(){
      console.log("s")
    },
    async test(){
      let title = this.$refs.title.value;
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
          alert(res.msg);
          return ;
        }
        alert(res.msg);
      });
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
        this.$refs.editor.$img2Url(pos, SERVER+"images/" + src)
      });
    },
    async $imgDel(pos){
      axios({
        method: "POST",
        url: "/api/admin/imgdel",
        data: pos
      })
      .then()
    },
    change(){
      console.log("a");
    }
  }
}
</script>

<style lang="less" scoped>

</style>
