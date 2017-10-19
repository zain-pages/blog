---
title: this_原型链_继承
date: 2017-10-19 11:06:50
tags: 技术博客
---
## apply、call 、bind有什么作用，什么区别

## 以下代码输出什么?
{% codeblock lang:javascript %}
var john = {
  firstName: "John"
}
function func() {
  alert(this.firstName + ": hi!")
}
john.sayHi = func
john.sayHi()
{% endcodeblock %}
## 下面代码输出什么，为什么
{% codeblock lang:javascript %}
func()
function func() {
  alert(this)
}
{% endcodeblock %}
## 下面代码输出什么
{% codeblock lang:javascript %}
document.addEventListener('click', function(e){
    console.log(this);
    setTimeout(function(){
        console.log(this);
    }, 200);
}, false);
{% endcodeblock %}
## 下面代码输出什么，why
{% codeblock lang:javascript %}
var john = {
  firstName: "John"
}

function func() {
  alert( this.firstName )
}
func.call(john)
{% endcodeblock %}
## 以下代码有什么问题，如何修改
{% codeblock lang:javascript %}
var module= {
  bind: function(){
    $btn.on('click', function(){
      console.log(this) //this指什么
      this.showMsg();
    })
  },

  showMsg: function(){
    console.log('饥人谷');
  }
}
{% endcodeblock %}
## 有如下代码，解释Person、 prototype、__proto__、p、constructor之间的关联。
{% codeblock lang:javascript %}
function Person(name){
    this.name = name;
}
Person.prototype.sayName = function(){
    console.log('My name is :' + this.name);
}
var p = new Person("若愚")
p.sayName();
{% endcodeblock %}
## 上例中，对对象 p可以这样调用 p.toString()。toString是哪里来的? 画出原型图?并解释什么是原型链。

## 对String做扩展，实现如下方式获取字符串中频率最高的字符
{% codeblock lang:javascript %}
var str = 'ahbbccdeddddfg';
var ch = str.getMostOften();
console.log(ch); //d , 因为d 出现了5次
{% endcodeblock %}
## instanceOf有什么作用？内部逻辑是如何实现的？

## 继承有什么作用?

## 下面两种写法有什么区别?
{% codeblock lang:javascript %}
//方法1
function People(name, sex){
    this.name = name;
    this.sex = sex;
    this.printName = function(){
        console.log(this.name);
    }
}
var p1 = new People('饥人谷', 2)

//方法2
function Person(name, sex){
    this.name = name;
    this.sex = sex;
}

Person.prototype.printName = function(){
    console.log(this.name);
}
var p1 = new Person('若愚', 27);
{% endcodeblock %}
## Object.create 有什么作用？兼容性如何？

## hasOwnProperty有什么作用？ 如何使用？

## 如下代码中call的作用是什么?
{% codeblock lang:javascript %}
function Person(name, sex){
    this.name = name;
    this.sex = sex;
}
function Male(name, sex, age){
    Person.call(this, name, sex);    //这里的 call 有什么作用
    this.age = age;
}
{% endcodeblock %}
## 补全代码，实现继承
{% codeblock lang:javascript %}
function Person(name, sex){
    // todo ...
}

Person.prototype.getName = function(){
    // todo ...
};    

function Male(name, sex, age){
   //todo ...
}

//todo ...
Male.prototype.getAge = function(){
    //todo ...
};

var ruoyu = new Male('若愚', '男', 27);
ruoyu.printName();
{% endcodeblock %}
