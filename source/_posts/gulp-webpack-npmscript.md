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
	"name": "Hello World",
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
这是一个比较完整的package.json文件，其中各个字段的含义分别如下：
* name: 工程名称，如果是要发布npm包的情况，此名称必须全网唯一。
* version: 工程版本，如果是要更新npm包的情况，此版本号必须增加。
* author: 工程作者。
* description: 工程描述。
* keywords: 工程描述关键词。
* repository: 工程源代码地址。
* license: 工程遵循的开源协议。
* engines: 工程所使用的引擎。
* bugs: 工程如果出现BUG，该向哪里提交。
* contributors: 为工程做出贡献的人。
* scripts: 自定义的npm脚本，除test和start两条命令可以用npm xxx在命令行执行之外其他的命令必须用npm run xxx执行，这个对象中的键值对键名代表npm脚本的命令，而值则代表实际执行的命令。
* dependencies: 工程所依赖的包，当在执行npm install命令时，将会根据此对象中的属性来安装依赖。
* devDependencies: 工程构建者构建工程所依赖的包，这个对象中的依赖仅仅在构建工程时安装。
* 还有一些其他的配置见[package.json中文网](http://www.mujiang.info/translation/npmjs/files/package.json.html)

## npm install --save app 与 npm install --save-dev app有什么区别?
    npm install --save app

此命令可以令npm将app包安装到本目录工程中node_modules目录中，并将此软件包最新版本的字段保存到package.json的dependencies对象中。
如果存在发布了这个工程到npm的情况，那么所有引入本工程的工程将自动加载此包。
    npm install --save-dev app

此命令可以令npm将app包安装到本目录工程中node_modules目录中，并将此软件包最新版本的字段保存到package.json的devDependencies对象中。
如果存在发布了这个工程到npm的情况，默认情况下（生产环境）不会自动加载这些包，只有在设置成开发环境（通常是针对某一个特定的脚本指定 NODE_ENV）的情况下会引入此包。
## node_modules的查找路径是怎样的?
先查找本文件同级目录下node_modules文件夹内是否存在引入的依赖对象，如果不存在，那么寻找本文件上级目录下的node_modules文件夹，依次向上寻找直到根目录。
## webpack是什么？和其他同类型工具比有什么优势？
webpack是一个“模块打包工具”，它可以编译各种语言成为浏览器可以执行的css，js，html；也可以模块化引入文件进行压缩合并等操作，还可以通过插件来实现一些其他的前端工作流操作例如将文件名加上hash以避免缓存等。
它具有以下优势
### 代码拆分
Webpack 有两种组织模块依赖的方式，同步和异步。异步依赖作为分割点，形成一个新的块。在优化了依赖树后，每一个异步区块都作为一个文件被打包。
Loader
Webpack 本身只能处理原生的 JavaScript 模块，但是 loader 转换器可以将各种类型的资源转换成 JavaScript 模块。这样，任何资源都可以成为 Webpack 可以处理的模块。
### 智能解析
Webpack 有一个智能解析器，几乎可以处理任何第三方库，无论它们的模块形式是 CommonJS、 AMD 还是普通的 JS 文件。甚至在加载依赖的时候，允许使用动态表达式 require("./templates/" + name + ".jade")。
### 插件系统
Webpack 还有一个功能丰富的插件系统。大多数内容功能都是基于这个插件系统运行的，还可以开发和使用开源的 Webpack 插件，来满足各式各样的需求。
### 快速运行
Webpack 使用异步 I/O 和多级缓存提高运行效率，这使得 Webpack 能够以令人难以置信的速度快速增量编译。
## npm script是什么？如何使用？
npm script是npm工具提供的脚本工具，可以用于简化原来需要写较长的命令行或者几个命令行操作，来形成前端工作流。
npm script脚本的使用方式就是在需要使用的工程的package.json文件的script对象中按照键值对的形式来书写脚本和原命令行，以本博客为例：
{% codeblock lang:json %}
//package.json
{
  ... ...

  "scripts": {
    "start": "hexo g && hexo d && git add . && git commit -m 'Autoupdate-By-npmScript' && git push"
  }
}
{% endcodeblock %}
仅一行代码，就实现了hexo博客的编译发布和备份。
## 代码作业
* 使用 webpack 替换 入门-任务15中模块化使用的 requriejs
* gulp是什么？使用 gulp 实现图片压缩、CSS 压缩合并、JS 压缩合并

[高级5](https://github.com/Zainking/demos/tree/master/%E9%AB%98%E7%BA%A75)

*本文章著作权由Zainking与饥人谷所有，转载请著明出处*
