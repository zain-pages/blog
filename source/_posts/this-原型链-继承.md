---
title: this_原型链_继承
date: 2017-10-19 11:06:50
tags: 技术博客
---
## apply、call 、bind有什么作用，什么区别
三个函数的作用都是 **改变函数执行上下文** ，这句话翻译过来就是 **更改函数中this的指向** ，三个函数只不过是在调用方式上有所不同，具体不同请看以下实例：
{% codeblock lang:javascript%}
var obj1 = {
  name: 'xiaoming',
  age: 18,
  selfIntroduce : function(sex){
    console.log('My name is ' + this.name + ' ,and i am ' + this.age + ' years old.I am a ' + sex + '.');
  }
};
var obj2 = {
  name: 'xiaogang',
  age: 25
}

obj1.selfIntroduce('boy'); //My name is xiaoming ,and i am 18 years old.I am a boy.
obj1.selfIntroduce.bind(obj2)('girl'); //My name is xiaogang ,and i am 25 years old.I am a girl.
obj1.selfIntroduce.call(obj2,'girl'); //My name is xiaogang ,and i am 25 years old.I am a girl.
obj1.selfIntroduce.call(obj2,['girl']); //My name is xiaogang ,and i am 25 years old.I am a girl.
{% endcodeblock %}

从以上代码可以见得，这三个函数分别以不同的方式将此函数的执行上下文更改成了obj2，Function.prototype.bind()方法内参数为执行上下文对象，返回执行上下文为此对象的一个函数；Function.prototype.call()方法第一个参数为执行上下文对象，第二个及以后的参数依次为此函数的参数，并直接依此执行此函数；Function.prototype.apply()方法则与Function.prototype.call()方法类似，只不过最后的参数序列更换为了一个数组。

## 以下代码输出什么?
{% codeblock lang:javascript %}
var john = {
  firstName: "John"
}
function func() {
  alert(this.firstName + ": hi!")
}
john.sayHi = func // a
john.sayHi() //John: hi!
{% endcodeblock %}

在a步骤进行赋值时，实际上john对象内部的sayHi函数执行上下文已经被指定为john对象，所以函数中的this指向john。
## 下面代码输出什么，为什么
{% codeblock lang:javascript %}
func()//[object Window]
function func() {
  alert(this)
}
{% endcodeblock %}

在未被对象包裹的函数被调用时，视为被window对象调用。
## 下面代码输出什么
{% codeblock lang:javascript %}
document.addEventListener('click', function(e){
    console.log(this); //#document
    setTimeout(function(){
        console.log(this);//window
    }, 200);
}, false);
{% endcodeblock %}
setTimeout函数是window对象的方法，在它内部声明的回调函数被window对象调用。
## 下面代码输出什么，why
{% codeblock lang:javascript %}
var john = {
  firstName: "John"
}

