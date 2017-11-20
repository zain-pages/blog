---
title: html5_CSS3
date: 2017-11-20 14:16:50
tags: 技术博客
---
## HTML5是什么？有哪些新特性？有哪些新增标签？如何让低版本的 IE 支持 HTML5新标签
>HTML5是HTML最新的修订版本，2014年10月由万维网联盟（W3C）完成标准制定。目标是取代1999年所制定的HTML 4.01和XHTML 1.0标准，以期能在互联网应用迅速发展的时候，使网络标准达到匹配当代的网络需求。广义论及HTML5时，实际指的是包括HTML、CSS和JavaScript在内的一套技术组合。它希望能够减少网页浏览器对于需要插件的丰富性网络应用服务（Plug-in-Based Rich Internet Application，RIA），例如：AdobeFlash、Microsoft Silverlight与Oracle JavaFX的需求，并且提供更多能有效加强网络应用的标准集。
——————Wikipedia

HTML5 中的一些有趣的新特性：

* 用于绘画的 canvas 元素
* 用于媒介回放的 video 和 audio 元素
* 对本地离线存储的更好的支持
* 新的特殊内容元素，比如 article、footer、header、nav、section
* 新的表单控件，比如 calendar、date、time、email、url、search

单就html而言，新增标签有：

|html5标签|标签含义|完整标签|html4.01实现|
|---------|-------|-------|------------|
|&lt;article&gt;|外部的内容。比如来自一个外部的新闻提供者的一篇新的文章，或者来自 blog 的文本，或者是来自论坛的文本。亦或是来自其他外部源内容。|&lt;article&gt;&lt;/article&gt;|&lt;div class='article'&gt;&lt;/div&gt;|
|&lt;aside&gt;| article 以外的内容。aside 的内容应该与 article 的内容相关。|&lt;aside&gt;Aside 的内容是独立的内容，但应与文档内容相关。&lt;/aside&gt;|&lt;div&gt;Aside 的内容是独立的内容，但应与文档内容相关。&lt;/div&gt;|
|&lt;audio&gt;|声音，比如音乐或其他音频流。|&lt;audio src="someaudio.wav"&gt;您的浏览器不支持 audio 标签。&lt;/audio&gt;|&lt;object type="application/ogg" data="someaudio.wav"&gt;&lt;param name="src" value="someaudio.wav"&gt;&lt;/object&gt;|
|&lt;canvas&gt;|图形，比如图表和其他图像。这个 HTML 元素是为了客户端矢量图形而设计的。它自己没有行为，但却把一个绘图 API 展现给客户端 JavaScript 以使脚本能够把想绘制的东西都绘制到一块画布上。|&lt;canvas id="myCanvas" width="200" height="200"&gt;&lt;/canvas&gt;|&lt;object data="inc/hdr.svg" type="image/svg+xml" width="200" height="200"&gt;&lt;/object&gt;|
|&lt;command&gt;|命令按钮，比如单选按钮、复选框或按钮。|&lt;command onclick=cut()" label="cut"&gt;|none|
|&lt;datalist&gt;|可选数据的列表。与 input 元素配合使用，就可以制作出输入值的下拉列表。|&lt;datalist&gt;&lt;/datalist&gt;|see combobox.|
|&lt;details&gt;|元素的细节，用户可进行查看，或通过点击进行隐藏。与 &lt;legend&gt; 一起使用，来制作 detail 的标题。该标题对用户是可见的，当在其上点击时可打开或关闭 detail。|&lt;details&gt;&lt;/details&gt;|&lt;dl style="display:hidden"&gt;&lt;/dl&gt;|
|&lt;embed&gt;|嵌入的内容，比如插件。|&lt;embed src="horse.wav" /&gt;|&lt;object data="flash.swf"  type="application/x-shockwave-flash"&gt;&lt;/object&gt;|
|&lt;figcaption&gt;| figure 元素的标题。”figcaption” 元素应该被置于 “figure” 元素的第一个或最后一个子元素的位置。|&lt;figure&gt;&lt;figcaption&gt;PRC&lt;/figcaption&gt;&lt;/figure&gt;|none|
|&lt;figure&gt;|标签用于对元素进行组合。使用 &lt;figcaption&gt; 元素为元素组添加标题。|&lt;figure&gt;&lt;figcaption&gt;PRC&lt;/figcaption&gt;&lt;p&gt;The People's Republic of China was born in 1949...&lt;/p&gt;&lt;/figure&gt;|&lt;dl&gt;&lt;h1&gt;PRC&lt;/h1&gt;&lt;p&gt;The People's Republic of China was born in 1949...&lt;/p&gt;&lt;/dl&gt;|
|&lt;footer&gt;| section 或 document 的页脚。典型地，它会包含创作者的姓名、文档的创作日期以及/或者联系信息。|&lt;footer&gt;&lt;/footer&gt;|&lt;div&gt;&lt;/div&gt;|
|&lt;header&gt;| section 或 document 的页眉。|&lt;header&gt;&lt;/header&gt;|&lt;div&gt;&lt;/div&gt;|
|&lt;hgroup&gt;|标签用于对网页或区段（section）的标题进行组合。|&lt;hgroup&gt;&lt;/hgroup&gt;|&lt;div&gt;&lt;/div&gt;|
|&lt;keygen&gt;|生成密钥。|&lt;keygen&gt;|none|
|&lt;mark&gt;|主要用来在视觉上向用户呈现那些需要突出的文字。&lt;mark&gt;标签的一个比较典型的应用就是在搜索结果中向用户高亮显示搜索关键词。|&lt;mark&gt;&lt;/mark&gt;|&lt;span&gt;&lt;/span&gt;|
|&lt;meter&gt;|度量衡。仅用于已知最大和最小值的度量。必须定义度量的范围，既可以在元素的文本中，也可以在 min/max 属性中定义。|&lt;meter&gt;&lt;/meter&gt;|none|
|&lt;nav&gt;|导航链接的部分。|&lt;nav&gt;&lt;/nav&gt;|&lt;ul&gt;&lt;/ul&gt;|
|&lt;output&gt;|不同类型的输出，比如脚本的输出。|&lt;output&gt;&lt;/output&gt;|&lt;span&gt;&lt;/span&gt;|
|&lt;progress&gt;|标签运行中的进程。可以使用 &lt;progress&gt; 标签来显示 JavaScript 中耗费时间的函数的进程。|&lt;progress&gt;&lt;/progress&gt;|none|
|&lt;ruby&gt;| ruby 注释（中文注音或字符）。|&lt;ruby&gt;漢 &lt;rt&gt;&lt;rp&gt;(&lt;/rp&gt;ㄏㄢˋ&lt;rp&gt;)&lt;/rp&gt;&lt;/rt&gt;&lt;/ruby&gt;|none|
|&lt;section&gt;|文档中的节（section、区段）。比如章节、页眉、页脚或文档中的其他部分。|&lt;section&gt;&lt;/section&gt;|&lt;div&gt;&lt;/div&gt;
|&lt;source&gt;|标签为媒介元素（比如 &lt;video&gt; 和 &lt;audio&gt;）定义媒介资源。|&lt;source&gt;|&lt;param&gt;|
|&lt;summary&gt;|标签包含 details 元素的标题，”details” 元素用于描述有关文档或文档片段的详细信息。”summary” 元素应该是 “details” 元素的第一个子元素。|&lt;details&gt;&lt;summary&gt;HTML 5&lt;/summary&gt;This document teaches you everything you have to learn about HTML 5.&lt;/details&gt;|none|
|&lt;time&gt;|日期或时间，或者两者。|&lt;time&gt;&lt;/time&gt;|&lt;span&gt;&lt;/span&gt;|
|&lt;video&gt;|视频，比如电影片段或其他视频流。|&lt;video src="movie.ogg" controls="controls"&gt;您的浏览器不支持 video 标签。&lt;/video&gt;|&lt;object type="video/ogg" data="movie.ogv"&gt;&lt;param name="src" value="movie.ogv"&gt;&lt;/object&gt;|

