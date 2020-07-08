const static = require('koa-static');

module.exports = function (router, options) {

	options = options || {};
	options.image = options.image || 30;
	options.js = options.js || 1;
	options.css = options.css || 30;
	options.html = options.html || 30;
	options.other = options.other || 7;
//直接匹配路由的时候用 all 这个中间件
//缓存图片类型
router.all(/((\.jpg)|(\.png)|(\.gif))$/i, static('../static', {
	//缓存时间
	maxage: options.image*86400*1000
}));
//缓存js等文件类型
router.all(/((\.js)|(\.jsx))$/i, static('../static', {
	//缓存时间
	maxage: options.js*86400*1000
}));
//缓存css等文件类型
router.all(/((\.css))$/i, static('../static', {
	//缓存时间
	maxage: options.cs*86400*1000
}));
//缓存html等文件类型
router.all(/((\.html)|(\.htm))$/i, static('../static', {
	//缓存时间
	maxage: options.html*86400*1000
}));
//缓存剩下类型的文件
router.all('*', static('./static', {
	//缓存时间
	maxage: options.other*86400*1000
}));
}
