---
title: CSS基础
date: 2017-09-10 14:20:35
tags: 技术博客
---
## CSS的全称是什么?

层叠样式表（英语：Cascading Style Sheets，简写CSS），一种用来为结构化文档（如HTML文档或XML应用）添加样式（字体、间距和颜色等）的计算机语言，由W3C定义和维护。

## CSS有几种引入方式? link 和@import 有什么区别?

### CSS有几种引入方式

四种，分别为行内样式，内嵌样式和外联样式以及@import。

### link 和@import 有什么区别

1. link是XHTML标签，除了加载CSS外，还可以定义RSS等其他事务；@import属于CSS范畴，只能加载CSS。
2. link引用CSS时，在页面载入时同时加载；@import需要页面网页完全载入以后加载。
3. link是XHTML标签，无兼容问题；@import是在CSS2.1提出的，低版本的浏览器不支持。
4. link支持使用Javascript控制DOM去改变样式；而@import不支持。

## 以下这几种文件路径分别用在什么地方，代表什么意思?

* css/a.css

相对路径，当前目录下css文件夹内a.css文件

* ./css/a.css

相对路径，同级目录下css文件夹内a.css文件

* b.css

相对路径，与当前文档同级目录下b.css文件

* ../imgs/a.png

相对路径，上级文件夹下imgs文件夹内a.png文件

* /Users/hunger/project/css/a.css

绝对路径，根目录下对应路径的文件

* /static/css/a.css

绝对路径，根目录下对应路径的文件

* http://cdn.jirengu.com/kejian1/8-1.png

通过HTTP请求得到互联网上对应url的资源

## 如果我想在js.jirengu.com上展示一个图片，需要怎么操作?

1. 上传图片到某个可以被互联网访问到的服务器

2. 使用img标签，在src属性注明图片的url

## 列出5条以上html和 css 的书写规范

1. 一次缩进2个空格，不要使用 tab 或者混合 tab 和空格的缩进。
2. HTML 元素名称，属性，属性值（除非 text/CDATA），CSS 选择器，属性，属性值应该使用小写。
3. 结尾切勿加空格空格不仅多余，而且在比较代码时会更麻烦。
4. 在 HTML 中通过指定编码方式，CSS 中不需要指定，因为默认是 UTF-8。
5. 使用注释来解释代码：包含的模块，功能以及优点。

## 截图介绍 chrome 开发者工具的功能区
![](http://ouqp9l9vp.bkt.clouddn.com/20170910144328.png)