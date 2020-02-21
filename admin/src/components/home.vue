<template lang="html">
  <el-table
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
      </template>
    </el-table-column>
  </el-table>
  <!-- <div class="ctatlog">
    <table class="table">
      <thead>
        <th>
          <td>id</td>
          <td>title</td>
          <td>date</td>
          <td>isDisplay</td>
          <td>opteration</td>
        </th>
      </thead>
      <tbody>
        <tr v-for="(data, index) in articles">
          <td>{{data.id}}</td>
          <td>{{data.title}}</td>
          <td>{{data.date}}</td>
          <td>{{data.isDisplay}}</td>
          <td>
            <a href="javascript:;" @click="data.isDisplay?delete_article(data.id):restore_article(data.id)">{{data.isDisplay?'delete':'restore'}}</a>
            <a href="javascript:;" @click="modify_article(data.id)">modify</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div> -->
</template>

<script>
import {SERVER} from "../config"
export default {
  data(){
    return {
      //文章数据
      articles: []
    }
  },
  async created(){
    //获取文章数据
    let res = await fetch(SERVER+"admin/home");
    let json = await res.json();
    json.forEach(json => {
      let oDate = new Date(json.date * 1000);
      json.date = `${oDate.getFullYear()}-${oDate.getMonth()+1}-${oDate.getDate()}`
    })
    this.articles = json;
  },
  methods: {
    async delete_article(id){
      let res = await fetch(SERVER+`admin/delete/${id}`, {
        params: id
      });
      this.$router.go(0);
    },
    async restore_article(id){
      console.log(id)
      let res = await fetch(SERVER+`admin/restore/${id}`, {
        params: id
      });
      this.$router.go(0);
    },
    async modify_article(id){
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
