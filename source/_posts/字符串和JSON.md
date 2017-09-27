---
title: 字符串和JSON
date: 2017-09-27 13:19:05
tags: 技术博客
---

## 对于 HTTP 协议而言，HTML、CSS、JS、JSON 的本质都是什么？

## 使用数组拼接出如下字符串 ，其中styles数组里的个数不定
{% codeblock lang:javascript %}
var prod = {
    name: '女装',
    styles: ['短款', '冬季', '春装']
};
function getTpl(data){
//todo...
};
var result = getTplStr(prod);  //result为下面的字符串
{% endcodeblock %}
{% codeblock lang:html %}
<dl class="product"><dt>女装</dt><dd>短款</dd<dd>冬季</dd><dd>春装</dd></dl>
{% endcodeblock %}
## 写出两种以上声明多行字符串的方法
例如：
{% codeblock lang:javascript %}
var str = 'abcdeabcdeabcdeancdeabcdeabcdeabcdeancdeabcdeabcdeabcdeancdeabcdeabcdeabcdeancde'
{% endcodeblock %}
这段字符串很长，如何多行优雅的显示
## 补全如下代码,让输出结果为字符串: hello\\饥人谷
{% codeblock lang:javascript %}
var str = //补全代码
console.log(str)
{% endcodeblock %}
## 以下代码输出什么?为什么
{% codeblock lang:javascript %}
var str = 'jirengu\nruoyu'
console.log(str.length)
{% endcodeblock %}
## 写一个函数，判断一个字符串是回文字符串，如 abcdcba是回文字符串, abcdcbb不是
{% codeblock lang:javascript %}
{% endcodeblock %}
## 写一个函数，统计字符串里出现出现频率最多的字符
## 写一个camelize函数，把my-short-string形式的字符串转化成myShortString形式的字符串，如
{% codeblock lang:javascript %}
camelize("background-color") == 'backgroundColor'
camelize("list-style-image") == 'listStyleImage'
{% endcodeblock %}
## 写一个 ucFirst函数，返回第一个字母为大写的字符 （***）
{% codeblock lang:javascript %}
ucFirst("hunger") == "Hunger"
{% endcodeblock %}
## 写一个函数truncate(str, maxlength), 如果str的长度大于maxlength，会把str截断到maxlength长，并加上...，如
{% codeblock lang:javascript %}
truncate("hello, this is hunger valley,", 10) == "hello, thi...";
truncate("hello world", 20) == "hello world"
{% endcodeblock %}
## 什么是 JSON格式数据？JSON格式数据如何表示对象？window.JSON 是什么？11、如何把JSON 格式的字符串转换为 JS 对象？如何把 JS对象转换为 JSON 格式的字符串?