function func() {
  alert( this.firstName )
}
func.call(john) //John
{% endcodeblock %}
如题1所述，call方法改变了func函数的执行上下文，将john对象作为func函数的执行上下文运行。
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
{% codeblock lang:javascript %}
var module= {
  bind: function(){
    var self = this;
    $btn.on('click', function(){
//      console.log(this) //this指$btn[0]
      self.showMsg();
    })
  },

  showMsg: function(){
    console.log('饥人谷');
  }
}
{% endcodeblock %}
## 有如下代码，解释Person、 prototype、\_\_proto\_\_、p、constructor之间的关联。
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
![Person原型链](https://static.zain.red/10.19/1.jpg)
## 上例中，对对象 p可以这样调用 p.toString()。toString是哪里来的? 画出原型图?并解释什么是原型链。
p.toString()是从Person对象的原型对象Object对象中来的。
![Person原型链](https://static.zain.red/10.19/2.jpg)
函数的原型对象constructor默认指向函数本身，原型对象除了有原型属性外，为了实现继承，还有一个原型链指针__proto__，该指针指向上一层的原型对象，而上一层的原型对象的结构依然类似，这样利用__proto__一直指向Object的原型对象上，而Object的原型对象用Object.prototype.\_\_proto\_\_ = null表示原型链的最顶端，如此变形成了javascript的原型链继承，同时也解释了为什么所有的javascript对象都具有Object的基本方法。
[水乙：三张图搞懂JavaScript的原型对象与原型链](http://www.cnblogs.com/shuiyi/p/5305435.html)
## 对String做扩展，实现如下方式获取字符串中频率最高的字符
{% codeblock lang:javascript %}
String.prototype.getMostOften = function(){
  var mostNum = 0, currentNum = 0, mostChar = this[0];
  for(var i = 0;i < this.length;i++){
    currentNum = 0;
    for(var j = i;j < this.length;j++){
      if(this[i] === this[j]){
        currentNum++;
        if(currentNum > mostNum){
          mostNum = currentNum;
          mostChar = this[i];
        }
      }
    }
  }
  return mostChar;
}
var str = 'ahbbccdeddddfg';
var ch = str.getMostOften();
console.log(ch); //d , 因为d 出现了5次
{% endcodeblock %}
## instanceOf有什么作用？内部逻辑是如何实现的？
Object.prototype.instanceOf(Constructor)可以判断这个实例对象是否是某个构造函数的后代。
它会去寻找此对象中\_\_proto\_\_属性中constructor属性是否与参数吻合，如果不吻合则寻找下一级\_\_proto\_\_属性中的constructor属性是否吻合，一直寻找到Object构造函数，如果全部没有吻合则返回false，有一个吻合就返回true。
## 继承有什么作用?

1. 可以使对象派生结构清晰。
2. 可以节省重复代码。
3. 如果父级类属性改变，则只需更改父级类，继承的子级类自动得到修改。

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

第一种写法在每次实例化对象时都在实例对象中生成一个单独的printName方法，每一个函数占用一块内存。
第二种写法只需要开辟一块内存存放printName方法即可，其他所有实例对象的原型指向含有这个函数的原型对象，节省内存。

## Object.create 有什么作用？兼容性如何？
Object.create(prototype, descriptors)创建一个具有指定原型且可选择性地包含指定属性的对象。
prototype 必需。  要用作原型的对象。 可以为 null。
descriptors 可选。 包含一个或多个属性描述符的 JavaScript 对象。
“数据属性”是可获取且可设置值的属性。 数据属性描述符包含 value 特性，以及 writable、enumerable 和 configurable 特性。

如果未指定最后三个特性，则它们默认为 false。 只要检索或设置该值，“访问器属性”就会调用用户提供的函数。 访问器属性描述符包含 set 特性和/或 get 特性。
{% codeblock lang:javascript %}
var pt = {
        say : function(){
            console.log('saying!');    
        }
    }

    var o = Object.create(pt);

    console.log('say' in o); // true
    console.log(o.hasOwnProperty('say')); // false
{% endcodeblock %}
Object.create()是ES5语法，仅在支持ES5语法的浏览器上可以实现。
## hasOwnProperty有什么作用？ 如何使用？
hasOwnProperty()用于判断此实例对象是否含有此属性,如上题代码，say是pt的属性，o可以以它的子代身份调用，但是检测发现并非其自带属性。
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
这里的call相当于实现属性的继承。可以将Person的属性全部继承给Male。
## 补全代码，实现继承
{% codeblock lang:javascript %}
function Person(name, sex){
    this.name = name;
    this.sex = sex;
}

Person.prototype.getName = function(){
    console.log(this.name);
};    

function Male(name, sex, age){
   Person.call(this, name, sex);
   this.age = age;
}

function fn(){};
fn.prototype = Person.prototype;
Male.prototype = new fn();
Male.prototype.constructor = Male;
Male.prototype.getAge = function(){
    console.log(this.age);
};

var ruoyu = new Male('若愚', '男', 27);
ruoyu.getName();
{% endcodeblock %}
 
