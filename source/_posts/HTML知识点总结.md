---
title: HTML知识点总结
date: 2017-09-10 12:02:04
tags: 技术博客
---
## HTML、XML、XHTML 有什么区别

HTML、XML和XHTML都是标准通用标记语言的一个子集。HTML被设计用来显示数据，其焦点是数据的外观；XML被设计用来传输和存储数据，其焦点是数据的内容；XHTML是更严格更纯净的 HTML 版本，是作为一种 XML 应用被重新定义的 HTML，设计的目的是为了取代HTML以适应未来网络更多的需求。它们都可以用来开发网页，但就目前来看，网页开发中HTML还是占绝对的主流，现在最新版本HTML5也备受推崇。可拓展标记语言XML广泛运用于各种应用程序中数据的存储（例如各种配置文件）和应用程序间的数据传输，可以说是一项必须掌握的技术。至于可扩展超文本标记语言XHTML，在2009年W3C已经宣布停止了对XHTML2的开发，转而大力支持HTML5。

## 怎样理解 HTML 语义化

语义化的HTML就是写出的HTML代码，符合内容的结构化（内容语义化），选择合适的标签（代码语义化），能够便于开发者阅读和写出更优雅的代码的同时让浏览器的爬虫和机器很好地解析。
语义化有助于：

1. 有利于SEO，有利于搜索引擎爬虫更好的理解我们的网页，从而获取更多的有效信息，提升网页的权重。
2. 在没有CSS的时候能够清晰的看出网页的结构，增强可读性。
3. 便于团队开发和维护，语义化的HTML可以让开发者更容易的看明白，从而提高团队的效率和协调能力。
4. 支持多终端设备的浏览器渲染。

## 怎样理解内容与样式分离的原则

内容和样式不分离就是利用HTML标签和浏览器的默认样式来尝试控制显示出的内容模样，事实上大多数浏览器的默认样式都不相同，这样做也不利于统一修改样式。
内容和样式分离就是将文档的语义化内容用HTML表示，展示的模样用CSS表示，这样做既可以统一样式，又可以方便修改。

## 有哪些常见的meta标签
{% codeblock lang:html %}

<!-- 关键字，搜所引擎 SEO -->
<meta http-equiv="keywords" content="关键字1,关键字2,..."> 
<!-- 页面描述 -->
<meta http-equiv="description" content="网页描述"> 
<!-- content的取值为webkit,ie-comp,ie-stand之一，区分大小写，分别代表用webkit内核，IE兼容内核，IE标准内核。 -->
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<!-- 若页面需默认用极速核，增加标签： -->
<meta name="renderer" content="webkit">
<!-- 若页面需默认用ie兼容内核，增加标签： -->
<meta name="renderer" content="ie-comp">
<!-- 若页面需默认用ie标准内核，增加标签： -->
<meta name="renderer" content="ie-stand">
<!-- 如果安装了GCF，则使用GCF来渲染页面，如果没有安装GCF，则使用最高版本的IE内核进行渲染。
X-UA-Compatible：这是个是IE8的专用标记,用来指定IE8浏览器去模拟某个特定版本的IE浏览器的渲染方式(比如人见人烦的IE6)，以此来解决部分兼容问题。 -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<!-- 强制页面在当前窗口以独立页面显示。 -->
<meta http-equiv="Window-target" content="_top">
<!-- 自动刷新，并指向新的页面 -->
<meta http-equiv="Refresh" content="2；URL=http://">
<!-- 禁止浏览器缓存 -->
<!-- 是用于设定禁止浏览器从本地机的缓存中调阅页面内容，设定后一旦离开网页就无法从Cache中再调出
用法： -->
<meta http-equiv="pragram" content="no-cache"> 
<!-- 清除缓存（再访问这个网站要重新下载！） -->
<meta http-equiv="cache-control" content="no-cache, must-revalidate"> 
<!-- 设定网页的到期时间 -->
<meta http-equiv="expires" content="0"> 
<!-- 手机端 -->
<meta name="format-detection" content="telphone=no, email=no"/>
<!-- 忽略页面中的数字识别为电话，忽略email识别 -->
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<!-- 设置苹果工具栏颜色 -->
<!-- 不让百度转码 -->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!-- 不缓存 -->
<meta http-equiv="cache-control" content="no-cache" />
<!-- 初始化设备 -->
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui" />
<!-- 网站开启对iphone私有 web app 程序的支持 -->
<meta content="yes" name="apple-mobile-web-app-capable" />
<!-- 改变顶部状态条的颜色 iphone私有的属性-->
<meta content="black" name="apple-mobile-web-app-status-bar-style" />

{% endcodeblock %}
## 文档声明的作用?严格模式和混杂模式指什么?<!doctype html> 的作用?

### 文档声明的作用

