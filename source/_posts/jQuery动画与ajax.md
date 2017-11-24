---
title: jQuery动画与ajax
date: 2017-10-06 22:48:36
tags: 技术博客
---
## jQuery 中， $(document).ready()是什么意思？
当 DOM（文档对象模型） 已经加载，并且页面（包括图像）已经完全呈现时，会发生 ready 函数中的回调函数。
## $node.html()和$node.text()的区别?
1. html与.text的方法操作是一样，只是在具体针对处理对象不同
2. html处理的是元素内容，.text处理的是文本内容
3. html只能使用在HTML文档中，.text 在XML 和 HTML 文档中都能使用, 如果处理的对象只有一个子文本节点，那么html处理的结果与text是一样的;

也就是说，当处理的对象有两个以上的子节点时，.html()只会替换第一个子节点的内容（也可以通过选择器指定替换的子节点），.text则会将对象中的所有文本替换
## $.extend 的作用和用法?
jQuery.extend(object)扩展jQuery对象本身。
示例：
{% codeblock lang:javascript %}
/* 此时min和max方法拓展到jq全局对象上 */
jQuery.extend({
min: function(a, b) { return a < b ? a : b; },
max: function(a, b) { return a > b ? a : b; }
});
jQuery.min(2,3); // 2
jQuery.max(4,5); // 5
{% endcodeblock %}
{% codeblock lang:javascript %}
/* 此时min和max方法拓展到jq实例对象上 */
jQuery.fn.extend({
min: function(a, b) { return a < b ? a : b; },
max: function(a, b) { return a > b ? a : b; }
});
$("div").min(2,3); // 2
$("div").max(4,5); // 5
/* 此时b和c拓展到a上 */
var a = {},b={name:'zain',age:18},c:{sex:'man'}
jQuery.extend(a,b,c);
console.log(a); // {name:'zain',age:'18',sex:'man'}
{% endcodeblock %}
## jQuery 的链式调用是什么？
jQuery中的链式调用是指形如$(selector).append('hello').css('line-height','1.5')的直接把下一个操作写在上一个操作后的写法，原理是jQuery的非求值函数调用返回其自身。
## jQuery 中 data 函数的作用
用于存取当前匹配jQuery对象上的数据。可以通过jQueryObject.data( [ key [, value ] ])的形式存取数据或者直接传入一个对象以设置多个键值对。
## 写出以下功能对应的 jQuery 方法：
{% codeblock lang:javascript %}
/*给元素 $node 添加 class active，给元素 $noed 删除 class active*/
$node.addClass('active');
$node.removeClass('active');
/*展示元素$node, 隐藏元素$node*/
$node.show();
$node.hide();
/*获取元素$node 的 属性: id、src、title， 修改以上属性*/
//获取
var nodeid = $node.attr('id');
var nodesrc = $node.attr('src');
var nodetitle = $node.attr('title');
//设置
$node.attr('id','node').attr('src','http://baidu.com').attr('title','baidu');
/*给$node 添加自定义属性data-src*/
$node.attr('data-src','//zain.red');
/*在$ct 内部最开头添加元素$node*/
$ct.prepend($node);
/*在$ct 内部最末尾添加元素$node*/
$ct.append($node);
/*删除$node*/
$node.remove();
/*把$ct里内容清空*/
$ct.empty();
/*在$ct 里设置 html <div class="btn"></div>*/
$ct.html('<div class="btn"></div>');
/*获取、设置$node 的宽度、高度(分别不包括内边距、包括内边距、包括边框、包括外边距)*/
//宽度
$node.width();//获取：区块的本身宽度
$node.outerWidth();//获取：区块的宽度+padding宽度+border宽度
$node.outerWidth(true);//获取：区块的宽度+padding宽度+border宽度+margin的宽度
//高度
$node.height();//获取：区块的本身高度
$node.outerHeight();//获取：区块的高度+padding高度+border高度
$node.outerHeight(true);//获取：区块的高度+padding高度+border高度+margin的高度
/*获取窗口滚动条垂直滚动距离*/
$(document).scrollTop();  
/*获取$node 到根节点水平、垂直偏移距离*/
$node.offset();
/*修改$node 的样式，字体颜色设置红色，字体大小设置14px*/
$node.css('color','#f00').css('font-size','14px');
/*遍历节点，把每个节点里面的文本内容重复一遍*/
$('*').each(function(){
  $(this).text($(this).text()+$(this).text())
  });
/*从$ct 里查找 class 为 .item的子元素*/
$ct.children('.item');
/*获取$ct 里面的所有孩子*/
$ct.children();
/*对于$node，向上找到 class 为'.ct'的父亲，在从该父亲找到'.panel'的孩子*/
$node.parents('.ct').children('.panel');
/*获取选择元素的数量*/
$node.length;
/*获取当前元素在兄弟中的排行*/
$node.index();
{% endcodeblock %}
## 用jQuery实现以下操作
{% codeblock lang:javascript %}
/*当点击$btn 时，让 $btn 的背景色变为红色再变为蓝色*/
$btn.on('click',function(){
    $(this).animate({'background-color':'#f00'},1000).animate({'background-color':'#00f'},1000)
  })
/*当窗口滚动时，获取垂直滚动距离*/
$(window).scroll(function(){
  console.log($(this).scrollTop())
})
/*当鼠标放置到$div 上，把$div 背景色改为红色，移出鼠标背景色变为白色*/
$div.on('mouseenter',function(){
    $(this).css('background-color','#f00');
  });
$div.on('mouseleave',function(){
    $(this).css('background-color','#00f');
  });
/*当鼠标激活 input 输入框时让输入框边框变为蓝色，当输入框内容改变时把输入框里的文字小写变为大写，当输入框失去焦点时去掉边框蓝色，控制台展示输入框里的文字*/
$input.on('focus',function(){
    $(this).css('border','1px solid #00f');
  });
$input.on('change',function(){
    $(this).val($this.cal().toUpperCase());
  });
$input.on('blur',function(){
    $(this).css('border','none');
  });
/*当选择 select 后，获取用户选择的内容*/
$select.on('change',function(){
    console.log($(this).val());
  })
{% endcodeblock %}
## 用 jQuery ajax 实现当点击加载更多会加载数据展示到页面效果预览效果。
{% codeblock lang:javascript %}
  var isLoading = true;
  var pageNum = 1;
  var pageSize = 5;
  $btn.on('click',function(){
      if(isLoading){
        isLoading = false;
        $.get('/getNews',{'page' : pageNum,'pageSize' :pageSize},function(data){
            isLoading = true;
            if(data.status.statusCode = 1){
              for(key in data){
                $ul.append(<li> + 'data[key]' + </li>);
                pageNum++;
              }else{
                alert(data.status.errorMessage);
              }
            }
          });
      }
    });
{% endcodeblock %}
### APIDoc
/getNews GET
params:
{% codeblock lang:javascript %}
{
  page : 1,
  pageSize : 5
}
{% endcodeblock %}
Success:
{% codeblock lang:javascript %}
{
  'data':{
    '0' : '新闻1'，
    '1' : '新闻2'，
    '2' : '新闻3'，
    '3' : '新闻4'，
    '4' : '新闻5'，
  },
  'status':{
    'statusCode' : 1,
    'errorMessage' : 'Success'
  }
}
{% endcodeblock %}
Error:
{% codeblock lang:javascript %}
{
  'data':{},
  'status':{
    'statusCode' : 0,
    'errorMessage' : 'Error'
  }
}
{% endcodeblock %}
 
