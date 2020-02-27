-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2020-02-27 08:07:18
-- 服务器版本： 5.7.26
-- PHP 版本： 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `htmlfile`
--

DROP TABLE IF EXISTS `htmlfile`;
CREATE TABLE IF NOT EXISTS `htmlfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `src` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `htmlfile`
--

INSERT INTO `htmlfile` (`id`, `title`, `src`) VALUES
(1, 'test title1', '202002272356707_test title1.html');

-- --------------------------------------------------------

--
-- 表的结构 `image_table`
--

DROP TABLE IF EXISTS `image_table`;
CREATE TABLE IF NOT EXISTS `image_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `image_table`
--

INSERT INTO `image_table` (`id`, `src`, `date`) VALUES
(1, '202002275208734_size_285263_ss.jpg', 1582789928);

-- --------------------------------------------------------

--
-- 表的结构 `mdfile`
--

DROP TABLE IF EXISTS `mdfile`;
CREATE TABLE IF NOT EXISTS `mdfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `src` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `mdfile`
--

INSERT INTO `mdfile` (`id`, `title`, `src`) VALUES
(1, 'test title1', '202002272356707_test title1.md');

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 NOT NULL,
  `mdSrc` varchar(128) DEFAULT NULL,
  `htmlSrc` varchar(128) DEFAULT NULL,
  `contents` text CHARACTER SET utf8 NOT NULL,
  `date` int(11) NOT NULL,
  `isDisplay` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `title`, `mdSrc`, `htmlSrc`, `contents`, `date`, `isDisplay`) VALUES
(1, 'test_title', '', '', 'test_content', 757382400, 0),
(2, 'test_title_2', '', '', 'test_content_2', 1111111, 0),
(3, 'test', '', '', '<h1><a id=\"_0\"></a>一级标题</h1>\n', 1576250527, 0),
(4, 'test_111', '', '', '<h1><a id=\"_0\"></a>标题</h1>\n<h2><a id=\"hello_world_2\"></a>hello world</h2>\n', 1576250907, 0),
(5, 'aaa', '', '', '<p>asdfasdfa<br />\nsdfasdf<br />\nadsfasdf', 1576252252, 0),
(6, '关于Element-UI分页的使用和使用中的问题及解决方法', '', '', '<h2><a id=\"ElementUI_0\"></a>Element-UI分页基本用法</h2>\r\n<p>参照官方文档，如下<br />\r\n<img src=\"https://img-blog.csdnimg.cn/20191129212410533.png\" alt=\"在这里插入图片描述\" /></p>\r\n<p>相关参数文档也说明得很清楚了<br />\r\n配合<el-table></el-table>使用显示数据<br />\r\n代码如下：</p>\r\n<h4><a id=\"eltable__7\"></a>el-table 代码块</h4>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-comment\">//userList 绑定的数据</span>\r\n&lt;el-table :data=<span class=\"hljs-string\">\"userList\"</span> border stripe&gt;\r\n        &lt;el-table-column type=\"index\"&gt;&lt;/el-table-column&gt;\r\n        //prop 为这一列绑定数据\r\n        &lt;el-table-column label=\"姓名\" prop=\"username\"&gt;&lt;/el-table-column&gt;\r\n        &lt;el-table-column label=\"邮箱\" prop=\"email\"&gt;&lt;/el-table-column&gt;\r\n        &lt;el-table-column label=\"电话\" prop=\"mobile\"&gt;&lt;/el-table-column&gt;\r\n        &lt;el-table-column label=\"角色\" prop=\"role_name\"&gt;&lt;/el-table-column&gt;\r\n&lt;/el-table&gt;\r\n</code></div></pre>\r\n<h4><a id=\"elpagination__19\"></a>el-pagination 分页代码块</h4>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;el-pagination\r\n		<span class=\"hljs-comment\">//参数说明查看文档</span>\r\n        @size-change=<span class=\"hljs-string\">\"handleSizeChange\"</span>\r\n        @current-change=<span class=\"hljs-string\">\"handleCurrentChange\"</span>\r\n        :current-page=<span class=\"hljs-string\">\"queryInfo.pagenum\"</span>\r\n        :page-sizes=<span class=\"hljs-string\">\"[1, 2, 5, 7]\"</span>\r\n        :page-size=<span class=\"hljs-string\">\"queryInfo.pagesize\"</span>\r\n        layout=<span class=\"hljs-string\">\"total, sizes, prev, pager, next, jumper\"</span>\r\n        :total=<span class=\"hljs-string\">\"total\"</span>&gt;\r\n<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-pagination</span>&gt;</span>\r\n</span></code></div></pre>\r\n<h4><a id=\"vuedata_33\"></a>vue中的data代码块(组件中)</h4>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;script&gt;\r\nexoprt <span class=\"hljs-keyword\">default</span> {\r\ndata(){\r\n	<span class=\"hljs-keyword\">return</span> {\r\n		<span class=\"hljs-attr\">queryInfo</span>: {\r\n	       <span class=\"hljs-attr\">query</span>: <span class=\"hljs-string\">\'\'</span>,\r\n	        <span class=\"hljs-comment\">//当前的页数</span>\r\n	        pagenum: <span class=\"hljs-number\">1</span>,\r\n	        <span class=\"hljs-comment\">// 当前每页显示的数据</span>\r\n	        pagesize: <span class=\"hljs-number\">2</span>\r\n	      },\r\n	      <span class=\"hljs-comment\">//前台测试数据</span>\r\n	      <span class=\"hljs-comment\">//实际可从服务器接口调用数据</span>\r\n	      userList:[\r\n	        {\r\n	          <span class=\"hljs-attr\">id</span>: <span class=\"hljs-number\">1</span>,\r\n	          <span class=\"hljs-attr\">username</span>: <span class=\"hljs-string\">\'admin\'</span>,\r\n	          <span class=\"hljs-attr\">email</span>: <span class=\"hljs-string\">\'admin@126.com\'</span>,\r\n	          <span class=\"hljs-attr\">mobile</span>: <span class=\"hljs-string\">\'12345678\'</span>,\r\n	          <span class=\"hljs-attr\">role_name</span>: <span class=\"hljs-string\">\'超级管理员\'</span>\r\n	        },\r\n	        {\r\n	          <span class=\"hljs-attr\">id</span>: <span class=\"hljs-number\">2</span>,\r\n	          <span class=\"hljs-attr\">username</span>: <span class=\"hljs-string\">\'测试用户1\'</span>,\r\n	          <span class=\"hljs-attr\">email</span>: <span class=\"hljs-string\">\'test_1@126.com\'</span>,\r\n	          <span class=\"hljs-attr\">mobile</span>: <span class=\"hljs-string\">\'1111111111\'</span>,\r\n	          <span class=\"hljs-attr\">role_name</span>: <span class=\"hljs-string\">\'测试用户\'</span>\r\n	        },\r\n	        {\r\n	          <span class=\"hljs-attr\">id</span>: <span class=\"hljs-number\">3</span>,\r\n	          <span class=\"hljs-attr\">username</span>: <span class=\"hljs-string\">\'测试用户2\'</span>,\r\n	          <span class=\"hljs-attr\">email</span>: <span class=\"hljs-string\">\'test_1@126.com\'</span>,\r\n	          <span class=\"hljs-attr\">mobile</span>: <span class=\"hljs-string\">\'2222222222\'</span>,\r\n	          <span class=\"hljs-attr\">role_name</span>: <span class=\"hljs-string\">\'测试用户\'</span>\r\n	        }\r\n	      ],\r\n	      <span class=\"hljs-comment\">//前台测试数据</span>\r\n	      <span class=\"hljs-comment\">//实际可从服务器接口调用总数</span>\r\n	      total: <span class=\"hljs-number\">3</span>\r\n	    }\r\n	}\r\n},\r\n<span class=\"hljs-attr\">methods</span>: {\r\n	<span class=\"hljs-comment\">//每页的数据条数</span>\r\n	<span class=\"hljs-comment\">//在el-pagination的layout里的设置sizes可以显示设置条数</span>\r\n	<span class=\"hljs-comment\">//通过pag-sizes设置间隔</span>\r\n	handleSizeChange(newSize){\r\n      <span class=\"hljs-keyword\">this</span>.queryInfo.pagesize = newSize;\r\n      <span class=\"hljs-comment\">//若是从后台请求的数据，修改了每页的数据条数之后再向后台请求一次数据</span>\r\n      <span class=\"hljs-comment\">//重新请求数据</span>\r\n    },\r\n    <span class=\"hljs-comment\">// 监听页码改变</span>\r\n    handleCurrentChange(newPage){\r\n      <span class=\"hljs-keyword\">this</span>.queryInfo.pagenum = newPage;\r\n      <span class=\"hljs-comment\">//若是从后台请求的数据，修改了每页的数据条数之后再向后台请求一次数据</span>\r\n      <span class=\"hljs-comment\">//重新请求数据</span>\r\n    }\r\n}\r\n</code></div></pre>\r\n<h4><a id=\"_95\"></a>效果如下</h4>\r\n<p><img src=\"https://img-blog.csdnimg.cn/20191129215516851.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2JhbW55dA==,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\" /></p>\r\n<h4><a id=\"_97\"></a>遇到的问题</h4>\r\n<p>当改变每页显示的条数时，即手动修改 queryInfo里的pagesize时，还是显示userList里的全部数据，表格并没有根据自己设置的数量进行按需显示。</p>\r\n<h4><a id=\"_100\"></a>解决方法</h4>\r\n<h5><a id=\"_102\"></a>前台方法</h5>\r\n<p>手动分割传来的数据<br />\r\n如下：</p>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">:data=<span class=\"hljs-string\">\"userList.slice((queryInfo.pagenum-1)*queryInfo.pagesize,queryInfo.pagenum*queryInfo.pagesize)\"</span>\r\n</code></div></pre>\r\n<p>以上，问题解决！<br />\r\n<img src=\"https://img-blog.csdnimg.cn/20191129220434861.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2JhbW55dA==,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\" /></p>', 1576331009, 1),
(7, '简单理解闭包', '', '', '<h2><a id=\"_0\"></a>什么是闭包</h2>\r\n<p>闭包就是能够读取其他函数内部变量的函数。它是一个密闭的容器，类似于set()或map()，也是一个对象，通过key: value方式存储数据。</p>\r\n<h2><a id=\"_2\"></a>形成闭包的条件</h2>\r\n<p>1、形成函数的嵌套<br />\r\n2、内部函数引用了外部函数的局部变量</p>\r\n<p>一个简单的闭包例子</p>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">fn1</span>(<span class=\"hljs-params\"></span>)</span>{\r\n  <span class=\"hljs-keyword\">var</span> count = <span class=\"hljs-number\">1</span>; <span class=\"hljs-comment\">//函数fn1中局部变量</span>\r\n  <span class=\"hljs-keyword\">return</span> funtion (){\r\n    <span class=\"hljs-built_in\">console</span>.log(count); <span class=\"hljs-comment\">//访问外部函数的局部变量</span>\r\n  }\r\n}\r\n<span class=\"hljs-keyword\">var</span> a = fn1();\r\na();\r\n</code></div></pre>\r\n<h2><a id=\"_17\"></a>闭包的优点</h2>\r\n<p>1、延长了外部函数局部变量的生命周期</p>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">fn1</span>(<span class=\"hljs-params\"></span>)</span>{\r\n  count = <span class=\"hljs-number\">1</span>;\r\n  <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>)</span>{\r\n    count ++;\r\n    <span class=\"hljs-built_in\">console</span>.log(count);\r\n  }\r\n}\r\n<span class=\"hljs-keyword\">var</span> a = fn1();\r\na();  <span class=\"hljs-comment\">//2    count被内部函数改成了2,函数fn1被销毁后，count由于闭包的存在被保存了下来</span>\r\na();  <span class=\"hljs-comment\">//3</span>\r\n</code></div></pre>\r\n<p>2、可以借助闭包封装私有变量</p>\r\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">fn1</span>(<span class=\"hljs-params\">n</span>) </span>{\r\n  <span class=\"hljs-keyword\">var</span> x = n || <span class=\"hljs-number\">0</span>;\r\n  <span class=\"hljs-keyword\">return</span> {\r\n    <span class=\"hljs-attr\">inc</span>: <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\r\n      x += <span class=\"hljs-number\">1</span>;\r\n      <span class=\"hljs-keyword\">return</span> x;\r\n    }\r\n  }\r\n}\r\n<span class=\"hljs-keyword\">var</span> a = fn1();\r\na.inc();<span class=\"hljs-comment\">//1</span>\r\na.inc();<span class=\"hljs-comment\">//2</span>\r\na.inc();<span class=\"hljs-comment\">//3</span>\r\n<span class=\"hljs-keyword\">var</span> b = fn1(<span class=\"hljs-number\">12</span>);\r\nb.inc();<span class=\"hljs-comment\">//13</span>\r\nb.inc();<span class=\"hljs-comment\">//14</span>\r\nb.inc();<span class=\"hljs-comment\">//15</span>\r\n</code></div></pre>\r\n<p>外部代码无法访问函数fn1中的变量x</p>\r\n<h2><a id=\"_56\"></a>闭包的缺点</h2>\r\n<p>其实闭包的优点也是闭包的缺点，外部函数局部变量的生命周期被延长，导致本应该被释放的内存没有得到释放，可能会造成内存泄露。</p>', 1576337915, 1),
(9, 'test3', '', '', '<h1><a id=\"aaaa_0\"></a>aaaa</h1>\n', 1576658914, 0),
(10, 'hello', '', '', '<h1><a id=\"hello_world_0\"></a>hello world</h1>\n', 1576658998, 0),
(11, 'javascript', NULL, NULL, '<p>//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}//判断数据库是否有这个标题的文章<br />\nlet databaseTitle = await ctx.db.query(<code>select title from post where title=?</code>, [title]);<br />\nif(title.length == 0){<br />\nawait ctx.db.query(<code>insert into post (title,mdSrc,contents,date) value(?,?,?,?)</code>,[title, mdName, html, date]);<br />\n}else{<br />\nawait ctx.db.query(<code>update post set mdSrc=?</code>, [mdName]);<br />\n}</p>\n', 1582278494, 0),
(14, 'test title1', '202002272356707_test title1.md', '202002272356707_test title1.html', '<h1><a id=\"test_contents_0\"></a>test contents</h1>\n<p><img src=\"/api/images/202002270055604_size_285263_ss.jpg\" alt=\"test_img\" /></p>\n', 1582788340, 0);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `token` varchar(64) NOT NULL,
  `token_expires` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token`, `token_expires`) VALUES
(1, 'mnyt', '123456', 'aa3a54fa-3183-4a9e-b000-fd161d0fc8da', 1583998807),
(2, 'zhangsan', '4321', 'aa3a54fa-3183-4a9e-b000-fd161d0fc8da', 1583998807);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
