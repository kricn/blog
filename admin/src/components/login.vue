<template lang="html">
  <div class="login">
    <div class="login_box">
      <div class="login_profile">
        <img src="../assets/profile.jpg" alt="profile">
      </div>
      <div class="login_info">
        <form class="login_form" :action="SERVER+'admin/login'" method="post" enctype="multipart/form-data"  ref="login_form">
          <div class="login_user">
            <label for="username">user:</label>
            <input type="text" name="username" placeholder="username" v-model="user.username">
          </div>
          <div class="login_pass">
            <label for="password">password:</label>
            <input type="password" name="password" placeholder="password" v-model="user.password">
          </div>
          <input class="sub_btn" type="button" name="submit" value="login" @click="submit_form">
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import {SERVER} from "../config"
export default {
  data(){
    return {
      user: {username: "mnyt", password: 123456},
      SERVER
    }
  },
  methods: {
    async submit_form(){
      let form = this.$refs["login_form"];
      let formData = new FormData(form);

      let res = await fetch(form.action, {
        method: form.method,
        body: formData
      });

      let json = await res.json();

      if(json.err){
        alert(json.msg);
      }else{
        localStorage.token=json.token;
        alert('login success');

        this.$router.push("/home");
      }
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
  background: linear-gradient(200deg,#a0cfe4,#e8c37e);
  position: relative;
  >.login_box{
    width: 50%;
    height: 60%;
    border: 1px solid #999;
    background: #fff;
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
      top: 0%;
      transform: translate(-50%, -50%);
      background: #fff;
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
      >.login_form{
        width: 70%;
        >div{
          padding: 10px 0;
          text-align: left;
          >label{
            font-size: 14px;
            padding: 10px;
            display: none;
          }
          >input{
            width: 100%;
            display: block;
            border: 0;
            border: 1px solid #777;
            background: #E8F0FE;
            border-bottom: 5px solid #eaeaea;
            color: #777;
            padding: 10px;
            font-size: 16px;
            box-shadow: 1px -1px;
            &:hover{
              outline: none;
            }
          }
        }
        >.sub_btn{
          padding: 10px;
          background: none;
          border: 1px solid #000;
          font-size: 14px;
          color: #777;
          cursor: pointer;
          &:hover{
            background: #eaeaea;
          }
        }
      }
    }
  }
}
</style>