文档声明指出阅读程序应该用什么规则集来解释文档中的标记。在web文档的情况下，“阅读程序”通常是浏览器或者校验器这样的一个程序，“规则”则是w3c所发布的一个文档类型定义（dtd）中包含的规则。
每个dtd都包括一系列标记、attributes和properties，它们用于标记web文档的内容；此外还包括一些规则，它们规定了哪些标记能出现在其他哪些标记中。每个web建议标准（比如html 4 frameset和xhtml 1.0 transitional）都有自己的dtd。
假如文档中的标记不遵循doctype声明所指定的dtd，这个文档除了不能通过代码校验之外，还有可能无法在浏览器中正确显示。对于标记不一致的问题，浏览器相较于校验器来说更宽容。但是，不正确的doctype声明经常导致网页不正确显示，或者导致它们根本不能显示。

### 严格模式和混杂模式指什么

严格模式：又称标准模式，是指浏览器按照 W3C 标准解析代码。

混杂模式：又称怪异模式或兼容模式，是指浏览器用自己的方式解析代码。

如何区分：浏览器解析时到底使用严格模式还是混杂模式，与网页中的 DTD 直接相关。

如果文档包含严格的 DOCTYPE ，那么它一般以严格模式呈现。（严格 DTD ——严格模式）
包含过渡 DTD 和 URI 的 DOCTYPE ，也以严格模式呈现，但有过渡 DTD 而没有 URI （统一资源标识符，就是声明最后的地址）会导致页面以混杂模式呈现。（有 URI 的过渡 DTD ——严格模式；没有 URI 的过渡 DTD ——混杂模式）
DOCTYPE 不存在或形式不正确会导致文档以混杂模式呈现。（DTD不存在或者格式不正确——混杂模式）
HTML5 没有 DTD ，因此也就没有严格模式与混杂模式的区别，HTML5 有相对宽松的语法，实现时，已经尽可能大的实现了向后兼容。（ HTML5 没有严格和混杂之分）
意义：严格模式与混杂模式存在的意义与其来源密切相关，如果说只存在严格模式，那么许多旧网站必然受到影响，如果只存在混杂模式，那么会回到当时浏览器大战时的混乱，每个浏览器都有自己的解析模式。

### !doctype html 的作用

声明文档的解析类型(document.compatMode)，避免浏览器的怪异模式。

document.compatMode：
BackCompat：怪异模式，浏览器使用自己的怪异模式解析渲染页面。
CSS1Compat：标准模式，浏览器使用W3C的标准解析渲染页面。

这个属性会被浏览器识别并使用，但是如果你的页面没有DOCTYPE的声明，那么compatMode默认就是BackCompat,这也就是绝望和黑暗的开始 – 浏览器按照自己的方式解析渲染页面，那么，在不同的浏览器就会显示不同的样式。
如果你的页面添加了&lt;!DOCTYPE html&gt;那么，那么就等同于开启了标准模式，那么浏览器就得老老实实的按照W3C的标准解析渲染页面，这样一来，你的页面在所有的浏览器里显示的就都是一个样子了。
这就是&lt;!DOCTYPE html&gt;的作用。

## 浏览器乱码的原因是什么？如何解决

造成html网页乱码原因主要是html源代码内中文字内容与html编码不同造成。但无论是哪种情况造成乱码解决方法都是在网页开始时候设置网页编码。

## 常见的浏览器有哪些，什么内核

<table><tbody><tr><td>浏览器</td><td>市场占有率</td><td>内核</td></tr><tr><td>Chrome</td><td>58.64%</td><td>WebKit/Chromium引擎</td></tr><tr><td>Internet Explorer</td><td>18.95%</td><td>Trident</td></tr><tr><td>Firefox</td><td>11.79%</td><td>Gecko</td></tr><tr><td>Edge</td><td>5.61%</td><td>Trident</td></tr><tr><td>Safari</td><td>3.37%</td><td>WebKit</td></tr><tr><td>Opera</td><td>1.18%</td><td>Presto</td></tr></tbody></table>

*市场占有率数据为2017年4月世界内统计 数据来源于NetMarketShare*

## 列出常见的标签，并简单介绍这些标签用在什么场景

<table> <thead> <tr> <th>标签</th> <th>场景</th> </tr> </thead> <tbody> <tr> <td>head</td> <td>页面头部，放置脚本，样式，设置等</td> </tr> <tr> <td>body</td> <td>页面内容</td> </tr> <tr> <td>h1~h6</td> <td>标题</td> </tr> <tr> <td>p</td> <td>段落标签</td> </tr> <tr> <td>br/</td> <td>换行</td> </tr> <tr> <td>div</td> <td>分块用标签</td> </tr> <tr> <td>ul</td> <td>无序列表</td> </tr> <tr> <td>ol</td> <td>有序列表</td> </tr> <tr> <td>form</td> <td>表单</td> </tr> <tr> <td>img</td> <td>设置一个图像</td> </tr> <tr> <td>a</td> <td>超链接</td> </tr> </tbody> </table>