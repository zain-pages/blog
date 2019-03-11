---
title: Java基础语法
date: 2019-03-12 00:24:41
tags: java
---
本文将以简洁精确的语言描述 Java 语言的基础特性，因为我有过几年的其他语言编程经验，所以本文将不会描述流程控制，变量，运算符等过于基础的内容，着重于描述 Java 区别于其他语言的要点。

## Java语言特性
Java 是纯粹面向对象的语言，其代码书写以类为单位。
Java 是一门强类型的静态语言。
Java 代码需要编译，编译成为字节码后运行于 JVM 虚拟机之上。
因为 Java 虚拟机的存在，Java 具有良好的跨平台特性。

## Java语言细节
Java 大小写敏感。
Java 的源代码文件名要求必须和本文件的类名相同。
所有的 Java 程序由`public static void main(String []args)`方法开始执行。
Java 中的变量分为局部变量、静态变量、成员变量，Java 中没有全局变量之说。
Java 编译器会忽略空行。

## Java 标识符
Java 标识符以大小写字母、`_`、`$`为开头，以大小写字母、`_`、`$`或数字为结尾。

## Java 修饰符
#### 访问控制修饰符
`private`: 仅在同一类内可操作。
`default`: 仅在同一包内可操作。
`protected`: 在同一包内、继承的子类内可操作。
`public`: 对所有类可操作。

#### 其他修饰符
`final`: 常量声明，_变量或类本身_ 不可以被改变。
`abstract`: 抽象类声明，不能够被继承。
`static`: 静态成员声明，类本身而不是类实例的成员或方法。

## Java 枚举
Java 可以利用形如下文的代码实现枚举：
```java
    class FreshJuice {
        enum FreshJuiceSize{ SMALL, MEDIUM , LARGE }
        FreshJuiceSize size;
    }
```

## Java 接口
Java 可以利用形如下文的代码实现接口：
```java
interface Animal {
   public void eat();
   public void travel();
}
```

## 内置类型
Java 中有八大内置数据类型，分别为`byte`、`short`、`int`、`long`、`float`、`double`、`boolean`、`char`。
非内置数据类型的数据都是`引用数据类型`。

## Java 作用域
这里仅仅特意提一下，Java 的局部变量所属作用域为`块级作用域`。

