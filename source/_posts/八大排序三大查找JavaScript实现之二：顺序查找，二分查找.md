---
title: 八大排序三大查找JavaScript实现之二：线性查找，二分查找
date: 2017-12-11 18:09:37
tags: 技术博客
---
> 这是我“八大排序三大查找JavaScript实现”系列文章的第二篇，转载请注明来源。  
>所有排序算法针对顺序存储结构，以升序方式排列；三大查找算法不涉及动态查找（查找树与平衡查找树等）的知识。
>文章算法仅供参考复习数据结构与算法之用，实际工程推荐使用使用Array.prototype.sort()函数和Array.prototype.indexOf()函数

## 线性查找
### 时间复杂度
* 时间复杂度：O(n)

### 算法描述
从第一个记录开始，逐个比较记录的关键字，直到和给定的K值相等，则查找成功；若比较结果与文件中n个记录的关键字都不等，则查找失败。

### 算法实现
{% codeblock lang:javascript %}
function linear_search (keyword, array) {
  for (var i = 0;i < array.length;i++) {
    if (array[i] === keyword) {
      return i;
    }
  }
  return -1;
}

arr = [6, 5, 7, 2, 4, 3, 0, 9, 1, 8];
var result = linear_search(3, arr);
console.log(result); //5
{% endcodeblock %}

## 二分查找
### 时间复杂度
* 时间复杂度：O(logn)

### 算法描述
对于升序序列查找所要查找的元素时,首先与序列中间的元素进行比较,如果大于这个元素,就在当前序列的后半部分继续查找,如果小于这个元素,就在当前序列的前半部分继续查找,直到找到相同的元素,或者所查找的序列范围为空为止。（降序亦然）

### 递归实现
{% codeblock lang:javascript %}
function bisect_search (keyword, array, left, right) {
  var start = left || 0, end = right || array.length - 1;
  var mid = Math.floor((end - start) / 2) + start;  
  if (array[mid] === keyword) {  
      return mid;  
  }  
  if (start >= end) {  
      return -1;  
  } else if (keyword > array[mid]) {  
      return bisect_search(keyword, array, mid + 1, end);  
  } else if (keyword < array[mid]) {  
      return bisect_search(keyword, array, start, mid - 1);  
  }  
  return -1;  
}

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var result = bisect_search(3, arr);
console.log(result); //3
{% endcodeblock %}

### 非递归实现
{% codeblock lang:javascript %}
function bisect_search (keyword, array) {
  var mid = array.length / 2;  
  if (keyword == array[mid]) {  
      return mid;  
  }  
  var start = 0;  
  var end = array.length - 1;  
  while (start <= end) {  
    mid = Math.floor((end - start) / 2) + start;  
    if (keyword < array[mid]) {  
        end = mid - 1;  
    } else if (keyword > array[mid]) {  
        start = mid + 1;  
    } else {  
        return mid;  
    }  
  }  
  return -1;
}

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var result = bisect_search(3, arr);
console.log(result); //3
{% endcodeblock %}
