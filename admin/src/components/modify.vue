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
  <div
   v-else
   class="modify">
     请去首页选择需要修改的文章
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
      if(this.doc != this.md){
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
      oldTitle: ''
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
            alert(res.msg);
            this.$router.push("/home");
            return ;
          }
          this.md = res.md;
          this.doc = res.md;
          this.title = res.title;
          this.oldTitle = res.title;
          console.log(res);
        })
      }
    },
    save(){
      console.log("s")
    },
    async modify(){
      
    },
    async $imgAdd(pos, $file){

    },
    async $imgDel(pos){

    },
    change(){
      console.log("a");
    }
  }
}
</script>

<style lang="less" scoped>
.info{
  margin: 20px 0;
  .el-input{
    width: 50%;
    margin-right: 10px;
  }
}
</style>
