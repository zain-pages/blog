---
title: 八大排序三大查找JavaScript实现之一：冒泡排序，简单选择排序，插入排序
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
function bubble_sort (array) {
  var temp;
  for (var i = 0;i < array.length;i++) {
    for (var j = 0;j < array.length - 1 - i;j++) {
      if (array[j] > array[j+1]) {
        temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
}

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
bubble_sort(arr);
console.log(arr); //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
{% endcodeblock %}
### 改进冒泡排序
{% codeblock lang:javascript %}
function bubble_sort (array) {
  var temp,flag = true; //引入flag
  for (var i = 0;i < array.length && flag;i++) {    //判断条件加上flag
    flag = false;
    for (var j = 0;j < array.length - 1 - i;j++) {
      if (array[j] > array[j+1]) {
        flag = true; //如果排序有错误，证明还有可能没有完全排序成功
        temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
}

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
bubble_sort(arr);
console.log(arr); //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
{% endcodeblock %}
为什么在这种情况下说冒泡排序算法被改进了?因为“某一次循环时所有的元素位置都正确”等价于“排序完成”。

## 简单选择排序

### 空间复杂度 时间复杂度 稳定性
* 时间复杂度：O(n^2)
* 空间复杂度：O(1)
* 稳定性：不稳定

### 算法描述
每次都找到当次最大的数，按大小顺序依次放入数组相应位置。

### 简单选择排序算法实现
{% codeblock lang:javascript %}
function selection_sort (array) {
  for (var i = 0 ; i < array.length - 1 ; i++) {
      var min = i,temp;
      for (var j = i + 1; j < array.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    if (min !== i) {
      temp = array[i];
      array[i] = array[min];
      array[min] = temp;
    }
  }
}

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
selection_sort(arr);
console.log(arr); //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
{% endcodeblock %}

## 插入排序

### 空间复杂度 时间复杂度 稳定性
* 时间复杂度：O(n^2)
* 空间复杂度：O(1)
* 稳定性：稳定

### 算法描述
通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入（直接插入排序）。或对于未排序数据，在已排序序列中以二分查找法扫描，找到相应位置并插入（二分插入排序）。

### 直接插入排序算法实现
{% codeblock lang:javascript %}
function insertion_sort (array) {
  var temp;
  for (var i = 1; i < array.length; i++) {
    temp = array[i];
    for (var j = i; j > 0 && array[j-1] > temp; j--) {
        array[j] = array[j-1];
    }
    array[j] = temp;
  }
}

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
insertion_sort(arr);
console.log(arr); //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
{% endcodeblock %}

### 二分查找插入排序
{% codeblock lang:javascript %}
function insertion_sort (array) {  
  for (var i = 0;i < array.length;i++) {  
    var start = 0, end = i - 1, middle = 0, temp = array[i];
    while (start <= end) {  
      middle = Math.floor((start + end) / 2);  
      if (array[middle] > temp) {  
        end = middle - 1;
      } else {  
        start = middle + 1;
      }  
    }  
    for (var j = i - 1; j > end; j--) {  
       array[j + 1] = array[j];  
    }
    array[end + 1] = temp;  
  }
}  

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
insertion_sort(arr);
console.log(arr); //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
{% endcodeblock %}
