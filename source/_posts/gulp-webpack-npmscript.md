---
title: gulp_webpack_npmscript
date: 2017-10-23 14:45:45
tags: 技术博客
---
## 如何全局安装一个 node 应用?
命令行中输入下列代码即可

    npm i -g <application name>

## package.json 有什么作用？
package.json 是npm的工程配置文件，在里面配置了一些参数来方便我们生成npm工程。
让我们通过实例的方式来学习这个文件：
{% codeblock lang:json %}
{
	"name": "Hello World",  //工程名称 如果存在要发布npm包的情况，这个名称必须全网唯一
	"version": "0.0.1",
	"author": "张三",
	"description": "第一个node.js程序",
	"keywords":["node.js","javascript"],
	"repository": {
		"type": "git",
		"url": "https://path/to/url"
	},
	"license":"MIT",
	"engines": {"node": "0.10.x"},
	"bugs":{"url":"http://path/to/bug","email":"bug@example.com"},
	"contributors":[{"name":"李四","email":"lisi@example.com"}],
	"scripts": {
		"start": "node index.js"
	},
	"dependencies": {
		"express": "latest",
		"mongoose": "~3.8.3",
		"handlebars-runtime": "~1.0.12",
		"express3-handlebars": "~0.5.0",
		"MD5": "~1.2.0"
	},
	"devDependencies": {
		"bower": "~1.2.8",
		"grunt": "~0.4.1",
		"grunt-contrib-concat": "~0.3.0",
		"grunt-contrib-jshint": "~0.7.2",
		"grunt-contrib-uglify": "~0.2.7",
		"grunt-contrib-clean": "~0.5.0",
		"browserify": "2.36.1",
		"grunt-browserify": "~1.3.0",
	}
}
{% endcodeblock %}
## npm install --save app 与 npm install --save-dev app有什么区别?
## node_modules的查找路径是怎样的?

## npm3与 npm2相比有什么改进？yarn和 npm 相比有什么优势?
## webpack是什么？和其他同类型工具比有什么优势？
## npm script是什么？如何使用？
## 使用 webpack 替换 入门-任务15中模块化使用的 requriejs

## gulp是什么？使用 gulp 实现图片压缩、CSS 压缩合并、JS 压缩合并
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*
