const Router = require("koa-router");
const path = require("path");
const fs = require("fs");
const myFs = require("../../libs/common")
const formidable = require("formidable");

let router = new Router();

//全部展示文章的数据
router.get("/getAll", async ctx => {
	let datas = await ctx.db.query(`select * from post where isDisplay=1`);
	ctx.body = datas;
});

//博客展示文章取数据
router.get('/get', async ctx => {
	let query = ctx.request.query;
	//页数
	let page = Number(query.page);
	//数量
	let count = Number(query.count);
	let datas = await ctx.db.query(`select * from post where isDisplay=1 limit ?, ?`, [page*count-count, page*count]);

	ctx.body = datas;
});

//搜索接口
router.post("/search", async ctx=>{
  let data = ctx.request.fields;
  //关键字
  let key = data.key;
  //检索数据库
  let datas = await ctx.db.query(`select * from post where isDisplay=1 and upper(title) like ?`, [`%${key}%`]);
  ctx.body = datas;
});

module.exports=router.routes();
