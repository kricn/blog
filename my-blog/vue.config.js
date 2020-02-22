const path = require("path");
const {SERVER} = require('./src/config.js');
module.exports = {
  //部署包时时的基本url
  publicPath: process.env.NODE_ENV === 'production'? './': '/',
  //生产环境时的输出目录,生产环境的输出路径都相对于这个路径
  outputDir: 'dist', //default
  //放置静态资源的目录
  assetsDir: 'static', //default
  //生成index.html的输出路径
  indexPath: 'index.html', //defalt
  //默认情况下，生成的静态资源在它们的文件名中包含了hash以便更好的控制缓存
  filenameHashing: true,
  pages: {
    index: {
      // page 的入口
      entry: 'src/main.js',
      // 模板来源
      template: 'public/index.html',
      // 在 dist/index.html 的输出
      filename: 'index.html',
      // 当使用 title 选项时，
      // template 中的 title 标签需要是 <title><%= htmlWebpackPlugin.options.title %></title>
      title: '能饮一杯无',
      // 在这个页面中包含的块，默认情况下会包含
      // 提取出来的通用 chunk 和 vendor chunk。
      chunks: ['chunk-vendors', 'chunk-common', 'index']
    }
  },
  lintOnSave: false,
  productionSourceMap: false,


  configureWebpack: (config) => {
    if (process.env.NODE_ENV === 'production') {
      // 为生产环境修改配置...
      config.mode = 'production'
    } else {
      // 为开发环境修改配置...
      config.mode = 'development'
    }
    Object.assign(config, {
      // 开发生产共同配置
      resolve: {
        alias: {
          '@': path.resolve(__dirname, './src')
        } // 别名配置
      }
    })
  },


  devServer: {
    open: true,
    host: 'localhost',
    port: 8080,
    https: false,
    hotOnly: false,
    proxy: {
      "/api": {
        target: `http://localhost:3000/`,
        ws: true,
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  }
};
