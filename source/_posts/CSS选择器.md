---
title: CSS选择器
date: 2017-09-11 09:26:22
tags: 技术博客
---
## class 和 id 的使用场景?

Html中的“类”（class）可以赋予给多个不同标签，而id每篇html文档只可以存在一次，因此class多用于某种统一的样式，而id多用于“仅此一种”的样式。实践上，对于样式而言，我们常常采用class而不是id。

## CSS选择器常见的有几种?

类选择器，id选择器，属性选择器，通配符选择器，子代选择器，子元素选择器，伪类选择器，伪元素选择器。

## 选择器的优先级是怎样的?对于复杂场景如何计算优先级？

!important > 行内样式 > ID选择器 > 类选择器 > 标签 > 通配符 > 继承 > 浏览器默认属性

优先级计算方法：先数 id选择器数量，如果id选择器数量多的选择器权重高。
如果id选择器数量相同，再数类选择器数量，最后数标签。

## a:link, a:hover, a:active, a:visited 的顺序是怎样的？ 为什么？

a:link：选择未被访问的链接，并设置其样式
a:hover：选择鼠标指针浮动在其上的元素，并设置其样式
a:active：选择活动链接，并设置其样式
a:visited：选择已访问的链接，并设置其样式

在W3C规范中，也规定了链接的声明顺序：
在 CSS 定义中，a:hover 必须被置于 a:link 和 a:visited 之后，才是有效的。
在 CSS 定义中，a:active 必须被置于 a:hover 之后，才是有效的。

所以正确的顺序为：a:link、a:visited、a:hover、a:active

## 以下选择器分别是什么意思?

{% codeblock lang:css %}

#header{
}
/*选择id为 header 的所有元素*/
.header{
}
.header .logo{
}
/*选择所有 header 类下的所有 logo 类元素*/
.header.mobile{
}
/*同时拥有 header 和 mobile 类的元素*/
.header p, .header h3{
}
/*header 类下的所有 p 标签和 header 类下的所有 h3 标签*/
#header .nav>li{
}
/*id为 header 元素下的所有 nav 类的子级 li 标签*/
#header a:hover{
}
/*id为 header 元素下的 a 标签在鼠标指针浮动于其上时 */
#header .logo~p{
}
/*id为 header 元素下所有的 logo 类元素后紧随的同级 p 标签*/
#header input[type="text"]{
}
/*id为 header 元素下所有属性中 type 属性为 text 的 input 标签*/
{% endcodeblock %}

## 列出你知道的伪类选择器

:link,:hover,:visited,:active,:first-child,:last-child,:nth-child(x);

## div:first-child、div:first-of-type、div :first-child和div :first-of-type的作用和区别 （注意空格的作用）

:first-child选择器是选择父元素的第一个子元素，而:first-of-type选择器则是选择第一个这个类/这个标签的子元素。
而空格无非是后代选择器而已，所以这四个选择器的意义分别是：

div:first-child：是第一个元素的 div 标签
div:first-of-type：第一个 div 标签
div :first-child：div 标签下的第一个元素
div :first-of-type：div 标签下每个标签的第一个元素

## 运行如下代码，解析下输出样式的原因。

{% codeblock lang:html %}
<style>
.item1:first-child{
  color: red;
}
.item1:first-of-type{
  background: blue;
}
</style>
<div class="ct">
  <p class="item1">aa</p>
  <h3 class="item1">bb</h3>
  <h3 class="item1">ccc</h3>
</div>
{% endcodeblock %}
效果：
<style> .item1:first-child{ color: red; } .item1:first-of-type{ background: blue; } </style> <div class="ct"> <p class="item1">aa</p> <h3 class="item1">bb</h3> <h3 class="item1">ccc</h3> </div>

解释：
.item1:first-child选中了item1类中第一个元素，所以内容为“aa”的p标签变红色了。
.item1:first-of-type选中了item1类中所有的标签的第一个元素，所以p标签和第一个h3标签的背景变蓝了。

 
