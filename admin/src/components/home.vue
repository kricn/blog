<template lang="html">
  <el-table
    v-loading="loading"
    :data="articles"
    height="100%"
    border
    style="width: 100%">
    <el-table-column
      prop="id"
      label="ID"
      width="180">
    </el-table-column>
    <el-table-column
      prop="title"
      label="标题"
      width="400">
    </el-table-column>
    <el-table-column
      prop="date"
      label="日期"
      width="100">
    </el-table-column>
    <el-table-column
      prop="isDisplay"
      label="是否展示"
      width="50">
    </el-table-column>
    <el-table-column
      label="操作">
      <template slot-scope="scope">
        <!-- 展示按钮 -->
        <el-button
         v-if="scope.row.isDisplay"
         @click="scope.row.isDisplay?delete_article(scope.row.id):restore_article(scope.row.id)"
         type="danger" icon="el-icon-delete"
         size="mini"
         circle>
       </el-button>
        <el-button
         v-else="scope.row.isDisplay"
         @click="scope.row.isDisplay?delete_article(scope.row.id):restore_article(scope.row.id)"
         type="success" icon="el-icon-check"
         size="mini"
         circle>
       </el-button>
       <!-- 修改按钮 -->
       <el-button
        @click="modify_article(scope.row.id)"
        type="primary" icon="el-icon-edit"
        size="mini"
        circle>
      </el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import {SERVER} from "../config.js"
export default {
  data(){
    return {
      //文章数据
      articles: [],
    }
  },
  async created(){
    //获取文章数据
    this.axios({
      method: "GET",
      url: "/api/admin/home",
    })
    .then(data=>{
      let res = data.data;
      res.forEach(arr=>{
        let oDate = new Date(arr.date * 1000);
        arr.date = `${oDate.getFullYear()}-${oDate.getMonth()+1}-${oDate.getDate()}`
      });
      this.articles = res.reverse();
    }).catch(e=>{
      if(e){
        console.log(e);
      }
    });
  },
  computed: {
    loading(){
      if(this.articles.length > 0){
        return false;
      }
      return true;
    }
  },
  methods: {
    //文章删除
    async delete_article(id){
      this.axios({
        method: "GET",
        url: `/api/admin/delete/${id}`,
        data: id
      })
      .catch(e=>{
        if(e){
          console.log(e);
        }
      });
      this.$router.go(0);
    },
    //文章恢复
    async restore_article(id){
      this.axios({
        method: "GET",
        url: `/api/admin/restore/${id}`,
        data: id
      })
      .catch(e=>{
        if(e){
          console.log(e);
        }
      });
      this.$router.go(0);
    },
    //文章修改
    async modify_article(id){
      this.$router.push({path: `/modify/${id}`})
    }
  }
}
</script>

<style lang="less" scoped>
.ctatlog{
  >.table{
    display: block;
    border: 1px solid #ccc;
    padding: 10px;
    margin-top: 10px;
    >thead,tbody,th,tr{
      display: block;
      text-align: center;
    }
    tbody{
      margin: 10px 0;
    }
    tr{
      margin: 10px 0;
    }
    td{
      width: 200px;
      margin: 0 10px;
    }
    a{
      color: #333;
      border: 1px solid #333;
      padding: 5px;
    }
  }
}
</style>