可以使用 *html5shiv.js* 这个库使得以前版本的浏览器支持html5.

## input 有哪些新增类型？
* email
* url
* number
* range
* Date pickers (date, month, week, time, datetime, datetime-local)
* search
* color

## 浏览器本地存储中 cookie 和 localStorage 有什么区别？ localStorage 如何存储删除数据。
* cookie数据始终在同源的http请求中携带（即使不需要），即cookie在浏览器和服务器间来回传递；cookie数据还有路径（path）的概念，可以限制cookie只属于某个路径下。
* 存储大小限制也不同，cookie数据不能超过4k，同时因为每次http请求都会携带cookie，所以cookie只适合保存很小的数据，如会话标识。而localStorage不会自动把数据发给服务器，仅在本地保存。localStorage 虽然也有存储大小的限制，但比cookie大得多，可以达到5M或更大。
* 数据有效期不同，localStorage：始终有效，窗口或浏览器关闭也一直保存，因此用作持久数据；cookie只在设置的cookie过期时间之前一直有效，即使窗口或浏览器关闭。
* 作用域不同，localStorage 在所有同源窗口中都是共享的；cookie也是在所有同源窗口中都是共享的。Web Storage 支持事件通知机制，可以将数据更新的通知发送给监听者。Web Storage 的 api 接口使用更方便。

### localStorage CURD
{% codeblock lang:javascript %}
//增改
localStorage.setItem('myCat', 'Tom');
//删
localStorage.removeItem("myCat");
//查
var cat = localStorage.getItem("myCat");
{% endcodeblock %}

## 代码作业

### 写出如下 CSS3效果的简单事例
1. 圆角， 圆形
2. div 阴影
3. 2D 转换：放大、缩小、偏移、旋转
4. 3D 转换：移动、旋转
5. 背景色渐变
6. 过渡效果
7. 动画

### 实现如下全屏图加过渡色的效果（具体效果随意）[DEMO](http://book.jirengu.com/jirengu-inc/js-works/css3/big-cover.html)

### 写出如下 loading 动画效果 [DEMO1](http://book.jirengu.com/jirengu-inc/js-works/css3/loading1.html) [DEMO2](http://book.jirengu.com/jirengu-inc/js-works/css3/loading2.html)
[高级7](https://github.com/Zainking/demos/tree/master/%E9%AB%98%E7%BA%A77)

*本文章著作权由Zainking与饥人谷所有，转载请著明出处*
