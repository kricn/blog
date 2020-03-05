const Router = require("koa-router");
const path = require("path");
const fs = require("fs");
const myFs = require("../../libs/common")
const formidable = require("formidable");

//当前时间
const nowDate = new Date();
//文件后缀
//用了``不要换行写
var prefix = `${nowDate.getFullYear()}${nowDate.getMonth()+1<10?'0'+(nowDate.getMonth()+1):nowDate.getMonth()+1}${nowDate.getDate()<10?'0'+nowDate.getDate():nowDate.getDate()}${nowDate.getMinutes()<10?'0'+nowDate.getMinutes():nowDate.getMinutes()}${nowDate.getSeconds()<10?'0'+nowDate.getSeconds():nowDate.getSeconds()}${nowDate.getMilliseconds()}_`;


//生成token
const guid = require("uuid/v4");

let router = new Router();


//登陆
router.post("/login", async ctx => {

	let {username, password} = ctx.request.fields;

	let rows = await ctx.db.query(`select * from users where username=?`, [username]);
	if(rows.length == 0){
		ctx.body = {err: 1, msg: 'no this user'}
	}else{
		let row = rows[0];

		if(row['password'] != password){
			ctx.body = {err: 1, msg: "password error"}
		}else{
			//生成token
			token = guid().replace(/\./g, "");
			let token_expires=Math.floor((Date.now()+ctx.config.TOKEN_AGE)/1000);

			await ctx.db.query('update users set token=?, token_expires=?', [token, token_expires]);
			ctx.body = {err: 0, token};
		}
	}
});


//后台管理主页
router.get('/home', async ctx => {
	let datas = await ctx.db.query(`select * from post`);

	let arr = [];

	datas.forEach(data => {
		arr.push(data);
	});

	ctx.body = arr;

});

//全部展示文章的数据
router.get("/getAll", async ctx => {
	let datas = await ctx.db.query(`select * from post where isDisplay=1`);
	ctx.body = datas;
});

//删除
router.get('/delete/:id', async ctx => {

	let {id} = ctx.params;

	await ctx.db.query(`update post set isDisplay=0 where id=?`, [id]);

	ctx.body = "ok";

});
//恢复
router.get('/restore/:id', async ctx => {

	let {id} = ctx.params;

	await ctx.db.query(`update post set isDisplay=1 where id=?`, [id]);

	ctx.body = "ok";
});

//发表
router.post('/create', async (ctx, next) => {
	let data = ctx.request.fields;
	let title = data.title;
	let md = data.markdown;
	let html = data.html;
	let date = data.date;
	let mdpath = path.join(__dirname, `../../static/md/`);
	let mdName = `${prefix}${title}.md`;
	let htmlpath = path.join(__dirname, `../../static/html/`);
	let htmlName = `${prefix}${title}.html`;
	if(!title){
		ctx.body = {err: 1, msg: "标题还没填呢老弟！"};
	}else if(!md){
		ctx.body = {err: 1, msg: "你想发空文章呢！！"};
	}else{
		let mdName = `${prefix}${title}.md`;
		let htmlName = `${prefix}${title}.html`
		//异步回调
		return new Promise((resolve, reject)=>{
			//写入md文件
			fs.writeFile(`${mdpath}${mdName}`, md, err=>{
				if(err){
					ctx.body = {err: 1, msg: "写入md文件失败"};
					resolve(next());
				}
			});
			//写入html文件
			fs.writeFile(`${htmlpath}${htmlName}`, html, err=>{
				if(err){
					ctx.body = {err: 1, msg: "写入html文件失败"};
					resolve(next());
				}
			});
			//单独写入数据库的html表中
			ctx.db.query(`insert into htmlfile (title, src) value(?, ?)`, [title, htmlName]).then();
			//单独写入数据库的mdfile表中
			ctx.db.query(`insert into mdfile (title, src) value(?, ?)`, [title, mdName]).then();
			//写入数据库的post表中
			ctx.db.query(`insert into post (title, mdSrc, htmlSrc, contents, date) value(?, ?, ?, ?, ?)`, [title, mdName, htmlName, html, date]).then();
			ctx.body = {err: 0, msg: "发表成功"};
			resolve(next());
		});
	}
});

//图片写入指定文件夹
function writeFile(title, filepath, targetUrl, newName){
	//创建可读流
	const reader = fs.createReadStream(filepath);
	let newPath = path.join(__dirname, `../../static/${targetUrl}/`) + newName;

	const upStream = fs.createWriteStream(newPath);
	reader.pipe(upStream);
}

//图片上传
router.post('/upload', async ctx => {
	let file = ctx.request.fields;
	let filepath = file.image[0].path;
	let title = file.image[0].name;
	let filesize = file.image[0].size;
	let targetUrl = "images";
	let date = Math.floor(nowDate/1000);
	//写入数据库的新名
	let newName = `${prefix}size_${filesize}_${title}`
	let databaseSrc = await ctx.db.query(`select src from image_table where src=?`, [newName]);
	//let url = path.basename(ctx.request.fields.image[0].path)
	if(filesize>0){
		writeFile(title, filepath, targetUrl, newName);
		//上传相同图片
		if(databaseSrc.length == 0){
			await ctx.db.query(`insert into image_table (src, date) value(?, ?)`, [newName, date]);
		}
	}
	ctx.body = newName;
})

//图片删除
router.post("/imgdel", async ctx=>{
		let {name} = ctx.request.fields;
		let delName = path.basename(name);
		let delpath = path.join(__dirname, `../../static/images/${delName}`);
		fs.unlink(delpath, err=>{
			if(err){
				return console.log(err);
			}
			console.log("ok");
		})
		await ctx.db.query(`delete from image_table where src=?`, [delName]);
		ctx.body = {err: 0, msg: "ok"}
});
///////////////////////////////////////////////////////////////////////////

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

//修改文章接口
//获取原来文章信息
router.get("/modify/:id", async (ctx, next)=>{
	//获取url上的id
	let {id} = ctx.params;
	//md文件数据
	let data = '';
	if(!id){
		ctx.body = {err: 1, msg: "未选择文章"};
		return ;
	}
	//这这...表左联，看着办吧
	// let {title, md } = await ctx.db.query(`select
	// 	                              *,
	// 																post.id as post_id,
	// 																mdfile.id as md_id,
	// 	                              post.title as post_title,
	// 																mdfile.title as md_title
	// 	                              from post left join mdfile on post.title=mdfile.title where post.id=?`, [id]);
	let datas = await ctx.db.query(`select * from post where id=?`, [id]);
	if(!datas[0].mdSrc){
		ctx.body = {err: 1, msg: "该文章没有保留md文件, 不可修改"};
		return ;
	}
	//文章标题
	let title = datas[0].title;
	//文章路径
	let filepath = path.join(__dirname, `../../static/md/`) + datas[0].mdSrc;
	//创建可读流
	const reader = fs.createReadStream(filepath);
	//异步回调
	return new Promise((resolve, reject)=>{
		reader.on("data", chunk=>{
			data += chunk;
		});
		reader.on("end", ()=>{
			ctx.body = {err: 0, msg: "success", title: title, md: data}
			resolve(next())
		});
		reader.on("error", err=>{
			console.log(err)
		});
	});
});

module.exports=router.routes();
