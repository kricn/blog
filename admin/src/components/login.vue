<template lang="html">
  <div class="login">
    <div class="login_box">
      <div class="login_profile">
        <img src="../assets/profile.jpg" alt="profile">
      </div>
      <div class="login_info">
        <el-form
         :model="user"
         label-width="15%"
         ref="login_form"
         :rules="rules"
         >
          <el-form-item label="user" prop="username">
            <el-input v-model="user.username"></el-input>
          </el-form-item>
          <el-form-item label="password" prop="password">
            <el-input v-model="user.password" type="password"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submit_form">登录</el-button>
            <el-button @click="reset">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import {SERVER} from "../config.js"
export default {
  data(){
    return {
      user: {username: "mnyt", password: 12345},
      SERVER,
      //验证规则
      rules: {
        username: [
          {required: true, message: "请输入用户名", trigger:"blur"}
        ],
        password: [
          {required: true, message: "请输入密码", trigger:"blur"}
        ],
      }
    }
  },
  methods: {
    //表单提交, 用户登录
    async submit_form(){
      let url = "/api/admin/login"
      this.$refs["login_form"].validate(valid=>{
        if(valid){
          this.axios({
            method: "POST",
            url: url,
            data: this.user
          })
          .then(data=>{
            let res = data.data;

            if(res.err){
              this.$message.error(res.msg)
              return ;
            }
            localStorage.token = res.token;
            this.$message({
              message: "登录成功",
              type: "success"
            })
            this.$router.push("/home");
          });
        }
      });
    },
    reset(){
      this.$refs["login_form"].resetFields();
    }
  }
}
</script>

<style lang="less" scoped>
.login{
  width: 100%;
  height: 100%;
  min-width: 360px;
  min-height: 500px;
  background: linear-gradient(200deg,#a0cfe4, #e8c37e);
  position: relative;
  >.login_box{
    width: 50%;
    height: 60%;
    background: rgba(255,255,255, 0.2);
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    >.login_profile{
      width: 128px;
      height: 128px;
      border-radius: 50%;
      position: absolute;
      left: 50%;
      top: 0;
      transform: translate(-50%, -50%);
      background: rgba(255,255,255, 0.2);
      >img{
        width: 128px;
        height: 128px;
        border-radius: 50%;
        padding: 10px;
      }
    }
    >.login_info{
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      >.el-form{
        width: 70%;
      }
    }
  }
}
</style>
