---
title: Java面向对象
date: 2019-03-18 23:34:58
tags: java
---
本文将以实例和解释相结合的方式描述 Java 面向对象所依赖的几个基本特征。
## 封装
将代码的实现尽量隐藏在方法/类内部，仅仅向外部暴露达成目的必须的接口。

好处：
1. 代码可控，不会因为外部的意外修改而导致运行错误。
2. 代码易于统一修改，没有暴露额外的接口意味着你并不需要在线上状态来修改接口，在线上修改接口往往是成本巨大的。

从封装的角度考虑设计方法和类，应当先考虑设计接口（即函数参量，返回值，类的成员变量和方法等），而后再考虑实现。

学习工作中的例子: [JavaBeans](https://en.wikipedia.org/wiki/JavaBeans)是一种良好的接口封装规范。它主张通过`get`和`set`来控制类成员方法的读写，以及使用无参数构造器等。

```java
public class File {
    private String path;

    public File (String path) {
        this.path = path;
    }

    public String readToString() throws IOException{
        final FileInputStream fileInput = new FileInputStream(path);

        String str = "";
        final InputStreamReader reader = new InputStreamReader(fileInput, "UTF-8");
        final BufferedReader bReader = new BufferedReader(reader);
        String line;
        while((line = bReader.readLine()) != null) {
            str += line + '\n';
        }
        reader.close();
        fileInput.close();
        return str;
    }

    public void writeString(String content) throws IOException {
        final FileOutputStream fileOutput = new FileOutputStream(path);
        final OutputStreamWriter writer = new OutputStreamWriter(fileOutput, "UTF-8");
        final PrintWriter bWriter = new PrintWriter(writer);
        bWriter.write(content);
        writer.close();
        fileOutput.close();
    }
}
```
上述方法实现了一个`File`类，在实例化时读入一个路径，拥有`readToString`方法来将这个路径下的文件转化为字符串，拥有`writeString`方法来将某个字符串写入此文件。
封装的思想体现在此方法将自己的`path`成员变量设为私有的，此时外界无法改变此类的实例对象所指向的路径，所有的方法都只能对实例化时所传入路径的文件进行更改。

## 继承
使用一个子类继承一个父类，往往意味着子类拥有父类所拥有的所有非抽象方法和成员变量，子类需要实现所有父类定义的非抽象方法和成员变量，子类还可以拥有单独属于自己的成员变量和方法，以及 overwrite 父类的方法等。总而言之，子类是父类的一个更加具体的实现。父类这个编程实体的语义是子类的子集。

```java
class Person {
    public String name="xiaomiao";
    public int age=20;

}

class Student extends Person {
    void study() {
        System.out.println("I can study!");
    }
}
```
实例中，`Student`是`Person`的子类，它的实例不仅拥有作为`Person`所需要的`name`成员变量和`age`成员变量，还拥有自己的`study`方法。

## 抽象类和接口
抽象类和接口是一对拥有近似功能的面向对象特征，这段我将分别对抽象类和接口进行描述并举出实例，在最后将二者进行比较。

#### 抽象类
抽象类使用`abstract`修饰符声明，抽象类无法被实例化。
抽象类往往声明很多很多没有实现、只拥有类型的抽象成员变量声明和只有参数定义和返回值定义的方法声明。

```java
public abstract class Animal {
    public abstract void cry();
}
 
public class Cat extends Animal{
 
    @Override
    public void cry() {
        System.out.println("猫叫：喵喵...");
    }
}
```
以上实例中`Animal`类就是一个抽象类，声明了其抽象方法`cry`。`Animal`类无法以`new`关键字被实例化，仅仅能够通过类似`Cat`这样的类继承它来发挥作用。

#### 接口
接口使用`interface`关键字声明。
接口定义一组拥有确定类型的参数和返回值的方法、拥有确定类型的变量的集合。
接口往往在类的定义中以`implements`关键字被类所实现，之后在定义变量类型时作为类型出现，此时变量可以被赋值为任意实现此接口的类。

```java
interface Animal {
   public void eat();
   public void travel();
}

public class MammalInt implements Animal{
 
   public void eat(){
      System.out.println("Mammal eats");
   }
 
   public void travel(){
      System.out.println("Mammal travels");
   } 
 
   public int noOfLegs(){
      return 0;
   }
 
   public static void main(String args[]){
      MammalInt m = new MammalInt();
      m.eat();
      m.travel();
   }
}
```
上面这段代码描述了一个`Animal`接口，其接口所包含的`eat`和`travel`方法在`MammalInt`类中被实现。

#### 接口和抽象类的异同
接口和抽象类都定义了一组成员变量的类型、方法的参数以及返回值类型。抽象类所定义的这些方法和成员变量将在子类中被实现。接口中所定义的这些方法和变量将在实现接口的类中所实现。接口和抽象类都是 _定义和实现相分离_ 理念的写照，有利于我们抽象出更为规整的代码。

接口和抽象类的不同之处主要在于语义。抽象类是类这种程序实体的语义归纳，应当看作其子类本身的高级语义。而接口则描述实现接口类的一些特征，描述实现接口类应该“拥有”哪些内容。按照语义的角度举一个例子：人是动物，人会跑会吃饭。动物是人的抽象类，会跑会吃饭是人的接口。人实现了会跑会吃饭的功能。人继承于动物类。

## 多态

待补充