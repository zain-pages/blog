---
title: CSS综合
date: 2017-09-15 12:18:29
tags: 技术博客
---

## 说一说你平时写代码遵守的编码规范

1. 良好的命名规范 
ID和class的命名尽可能短，并符合语义。多个单词的拼接用 '-' 符号链接，尽量使用小写字母。 

2. 代码缩写 
CSS代码缩写可以提高你写代码的速度，精简你的代码量。
{% codeblock lang:css %} 
li{font-family:Arial, Helvetica, sans-serif; 
font-size: 1.2em; 
line-height: 1.4em; 
padding-top:5px; 
padding-bottom:10px; 
padding-left:5px; 
} 
{% endcodeblock %}
可以缩写成 
{% codeblock lang:css %} 
li{ 
font: 1.2em/1.4em Arial, Helvetica, sans-serif; 
padding:5px 0 10px 5px; 
} 
{% endcodeblock %}

3. 使用Reset但并非全局Reset 
全局Reset不仅仅因为它是缓慢和低效率的方法，而且还会导致一些不必要的元素也重置了外边距和内边距。
{% codeblock lang:css %}  
*{ margin:0; padding:0; } 
{% endcodeblock %}

4. 利用CSS继承 
如果页面中父元素的多个子元素使用相同的样式，那最好把他们相同的样式定 义在其父元素上，让它们继承这些CSS样式。这样你可以很好的维护你的代码，并且还可以减少代码量。那么本来这样的代码：
{% codeblock lang:css %}  
#container li{ font-family:Georgia, serif; } 
#container p{ font-family:Georgia, serif; } 
#container h1{font-family:Georgia, serif; } 
{% endcodeblock %}
就可以简写成： 
{% codeblock lang:css %} 
#container{ font-family:Georgia, serif; } 
{% endcodeblock %}
5. 使用多重选择器 
你可以合并多个CSS选择器为一个，如果他们有共同的样式的话。这样做不但代 码简洁且可为你节省时间和空间。如： 
{% codeblock lang:css %} 
h1{ font-family:Arial, Helvetica, sans-serif; font-weight:normal; } 
h2{ font-family:Arial, Helvetica, sans-serif; font-weight:normal; } 
h3{ font-family:Arial, Helvetica, sans-serif; font-weight:normal; } 
{% endcodeblock %}
可以合并为 
{% codeblock lang:css %} 
h1, h2, h3{ font-family:Arial, Helvetica, sans-serif; font-weight:normal; } 
{% endcodeblock %}

6. 适当的代码注释 
代码注释可以让别人更容易读懂你的代码，且合理的组织代码注释，可使得结构更加清晰。

7. 给你的CSS代码排序 
如果代码中的属性都能按照字母排序，那查找修改的时候就能更加快速。 
{% codeblock lang:css %} 
/*** 样式属性按字母排序 ***/ 
div{ 
background-color:#3399cc; 
color:#666; 
font:1.2em/1.4em Arial, Helvetica, sans-serif; 
height:300px; 
margin:10px 5px; 
padding:5px 0 10px 5px; 
width:30%; 
z-index:10; 
} 
{% endcodeblock %}

8. 保持CSS的可读性 
书写可读的CSS将会使得更容易查找和修改样式。 
{% codeblock lang:css %} 
/*** 每个样式属性写一行 ***/ 
div{ 
background-color:#3399cc; 
color:#666; 
font: 1.2em/1.4em Arial, Helvetica, sans-serif; 
height:300px; 
margin:10px 5px; 
padding:5px 0 10px 5px; 
width:30%; 
z-index:10; 
} 
/*** 所有的样式属性写在同一行 ***/ 
div{ background-color:#3399cc; color:#666; font: 1.2em/1.4em Arial, Helvetica, sans-serif; height:300px; margin:10px 5px; padding:5px 0 10px 5px; width:30%; z-index:10; } 
{% endcodeblock %}

9. 选择更优的样式属性值 
CSS中有些属性采用不同的属性值，虽然达到的效果差不多，当性能上却存在着差异，如： 
区别在于border:0把border设为0px，虽然在页面上看不见，但按border默认值理解，浏览器依然对border-width/border-color进行了渲染，即已经占用了内存值。 
而border:none把border设为“none”即没有，浏览器解析“none”时将不作出渲染动作，即不会消耗内存值。所以建议使用border:none;同样的，display:none隐藏对象浏览器不作渲染，不占用内存。而visibility:hidden则会。 

10. &lt;link&gt;代替@import 
@import不属于XHTML标签，也不是Web标准的一部分，它对于较早期的浏览器兼容也不高，并且对于网站的性能有某些负面的影响。所以，请避免使用@import 

11. 使用外部样式表使用 
这个原则始终是一个很好的设计实践。不单可以更易于维护修改，更重要的是使用外部文件可以提高页面速度，因为CSS文件都能在浏览器中产生缓存。内置在HTML文档中的CSS则会在每次请求中随HTML文档重新下载。所以，在实际应用中，没有必要把CSS代码内置在HTML文档中。 

12. 代码压缩 
当你决定把网站项目部署到网络上，那你就要考虑对CSS进行压缩，出去注释和空 格，以使得网页加载得更快。压缩您的代码，可以采用一些工具，如YUI Compressor 利用它可精简CSS代码，减少文件大小，以获得更高的加载速度。 

13. 避免使用css hack 

14. 代码格式 
（1） 每个css属性声明后都要使用一个分号，即使是最后的那个。 
（2） 在紧跟属性名的冒号后使用一个空格。 
（3） 每一个css选择器或是属性声明都要新起一行。 
（4） 在每一个css规则之间应该空一行。 

15. 如果css属性的值为0,则后面不要带上单位。除非真的是需要。 

## 垂直居中有几种实现方式，给出代码范例

{% codeblock lang:css %} 
/* 绝对定位居中 */
.box {
  width: 300px;
  height: 300px;
  background-color: pink;
  position:absolute;
  left:50%;
  top:50%;
  margin-left:-150px;
  margin-top:-150px;
}
/* 内联元素居中 */
.box {
  width: 400px;
  height: 300px;
  border:1px solid red;
  text-align:center;
}
.box:before {
  content:'';
  display:inline-block;
  height: 100%;
  vertical-align:middle;
}
.box img {
  vertical-align:middle;
  background-color: #fff;
}
/* tablecell */
.box {
  width: 500px;
  background-color: #fff;
  display:table-cell;
  height: 300px;
  vertical-align:middle;
  text-align:center;
}
{% endcodeblock %}

## 作业
[作业代码](https://github.com/Zainking/demos)
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*