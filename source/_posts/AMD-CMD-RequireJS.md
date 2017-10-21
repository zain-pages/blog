---
title: AMD_CMD_RequireJS
date: 2017-10-21 19:34:39
tags: 技术博客
---
## 为什么要使用模块化？
1. 解决命名冲突
2. 依赖管理
3. 提高代码可读性
4. 代码解耦，提高复用性

## CMD、AMD、CommonJS 规范分别指什么？有哪些应用
commonjs是用在服务器端的，同步的，如nodejs。
amd, cmd是用在浏览器端的，异步的，如requirejs和seajs。
其中，amd先提出，cmd是根据commonjs和amd基础上提出的。

三种模块化方式写法如下：
### commonjs
{% codeblock lang:javascript %}
//math.js
exports.add = function() {
    var sum = 0, i = 0, args = arguments, l = args.length;
    while (i < l) {
        sum += args[i++];
    }
    return sum;
};
{% endcodeblock %}
{% codeblock lang:javascript %}
//increment.js
var add = require('math').add;
exports.increment = function(val) {
    return add(val, 1);
};
{% endcodeblock %}
{% codeblock lang:javascript %}
//program.js
  var inc = require('increment').increment;
  var a = 1;
  inc(a); // 2
{% endcodeblock %}
### AMD
{% codeblock lang:javascript %}
define('modal', ['jQuery', 'dialog'], function($, Dialog){
    $('.modal').show();
    Dialog.open();
});
{% endcodeblock %}
### CMD
{% codeblock lang:javascript %}
//math.js
define(function(require, exports, module) {
  exports.add = function() {
    var sum = 0, i = 0, args = arguments, l = args.length;
    while (i < l) {
      sum += args[i++];
    }
    return sum;
  };
});
{% endcodeblock %}
{% codeblock lang:javascript %}
//increment.js
define(function(require, exports, module) {
  var add = require('math').add;
  exports.increment = function(val) {
    return add(val, 1);
  };
});
{% endcodeblock %}
{% codeblock lang:javascript %}
//program.js
define(function(require, exports, module) {
  var inc = require('increment').increment;
  var a = 1;
  inc(a); // 2

  module.id == "program";
});
{% endcodeblock %}
## 使用 requirejs 完善入门任务15，包括如下功能：
> 1. 首屏大图为全屏轮播
> 2. 有回到顶部功能
> 3. 图片区使用瀑布流布局（图片高度不一），下部有加载更多按钮，点击加载更多会加载更多数据(数据在后端 mock)

[高级4](https://github.com/Zainking/demos/tree/master/%E9%AB%98%E7%BA%A74)
*本文章著作权由Zainking与饥人谷所有，转载请著明出处*
