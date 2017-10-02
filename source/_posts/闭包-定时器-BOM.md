---
title: 闭包_定时器_BOM
date: 2017-10-02 15:36:56
tags: 技术博客
---

## 下面的代码输出多少？修改代码让 fnArr[i]() 输出 i。使用 两种以上的方法
{% codeblock lang:javascript %}
    var fnArr = [];
    for (var i = 0; i < 10; i ++) {
        fnArr[i] =  function(){
    	    return i;
        };
    }
    console.log( fnArr[3]() );  //10
{% endcodeblock %}
{% codeblock lang:javascript %}
    var fnArr = [];
    for (let i = 0; i < 10; i ++) {
        fnArr[i] =  function(){
    	    return i;
        };
    }
    console.log( fnArr[3]() );  //3
{% endcodeblock %}
{% codeblock lang:javascript %}
    var fnArr = [];
    for (var i = 0; i < 10; i ++) {
    	!function(){
			     fnArr[i] =  function(){
	    	    return i;
	        };
	    }()
    }
    console.log( fnArr[3]() );  //3
{% endcodeblock %}
## 封装一个汽车对象，可以通过如下方式获取汽车状态
{% codeblock lang:javascript %}
var Car = (function(){
	var speed = 0;
	function setSpeed(s){
	    speed = s;
	}
	function getSpeed(){
	    return speed;
	}
	function accelerate(){
		speed += 10;
	}
	function decelerate(){
		speed>=10?speed-=10:speed=0;
	}
	function getStatus(){
		if(speed==0)return 'stop';else return 'running';
	}
   return {
      setSpeed: setSpeed,
      getSpeed: getSpeed,
      accelerate: accelerate,
      decelerate: decelerate,
      getStatus: getStatus,
   }
})()
Car.setSpeed(30);
Car.getSpeed(); //30
Car.accelerate();
Car.getSpeed(); //40;
Car.decelerate();
Car.decelerate();
Car.getSpeed(); //20
Car.getStatus(); // 'running';
Car.decelerate();
Car.decelerate();
Car.getStatus();  //'stop';
//Car.speed;  //error
{% endcodeblock %}
## 下面这段代码输出结果是? 为什么?
{% codeblock lang:javascript %}
var a = 1;
setTimeout(function(){
    a = 2;
    console.log(a);
}, 0);
var a ;
console.log(a);
a = 3;
console.log(a);
//1 3 2
{% endcodeblock %}
因为setTimeout函数会在外面的函数体执行完成后处理，所以即使定时器时间为0，仍旧会在所有代码执行后再执行。
## 下面这段代码输出结果是? 为什么?
{% codeblock lang:javascript %}
var flag = true;
setTimeout(function(){
    flag = false;
},0)
while(flag){}//(1)
console.log(flag);
{% endcodeblock %}
这段代码将会陷入死循环于(1)，无法输出结果。原因也是如上题setTimeout的机理决定。卡死在while的代码并不会执行setTimeout里面的函数。
## 下面这段代码输出？如何输出delayer: 0, delayer:1...（使用闭包来实现）
{% codeblock lang:javascript %}
for(var i=0;i<5;i++){
	setTimeout(function(){
         console.log('delayer:' + i );
	}, 0);
	console.log(i);
}
//0 1 2 3 4 delayer:5 delayer:5 delayer:5 delayer:5 delayer:5
{% endcodeblock %}
{% codeblock lang:javascript %}
for(var i=0;i<5;i++){
		!function(i){
		setTimeout(function(){
	         console.log('delayer:' + i );
		}, 0);
	}(i)
}
//delayer:0 delayer:1 delayer:2 delayer:3 delayer:4
{% endcodeblock %}
## 如何获取元素的真实宽高
通过element.offsetHeight和element.offsetWidth获取
//ie8及以前版本：通过currentStyle
## URL 如何编码解码？为什么要编码？
使用encodeURIComponent()方法编码，使用decodeURIComponent()方法解码。编码主要有两个目的，一是为了规避潜在的语义攻击风险，二是为了统一解析不同语言的字符。
## 补全如下函数，判断用户的浏览器类型
{% codeblock lang:javascript %}
function isAndroid(){
	return /Android/.test(window.navigator.userAgent);
}
function isIphone(){
	return /iPhone/.test(window.navigator.userAgent);
}
function isIpad(){
	return /iPad/.test(window.navigator.userAgent);
}
function isIOS(){
	return /Mac/.test(window.navigator.userAgent);
}
{% endcodeblock %}
