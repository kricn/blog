# 说明
**仓库不再更新，站点也不再更新，可以去站点预览demo**\
**线上demo(www.bamnyt.com)**
# myBlog
基于vue和koa的个人博客, 用vue-cli3.x脚手架搭建

## 项目启动
先将数据导入数据库，再server/config.js修改数据库的名字、密码，端口等
启动数据库
在power shell下
npm i     （admin, serve, my-blog都要）

## 开发模式
### my-blog 
  npm run start
### admin
  npm run strat
### serve
  node serve.js
## 生产环境
  npm run build
  开发模式用 /api 进行代理解决跨域 部署到线上时需要将server的地址用路径 /api 进行代理解决跨域问题

blog主体端口8080
admin端口8081
serve端口3000
初始用户名：mnyt
初始密码: 123456
