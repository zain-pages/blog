---
title: Lodash常用函数
date: 2018-04-18 00:01:26
tags: 技术博客
---
过了一遍`Lodash`的文档，现将项目中用到的函数和自己觉得很有用的函数分两部分整理如下：

## 项目中用到的函数

#### omit(object, [props])
Object方法，返回忽略属性之外的自身和继承的可枚举属性。
{% codeblock lang:javascript %}
const object = { 'a': 1, 'b': '2', 'c': 3 }

_.omit(object, ['a', 'c'])
// => { 'b': '2' }
{% endcodeblock %}
#### get(object, path, [defaultValue])
Object方法，根据对象路径获取值，如果解析`value`是`undefined`会以`defaultValue`取代。
{% codeblock lang:javascript %}
const object = { 'a': [{ 'b': { 'c': 3 } }] }

_.get(object, 'a[0].b.c');
// => 3

_.get(object, ['a', '0', 'b', 'c'])
// => 3

_.get(object, 'a.b.c', 'default')
// => 'default'
{% endcodeblock %}
#### pick(object, [props])
Object方法，创建一个从 object 中选中的属性的对象。
{% codeblock lang:javascript %}
const object = { 'a': 1, 'b': '2', 'c': 3 }

_.pick(object, ['a', 'c'])
// => { 'a': 1, 'c': 3 }
{% endcodeblock %}
#### noop
Util方法，无论传递什么参数，都返回 undefined。
{% codeblock lang:javascript %}
const object = { 'user': 'fred' }

_.noop(object) === undefined
// => true
{% endcodeblock %}
#### sortBy(collection, [iteratees=[_.identity]])
Collection方法，创建一个元素数组。 以 iteratee 处理的结果升序排序。 这个方法执行稳定排序。 iteratees 会传入1个参数：(value)。
{% codeblock lang:javascript %}
const users = [
  { 'user': 'fred',   'age': 48 },
  { 'user': 'barney', 'age': 36 },
  { 'user': 'fred',   'age': 42 },
  { 'user': 'barney', 'age': 34 }
]


_.sortBy(users, o => o.user)
// => 排序结果 [['barney', 36], ['barney', 34], ['fred', 48], ['fred', 42]]

_.sortBy(users, ['user', 'age'])
// => 排序结果 [['barney', 34], ['barney', 36], ['fred', 42], ['fred', 48]]
// 先按照user升序，再按照age升序

_.sortBy(users, 'user', o => Math.floor(o.age / 10))
// => 排序结果 [['barney', 36], ['barney', 34], ['fred', 48], ['fred', 42]]
// 先按照user排序，再按照Math.floor(o.age / 10)排序，因为稳定排序，所以age顺序不变。
{% endcodeblock %}
#### isArray(value)
Lang方法，检查 value 是否是 Array 类对象。
{% codeblock lang:javascript %}
_.isArray([1, 2, 3])
// => true

_.isArray(document.body.children)
// => false

_.isArray('abc')
// => false

_.isArray(_.noop)
// => false
{% endcodeblock %}
#### without(array, [values])
Array方法，创建一个移除了所有提供的 values 。
{% codeblock lang:javascript %}
_.without([1, 2, 1, 3], 1, 2)
// => [3]
{% endcodeblock %}
#### identity(value)
Util方法，这个方法返回首个提供的参数。
{% codeblock lang:javascript %}
const object = { 'user': 'fred' }

_.identity(object) === object
// => true
{% endcodeblock %}
#### filter(collection, [predicate=_.identity])
Collection方法，遍历集合中的元素，筛选出一个经过 predicate 检查结果为真值的数组，predicate 会传入3个参数：(value, index|key, collection)。
{% codeblock lang:javascript %}
const resolve = _.partial(_.map, _, 'user')
// _.partial: 创建一个函数。 该函数调用 func，并传入预设的参数。 这个方法类似 _.bind，除了它不会绑定 this。 这个 _.partial.placeholder 的值，默认是以 _ 作为附加部分参数的占位符。

const users = [
  { 'user': 'barney', 'age': 36, 'active': true },
  { 'user': 'fred',   'age': 40, 'active': false }
]

resolve( _.filter(users, o => !o.active) )
// => ['fred']

// 使用了 `_.matches` 的回调结果
resolve( _.filter(users, { 'age': 36, 'active': true }) )
// => ['barney']

// 使用了 `_.matchesProperty` 的回调结果
resolve( _.filter(users, ['active', false]) )
// => ['fred']

// 使用了 `_.property` 的回调结果
resolve( _.filter(users, 'active') )
// => ['barney']
{% endcodeblock %}
#### find(collection, [predicate=_.identity])
Collection方法，遍历集合中的元素，返回最先经 predicate 检查为真值的元素，如无匹配，返回undefined。
{% codeblock lang:javascript %}
const users = [
  { 'user': 'barney',  'age': 36, 'active': true },
  { 'user': 'fred',    'age': 40, 'active': false },
  { 'user': 'pebbles', 'age': 1,  'active': true }
]

