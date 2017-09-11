---
title: CSS常见样式
date: 2017-09-11 11:30:40
tags: 技术博客
---
## 块级元素和行内元素分别有哪些？动手测试并列出4条以上的特性区别

块级元素：div;表格系列标签;列表系列标签;h1~h6系列标签;
行内元素：a;input;span;img;textarea;select;button;文字描述系列标签;

## 什么是 CSS 继承? 哪些属性能继承，哪些不能？

应用样式的元素的后代会继承样式的某些属性，比如颜色和字号。这种特点称作CSS继承。

不可继承的：display、margin、border、padding、background、height、min-height、max- height、width、min-width、max-width、overflow、position、left、right、top、 bottom、z-index、float、clear、table-layout、vertical-align、page-break-after、 page-bread-before和unicode-bidi。
所有元素可继承：visibility和cursor。
内联元素可继承：letter-spacing、word-spacing、white-space、line-height、color、font、 font-family、font-size、font-style、font-variant、font-weight、text- decoration、text-transform、direction。
块状元素可继承：text-indent和text-align。
列表元素可继承：list-style、list-style-type、list-style-position、list-style-image。
表格元素可继承：border-collapse。

## 如何让块级元素水平居中？如何让行内元素水平居中?

块级元素水平居中一般使用margin: 0 auto;实现。
行内元素水平居中一般使用text-align: center;实现。
更多居中方法参考：[CSS 水平居中，垂直居中](http://www.cnblogs.com/csdttnk/archive/2013/01/06/2848407.html)

## 用 CSS 实现一个三角形

如作业代码所示

## 单行文本溢出加 ...如何实现?
{% codeblock lang:css %}
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
{% endcodeblock %}
多行文本溢出加 ...参考：[如何实现单行／多行文本溢出的省略](http://www.cnblogs.com/penghuwan/p/6682303.html)

## px, em, rem 有什么区别

px像素（Pixel）。相对长度单位。像素px是相对于显示器屏幕分辨率而言的。(引自CSS2.0手册)
em是相对长度单位。相对于当前对象内文本的字体尺寸。如当前对行内文本的字体尺寸未被人为设置，则相对于浏览器的默认字体尺寸。(引自CSS2.0手册)
rem是CSS3新增的一个相对单位（rootem，根em），区别在于使用rem为元素设定字体大小时，仍然是相对大小，但相对的只是HTML根元素。

## 解释下面代码的作用?为什么要加引号? 字体里\5b8b\4f53代表什么?

{% codeblock lang:css %}
body{
  font: 12px/1.5 tahoma,arial,'Hiragino Sans GB','\5b8b\4f53',sans-serif;
}
{% endcodeblock %}

作用：定义body标签内的所有字体大小为12px，1.5倍行距，依次尝试tahoma,arial,'Hiragino Sans GB','\5b8b\4f53',sans-serif 这几种字体，取较前的设定为所用字体。
为什么要加引号：因为字体名称内部有空格，不加引号易引起歧义。
\5b8b\4f53：‘宋体’两个字的Unicode 编码，在此可以代替‘宋体’两个字。

## 作业
[作业代码](https://github.com/Zainking/demos)
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*
