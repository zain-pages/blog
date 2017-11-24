---
title: Math数组Date
date: 2017-09-28 16:44:59
tags: 技术博客
---
## 写一个函数，返回从min到max之间的 随机整数，包括min不包括max 
{% codeblock lang:javascript %}
function random(min,max){
	return Math.floor(min + (max - min) * Math.random());
}
{% endcodeblock %}
## 写一个函数，返回从min都max之间的 随机整数，包括min包括max 
{% codeblock lang:javascript %}
function random(min,max){
	return Math.floor(min + (max - min) * Math.random() + 1);
}
{% endcodeblock %}
## 写一个函数，生成一个长度为 n 的随机字符串，字符串字符的取值范围包括0到9，a到 z，A到Z。
{% codeblock lang:javascript %}
function getRandStr(len){
  var fullstr = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var res = "";
  for(var i = 0;i < len;i++){
    res += fullstr[Math.floor(Math.random()*fullstr.length)];
  }
  return res;
}
var str = getRandStr(10); // 0a3iJiRZap
{% endcodeblock %}
## 写一个函数，生成一个随机 IP 地址，一个合法的 IP 地址为 0.0.0.0~255.255.255.255
{% codeblock lang:javascript %}
function getRandIP(){
  var arrRes = [Math.floor(Math.random()*256),Math.floor(Math.random()*256),Math.floor(Math.random()*256),Math.floor(Math.random()*256)];
  return arrRes.join(".");
}
var ip = getRandIP()
console.log(ip) // 10.234.121.45
{% endcodeblock %}
## 写一个函数，生成一个随机颜色字符串，合法的颜色为#000000~ #ffffff
{% codeblock lang:javascript %}
function getRandColor(){
	var fullStr = "0123456789ABCDEF";
	var res ="#";
	 for(var i = 0;i < 6;i++){
    res += fullStr[Math.floor(Math.random()*fullStr.length)];
    }
    return res;
}
var color = getRandColor()
console.log(color)   // #3e2f1b
{% endcodeblock %}
## 数组方法里push、pop、shift、unshift、join、splice分别是什么作用？用 splice函数分别实现push、pop、shift、unshift方法
push:从尾部加入一个元素，返回数组长度。
pop:从尾部抛出一个元素，返回抛出的元素。
unshift:从头部加入一个元素，返回数组长度。
shift:从头部抛出一个元素，返回抛出的元素。
splice(a,b,c,...):从数组的a位置删除b个元素并依次加入c,...元素。
{% codeblock lang:javascript %}
var arr = [1,2,5,4,7];
arr.splice(arr.length,0,17);//arr.push(17)
arr.splice(arr.length - 1,1);//arr.pop()
arr.splice(0,0,17)//arr.unshift(17)
arr.splice(0,1)//arr.shift(17)
{% endcodeblock %}
## 写一个函数，操作数组，数组中的每一项变为原来的平方，在原数组上操作
{% codeblock lang:javascript %}
function squareArr(arr){
  arr.forEach(function(value,index,array){
    array[index] = value * value;
  })
}
var arr = [2, 4, 6]
squareArr(arr)
console.log(arr) // [4, 16, 36]
{% endcodeblock %}
## 写一个函数，操作数组，返回一个新数组，新数组中只包含正数，原数组不变
{% codeblock lang:javascript %}
function filterPositive(arr){
  return arr.filter(function(value){
    return value > 0 && typeof value == "number";
  });
}
var arr = [3, -1,  2,  '饥人谷', true]
var newArr = filterPositive(arr)
console.log(newArr) //[3, 2]
console.log(arr) //[3, -1,  2,  '饥人谷', true]
{% endcodeblock %}
##  写一个函数getChIntv，获取从当前时间到指定日期的间隔时间
{% codeblock lang:javascript %}
var str = getChIntv("2017-02-08");
function getChIntv(dateStr){
	var afterDate = new Date(dateStr);
	var nowDate = new Date();
	var timeDifference = Math.abs(afterDate - nowDate);
	var second = timeDifference/1000%60;
	var minute = (timeDifference/1000 - second)/60%60
	var hour = (timeDifference/1000 - second)/3600%24
	var day = (timeDifference/1000 - second)/86400
	return "距离"+ dateStr + "还有" + Math.floor(day) + "天" + Math.floor(hour) + "小时" + Math.floor(minute) + "分钟" + Math.floor(second) + "秒";
}
console.log(str);  // 距除夕还有 20 天 15 小时 20 分 10 秒
{% endcodeblock %}
## 把hh-mm-dd格式数字日期改成中文日期
{% codeblock lang:javascript %}
var str = getChsDate('2015-01-08');
console.log(str);  // 二零一五年一月八日
function getChsDate(time){
    var dict = ['零','一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十','二十一','二十二','二十三','二十四','二十五','二十六','二十七','二十八','二十九','三十','三十一'];
    var arr = time.split('-');
    var year = arr[0];
    var month = arr[1];
    var day = arr[2];
    var yearCh = [];
    for(var i = 0; i < 4; i++){
       yearCh.push(dict[parseInt(year[i])]);
    }
    var monthCh = dict[parseInt(month)];
    var dayCh = dict[parseInt(day)];
    var str = yearCh.join('')+'年'+monthCh+'月'+dayCh+'日';
    return str;
}

{% endcodeblock %}
## 写一个函数，参数为时间对象毫秒数的字符串格式，返回值为字符串。假设参数为时间对象毫秒数t，根据t的时间分别返回如下字符串:

* 刚刚（ t 距当前时间不到1分钟时间间隔）
* 3分钟前 (t距当前时间大于等于1分钟，小于1小时)
* 8小时前 (t 距离当前时间大于等于1小时，小于24小时)
* 3天前 (t 距离当前时间大于等于24小时，小于30天)
* 2个月前 (t 距离当前时间大于等于30天小于12个月)
* 8年前 (t 距离当前时间大于等于12个月)
{% codeblock lang:javascript %}
function friendlyDate(time){
	var nowDate = new Date();
	var timeDifference = Math.abs(time - nowDate);
	if(timeDifference < 60*1000){
        return "刚刚";
	}else if(timeDifference < 60*1000*60){
        return "3分钟前";
	}else if(timeDifference < 60*1000*60*24){
	    return "8小时前";
	}else if(timeDifference < 60*1000*60*24*30){
	    return "3天前";
	}else if(timeDifference < 60*1000*60*24*30*12){
	    return "2个月前";
	}else{
	    return "8年前";
	}

}
var str = friendlyDate( '1484286699422' ) //  1分钟前
var str2 = friendlyDate('1483941245793') //4天前
{% endcodeblock %}
 