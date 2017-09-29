---
title: DOM操作
date: 2017-09-29 16:51:16
tags: 技术博客
---
## dom对象的innerText和innerHTML有什么区别？
* innerText不包含文档结构，只会包含对象的文本内容
* innerHTML包含文档结构，标签属性等信息

## elem.children和elem.childNodes的区别？
* elem.childNodes包含HTML节点，文本节点，属性节点
* elem.children只包含子HTML节点
## 查询元素有几种常见的方法？ES5的元素选择方法是什么?
DOM0查询元素方法：
* document.getElementById('id');
* document.getElementsByTagName('tagName');
* document.getElementsByClassName('className');
DOM3(ES5)查询元素方法
* document.querySelector('cssQuerySelector');

## 如何创建一个元素？如何给元素设置属性？如何删除属性
用document.createElement()方法创建元素，用element.setAttribute()方法设置属性，用element.romoveAttribute()方法删除属性。

## 如何给页面元素添加子元素？如何删除页面元素下的子元素?
添加子元素：
1. 先用document.createElement()方法创建子元素。
2. 再用element.appendChild()方法将元素添加至文档节点中。
(还有一些insertBefore(),replaceChild()之类的方法用于不同位置的添加或者代替等不同用途)

删除子元素：
## element.classList有哪些方法？如何判断一个元素的 class 列表中是包含某个 class？如何添加一个class？如何删除一个class?
element.classList有element.classList.add('class'),element.classList.remove('class'),element.classList.contains('class')等方法，分别可以添加，删除，判断有无列表中的类。（其他还有一些诸如toggle和item之类的不常用方法）
## 如何选中如下代码所有的li元素？ 如何选中btn元素？
{% codeblock lang:html %}
<div class="mod-tabs">
   <ul>
       <li>list1</li>
       <li>list2</li>
       <li>list3</li>
   </ul>
   <button class="btn">点我</button>
</div>
<script>
	var li = document.querySelector('.mod-tabs ul li');
	var btn = document.querySelector('.btn');
</script>
{% endcodeblock %}
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*