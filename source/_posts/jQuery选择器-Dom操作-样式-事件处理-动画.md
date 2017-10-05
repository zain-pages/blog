---
title: jQuery选择器_Dom操作_样式_事件处理_动画
date: 2017-10-05 13:08:10
tags: 技术博客
---
##  jQuery 能做什么？
jQuery提供了一个简洁的元素选择器，用简单的函数名称和语法封装了原生DOMAPI，提供了DOM增改删查操作，Ajax，动画，事件操作等功能，并提供了拓展自身功能的接口。

##  jQuery 对象和 DOM 原生对象有什么区别？如何转化？
jQuery对象只可以使用jQuery封装的API，DOM原生对象只可以使用DOM原生API。
jQuery对象加数组下标即可转化为DOM原生对象，DOM原生对象以$()包裹即可转化为jQuery对象。

## jQuery中如何绑定事件？bind、unbind、delegate、live、on、off都有什么作用？推荐使用哪种？使用on绑定事件使用事件代理的写法？
{% codeblock lang:javascript %}
$(selector).bind(type,[data],function(eventObject)); //jQuery3.0已经删除此方法
$(selector).unbind(type,[data|fn]]); //jQuery3.0已经删除此方法
$(selector).delegate(selector,[type],[data],fn); //jQuery3.0已经删除此方法，代理用参数中selector为principal，$选择器中selector为agent
$(selector).live(type, [data], fn); //jQuery1.7已经删除此方法，给所有匹配的元素附加一个事件处理函数，即使这个元素是以后再添加进来的也有效。
$(selector).on(events,[selector],[data],fn); //在选择元素上绑定一个或多个事件的事件处理函数。当参数中selector不为空时，此函数则为其做事件代理。其中events之后可以加“.id”来标定某一个点击事件
$(selector).off(events,[selector],[fn]); //在选择元素上移除一个或多个事件的事件处理函数。特定的事件处理程序可以被移除元素上提供事件的名称，命名空间，选择器，或处理函数名称的组合。当有多个过滤参数，所提供的参数都必须匹配的事件处理程序被删除。
{% endcodeblock %}
在jQuery1.7之后，建议使用on/off方法，jQuery3.0以后，已经删除bind、unbind、delegate方法。
使用on绑定事件使用事件代理的写法：
{% codeblock lang:javascript %}
$('agent').on('event','principal',function(e){
    //callback
    this === document.querySelector('principal'); //true
  });
{% endcodeblock %}
## jQuery 如何展示/隐藏元素？
{% codeblock lang:javascript %}
/* jQuery展示/隐藏元素 */
$(selector).show();//展示
$(selector).hide();//隐藏
{% endcodeblock %}
##  jQuery 动画如何使用？
{% codeblock lang:javascript %}
$(selector).animate({params},speed,callback);
{% endcodeblock %}
其中{params}为之后的CSS样式，（事实上jQuery不支持某些css样式渐变如background-color，这个时候用css3的transition属性更为好用），speed为动画时间，callback为动画执行完毕时候产生的回调函数。animate支持链式调用，支持动画队列。动画会依次执行。
另有一堆封装好的动画方法，还有两个特殊的方法：
{% codeblock lang:javascript %}
$(selector).finish();//停止动画于最终样式
$(selector).stop();//停止动画于此序列最终样式
{% endcodeblock %}
## 如何设置和获取元素内部 HTML 内容？如何设置和获取元素内部文本？
{% codeblock lang:javascript %}
/* 获取元素的html与设置元素的html */
$(selector).html();//获取
$(selector).html(value);//设置
/* 获取元素的text与设置元素的text */
$(selector).text();//获取
$(selector).text(value);//设置
{% endcodeblock %}
## 如何设置和获取表单用户输入或者选择的内容？如何设置和获取元素属性？
{% codeblock lang:javascript %}
/* 获取元素的值与设置元素的值 */
$(selector).val();//获取
$(selector).val(value);//设置
/* 获取和设置元素属性 */
$(selector).attr('Arrtibute');//获取
$(selector).attr('Arrtibute','value');//设置
{% endcodeblock %}
## 作业
[进阶14](https://github.com/Zainking/demos/tree/master/%E8%BF%9B%E9%98%B614)
