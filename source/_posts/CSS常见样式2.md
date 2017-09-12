---
title: CSS常见样式2
date: 2017-09-11 11:58:59
tags: 技术博客
---
## text-align: center的作用是什么，作用在什么元素上？能让什么元素水平居中

text-align: center;的作用是令元素水平居中，IE6/7及IE8混杂模式中，text-align:center可以使块级元素也居中对齐。其他浏览器中，text-align:center仅作用于行内内容上。

## IE 盒模型和W3C盒模型有什么区别?

IE盒模型以外边框的宽度高度为width和height；W3C盒模型以content的宽度高度作为width和height

## *{ box-sizing: border-box;}的作用是什么？

将宽度高度的计算方式指定为IE盒模型

## line-height: 2和line-height: 200%有什么区别?

2为相对行高，针对自己的字体大小二倍。而200%为绝对行高，针对文档默认字体大小的行高的二倍。

## inline-block有什么特性？如何去除缝隙？高度不一样的inline-block元素如何顶端对齐?

特性：既有inline元素的“内容撑开宽度”和“不独占一行”等特性，也有block元素的“可自定义宽高”和“支持margin和padding”等特性

## CSS sprite 是什么?

精灵图指的是将网页上的各种小图标集合在一张图片上的贴图。
可以通过使用css定义显示精灵图的一部分的方法显示各种小图标，从而减少http链接次数。

## 让一个元素"看不见"有几种方式？有什么区别?

{% codeblock lang:css %}
#something{
	opcity: 0;/*变透明 占位置*/
	visibility: hidden;/*消失 占位置*/
	display: none;/*消失 不占位置*/
	background-color: rgba(0, 0, 0, 0);/*背景透明*/
}
{% endcodeblock %}

## 作业
[作业代码](https://github.com/Zainking/demos)
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*