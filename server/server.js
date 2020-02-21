const Koa = require("koa");
const Router = require("koa-router");
const body = require("koa-better-body");
const static = require('./routers/static');
const config = require('./config');
const multipart = require("koa-multipart");
const session = require("koa-session");

let server = new Koa();
server.listen(config.PORT);
console.log(`server running on ${config.HTTP_ROOT}`)

//跨域
server.use(async (ctx, next) => {
	ctx.set("Access-Control-Allow-Origin", "*");
	await next();
});

server.use(body({
	uploadDir: config.UPLOAD_DIR,
	textLimit: "500000kb"
}));

server.use(session({
	maxAge: 20*60*1000,
	renew: true
}, server));

server.use(multipart())

server.context.db = require('./libs/database');
server.context.config = config;

server.use(async (ctx, next) => {
	ctx.set("Access-Control-Allow-Origin", "*");

	await next();
})

let router = new Router();

router.use('/admin', require("./routers/admin"));

static(router);

server.use(router.routes());