_.find(users, o => (o.age < 40))
// => 结果: 'barney'

// 使用了 `_.matches` 的回调结果
_.find(users, { 'age': 1, 'active': true })
// => 结果: 'pebbles'

// 使用了 `_.matchesProperty` 的回调结果
_.find(users, ['active', false])
// => 结果: 'fred'

// 使用了 `_.property` 的回调结果
_.find(users, 'active')
// => 结果: 'barney'
{% endcodeblock %}
#### omitBy(object, [predicate=_.identity])
Object方法，返回经 predicate 判断不是真值的属性的自身和继承的可枚举属性。
{% codeblock lang:javascript %}
const object = { 'a': 1, 'b': '2', 'c': 3 }

_.omitBy(object, _.isNumber)
// => { 'b': '2' }
{% endcodeblock %}
#### padStart([string=''], [length=0], [chars=' '])
String方法，如果字符串长度小于 length 则在左侧填充字符。 如果超出长度则截断超出的部分。
{% codeblock lang:javascript %}
_.padStart('abc', 6)
// => '   abc'

_.padStart('abc', 6, '_-')
// => '_-_abc'

_.padStart('abc', 3)
// => 'abc'
{% endcodeblock %}
#### reduce(collection, [iteratee=_.identity], [accumulator])
Collection方法，通过 iteratee 遍历集合中的每个元素。 每次返回的值会作为下一次 iteratee 使用。 如果没有提供 accumulator，则集合中的第一个元素作为 accumulator。 iteratee 会传入4个参数：(accumulator, value, index|key, collection)。

{% codeblock lang:javascript %}
_.reduce([1, 2], (sum, n) => (sum + n), 0);
// => 3

_.reduce({ 'a': 1, 'b': 2, 'c': 1 }, (result, value, key) => {
  (result[value] || (result[value] = [])).push(key);
  return result;
}, {});
// => { '1': ['a', 'c'], '2': ['b'] } (无法保证遍历的顺序)
{% endcodeblock %}
#### isEqual(value, other)
Lang方法，执行深比较来决定两者的值是否相等。
{% codeblock lang:javascript %}
const object = { 'user': 'fred' }
const other = { 'user': 'fred' }

_.isEqual(object, other)
// => true

object === other
// => false
{% endcodeblock %}


## 自己觉得很有用的函数

#### times(n, [iteratee=_.identity])
Util方法，调用 iteratee N 次，每次调用返回的结果存入到数组中。 iteratee 会传入1个参数：(index)。
{% codeblock lang:javascript %}
_.times(3, String)
// => ['0', '1', '2']

 _.times(4, _.constant(true))
// => [true, true, true, true]
// _.constant：创建一个返回 value 的函数
{% endcodeblock %}
#### cloneDeep(value)
Lang方法，深拷贝。
{% codeblock lang:javascript %}
const objects = [{ 'a': 1 }, { 'b': 2 }]

const deep = _.cloneDeep(objects)
console.log(deep[0] === objects[0])
// => false
{% endcodeblock %}
#### random([min=0], [max=1], [floating])
Number方法，产生一个包括 min 与 max 之间的数。 如果只提供一个参数返回一个0到提供数之间的数。 如果 floating 设为 true，或者 min 或 max 是浮点数，结果返回浮点数。
{% codeblock lang:javascript %}
_.random(0, 5)
// =>  0 和 5 之间的数

_.random(5)
// => 同样是 0 和 5 之间的数

_.random(5, true)
// => 0 和 5 之间的浮点数

_.random(1.2, 5.2)
// =>  1.2 和 5.2 之间的浮点数
{% endcodeblock %}
#### sample(collection)
Collection方法，从集合中随机获得元素
{% codeblock lang:javascript %}
_.sample([1, 2, 3, 4]);
// => 2
{% endcodeblock %}
#### reject(collection, [predicate=_.identity])
反向版 _.filter，这个方法返回 predicate 检查为非真值的元素。
{% codeblock lang:javascript %}
const users = [
  { 'user': 'barney', 'age': 36, 'active': false },
  { 'user': 'fred',   'age': 40, 'active': true }
]

_.reject(users, o => !o.active)
// => 结果: ['fred']

// 使用了 `_.matches` 的回调结果
_.reject(users, { 'age': 40, 'active': true })
// => 结果: ['barney']

// 使用了 `_.matchesProperty` 的回调结果
_.reject(users, ['active', false])
// => 结果: ['fred']

// 使用了 `_.property` 的回调结果
_.reject(users, 'active')
// => 结果: ['barney']
{% endcodeblock %}
