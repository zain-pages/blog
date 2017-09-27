---
title: 字符串和JSON
date: 2017-09-27 13:19:05
tags: 技术博客
---

## 对于 HTTP 协议而言，HTML、CSS、JS、JSON 的本质都是什么？
字符串。
浏览器根据相应请求头中的Content-Type以对应的语法解析这些字符串，再分别渲染执行。
## 使用数组拼接出如下字符串 ，其中styles数组里的个数不定
{% codeblock lang:javascript %}
var prod = {
    name: '女装',
    styles: ['短款', '冬季', '春装']
};
function getTpl(data){
	var res = "";
	res += "<dl class='product'><dt>" + data.name +"</dt>";
	for(var i = 0;i < data.styles.length;i++){
		res += "<dd>" + data.styles[i] +"</dd>"
	}
	res += "</dl>";
	return res;
};
var result = getTpl(prod);  //result为下面的字符串
{% endcodeblock %}
{% codeblock lang:html %}
<dl class="product"><dt>女装</dt><dd>短款</dd><dd>冬季</dd><dd>春装</dd></dl>
{% endcodeblock %}
## 写出两种以上声明多行字符串的方法
例如：
{% codeblock lang:javascript %}
var str1 = 'abcdeabcdeabcdeancdea\
			bcdeabcdeabcdeancdeabcdeabcdeabcd\
			eancdeabcdeabcdeabcdeancde';
var str2 = 'abcdeabcdeabcdeancdea'
		  +'bcdeabcdeabcdeancdeabcdeabcdeabcd'
		  +'eancdeabcdeabcdeabcdeancde';
var str3 = `abcdeabcdeabcdeancdea
			bcdeabcdeabcdeancdeabcdeabcdeabcd
			eancdeabcdeabcdeabcdeancde`;
{% endcodeblock %}
这段字符串很长，如何多行优雅的显示
## 补全如下代码,让输出结果为字符串: hello\\饥人谷
{% codeblock lang:javascript %}
var str = "hello\\\\饥人谷"
console.log(str)
{% endcodeblock %}
## 以下代码输出什么?为什么
{% codeblock lang:javascript %}
var str = 'jirengu\nruoyu'
console.log(str.length) //13,因为其中\n转移为换行符，长度为1
{% endcodeblock %}
## 写一个函数，判断一个字符串是回文字符串，如 abcdcba是回文字符串, abcdcbb不是
{% codeblock lang:javascript %}
function isPalindrome(str){
	for(var i = 0;i < str.length;i++){
		if(str.split("")[i] !== str.split("")[str.length-1-i]){
			return false;
		}
	}
	return true;
}
{% endcodeblock %}
## 写一个函数，统计字符串里出现出现频率最多的字符
{% codeblock lang:javascript %}
function maxNumOfStr(str){
	var dist = {};
	maxNumStr = "";
	maxNum = 0;
	for(var i = 0;i < str.length;i++){
		if(dist[str[i]] == undefined){
			dist[str[i]] = 1;
		}else{
			dist[str[i]]++;
		}
	}
	for(key in dist){
		if(dist[key] > maxNum){
			maxNum = dist[key];
			maxNumStr = key;
		}
	}
	return maxNumStr;
}
{% endcodeblock %}
## 写一个camelize函数，把my-short-string形式的字符串转化成myShortString形式的字符串，如
{% codeblock lang:javascript %}
function camelize(str){
	var res = str.split('-');
	for(var i = 1;i < res.length;i++){
		if(res[i].length > 1){
			res[i] = res[i][0].toUpperCase() + res[i].slice(1);
		}else res[i]=res[i].toUpperCase();
	}
	return res.join('');
}
camelize("background-color") == 'backgroundColor'
camelize("list-style-image") == 'listStyleImage'
{% endcodeblock %}
## 写一个 ucFirst函数，返回第一个字母为大写的字符 （***）
{% codeblock lang:javascript %}
ucFirst("hunger") == "Hunger"
function ucFirst(str){
	return str[0].toUpperCase() + str.slice(1);
}
{% endcodeblock %}

## 写一个函数truncate(str, maxlength), 如果str的长度大于maxlength，会把str截断到maxlength长，并加上...，如
{% codeblock lang:javascript %}
truncate("hello, this is hunger valley,", 10) == "hello, thi...";
truncate("hello world", 20) == "hello world";
function truncate(str, maxlength){
	return str.length<=maxlength?str:str.slice(0,maxlength) + "...";
}
{% endcodeblock %}
## 什么是 JSON格式数据？JSON格式数据如何表示对象？window.JSON 是什么？
JSON数据就是符合JSON语法的字符串，JSON格式数据以键值对的形式表示对象，键值对间以:分隔，对象间以,分隔。window.JSON是指BOM上用来操作JSON对象的工具对象，包含了parse()和stringify()等常用的JSON方法。
## 如何把JSON 格式的字符串转换为 JS 对象？如何把 JS对象转换为 JSON 格式的字符串?
JSON 格式的字符串转换为 JS 对象用JSON.parse()方法，把 JS对象转换为 JSON 格式的字符串用JSON.stringify()方法。