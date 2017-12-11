---
title: 八大排序三大查找JavaScript实现之一：冒泡排序，选择排序，直接插入排序
date: 2017-12-11 15:15:35
tags: 技术博客
---
> 这是我“八大排序三大查找JavaScript实现”系列文章的第一篇，转载请注明来源。  
>所有排序算法针对顺序存储结构，以升序方式排列；三大查找算法不涉及动态查找（查找树与平衡查找树等）的知识。
>文章算法仅供参考复习数据结构与算法之用，实际工程推荐使用使用Array.prototype.sort()函数和Array.prototype.indexOf()函数

## 冒泡排序
### 空间复杂度 时间复杂度 稳定性
* 时间复杂度：O(n^2)
* 空间复杂度：O(1)
* 稳定性：稳定

### 算法描述
依次比较两个元素，如果他们的顺序错误就把他们交换过来。重复地进行走访数列的工作直到没有元素再需要交换。
### 算法实现
{% codeblock lang:javascript %}
{% endcodeblock %}
### 改进冒泡排序
{% codeblock lang:javascript %}
{% endcodeblock %}

## 简单选择排序

### 空间复杂度 时间复杂度 稳定性
* 时间复杂度：O(n^2)
* 空间复杂度：O(1)
* 稳定性：不稳定

### 算法描述
每次都找到当次最大的数，按大小顺序依次放入数组相应位置。

### 简单选择排序算法实现
{% codeblock lang:javascript %}
{% endcodeblock %}

## 插入排序

### 空间复杂度 时间复杂度 稳定性
* 时间复杂度：O(n^2)
* 空间复杂度：O(1)
* 稳定性：稳定

### 算法描述
通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。

### 直接插入排序算法实现
{% codeblock lang:javascript %}
{% endcodeblock %}

### 二分查找插入排序
{% codeblock lang:javascript %}
{% endcodeblock %}
