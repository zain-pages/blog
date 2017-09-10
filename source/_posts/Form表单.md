---
title: Form表单
date: 2017-09-10 12:31:36
tags: 技术博客
---
## form表单有什么作用？有哪些常用的input 标签，分别有什么作用？
### form表单的作用

传送用户填写的数据到服务器

### 常用的input 标签

<table> <tr> <td>input标签type属性</td> <td>作用</td> </tr> <tr> <td>text</td> <td>文本输入框</td> </tr> <tr> <td>password</td> <td>密码输入框</td> </tr> <tr> <td>radio</td> <td>单选输入框</td> </tr> <tr> <td>checkbox</td> <td>多选输入框</td> </tr> <tr> <td>submit</td> <td>提交按钮</td> </tr> <tr> <td>button</td> <td>按钮</td> </tr> <tr> <td>hidden</td> <td>隐藏数据</td> </tr> </table>

## post 和 get 方式的区别？

* GET提交，请求的数据会附在URL之后(就是把数据放置在HTTP协议头中)，以?分割URL和传输数据，多个参数用&连接。如果数据是英文字母数字，原样发送，如果是空格，转换为+，如果是中文其他字符，则直接把字符串用BASE64加密，得出如： %E4%BD%A0%E5%A5%BD，其中%XX中的XX为该符号以16进制表示的ASCII。
* POST提交：把提交的数据放置在是HTTP包的包体中。

因此，GET提交的数据会在地址栏中显示出来，而POST提交，地址栏不会改变。

传输数据的大小：首先声明：HTTP协议没有对传输的数据大小进行限制，HTTP协议规范也没有对URL长度进行限制。

而在实际开发中存在的限制主要有：

GET:特定浏览器和服务器对URL长度有限制，例如IE对URL长度的限制是2083字节(2K+35。对于其他浏览器，如Netscape、FireFox等，理论上没有长度限制，其限制取决于操作系统的支持。

因此对于GET提交时，传输数据就会受到URL长度的限制。

POST:由于不是通过URL传值，理论上数据不受限。但实际各个WEB服务器会规定对post提交数据大小进行限制，Apache、IIS6都有各自的配置。

## 在input里，name 有什么作用？

作为可与服务器交互数据的HTML元素的服务器端的标示，在某些特殊标签如radio里可作为分组依据。

## radio 如何 分组?

通过标签中的name属性进行分组。

## placeholder 属性有什么作用?

可以在文本输入框内显示默认的提示字符。

## type=hidden隐藏域有什么作用? 举例说明

1. 隐藏数据一起发送给服务器。
2. 作为Localstrange的替代品。
3. 当有多个submit按钮时，可以用于确认是哪个按钮提交的表单。
4. 可以用于联系多个表单。
5. 作为全局变量使用。
6. 作为父窗口的隐藏域，对小窗口传参。

## 作业

<form action="#"> <table> <tr> <td>姓名：</td> <td><input type="text" placeholder="请输入姓名"></td> </tr> <tr> <td>密码：</td> <td><input type="password" placeholder="请输入密码"></td> </tr> <tr> <td>性别：</td> <td><input type="radio" name="sex" value="male">男<input type="radio" name="sex" value="female">女</td> </tr> <tr> <td>取向：</td> <td><input type="radio" name="like" value="male">男<input type="radio" name="like" value="female">女</td> </tr> <tr> <td>爱好：</td> <td><input name="favorite" type="checkbox" value="dota">Dota<input name="favorite" type="checkbox" value="旅游">旅游<input name="favorite" type="checkbox" value="宠物">宠物</td> </tr> <tr> <td>评论：</td> <td><textarea name="comment" id="comment" cols="30" rows="10"></textarea></td> </tr> <tr> <td>我的car：</td> <td><select name="mycar" id="mycar"> <option value="奔驰">奔驰</option> <option value="宝马">宝马</option> </select><input type="submit" value="提交"></td> </tr> </table> </form>

*本文章著作权由Zainking与饥人谷所有，转载请著明出处*