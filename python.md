### 基础

- 命令行接收输入：input
``` python
name = input()
```

- 命令行使用'''输入多行
``` python
print('''line1
...line2
...line3''')    # ...是命令行的提示符，不是代码的一部分
```

- 数据类型
> 证书、浮点数、字符串、布尔值：True, False、空值：None
> 字节(bytes)：x = b'abc

- 变量
> 不需要声明类型，直接 a = 1
> 动态语言，解释型语言
> 常量习惯用全部大写定义

- 除法
> / 永远返回浮点数
> // 永远只取整
> % 取余

- 字符串
> ord() 获取字符的整数表示
> chr() 把编码转换为对应的字符
> len() 取得字符串长度
> int() 把字符串转换为整数
> % 格式化
``` python
'hello, %s' % 'world'
'$s, you have' % ('Michael', 100000)d
```

- 数组：list
> 使用负数来取得倒数第几个元素
``` python
nums = [1,2,3]
list[-1]    # 倒数第一个, -2, -3
nums.append(4)
nums.insert(1, 1);
nums.pop()  # 可以指定删除元素的位置
```

- 元祖：tuple
``` python
# 其实就是不可变的数组
nums = (1,2,3) # 括号
```

- 条件判断
```python
if <condition1>:
    <code1>
elif <condition2>:
    <code2>
elif <condition3>:
    <code3>
else:
    <code4>
```

- 循环
> for in
> while

```python
range(5)    # 从0-4
range(1,100)    # 从1到99
list(range(5))  #把range转换为list
```

- dict
> 其实就是对象
``` python
d = {'a': 123, 'b': 321, 'c': 100}
d['a']
‘a’ in d    # d是否包含指定key
d['a']  # 取值：如果key不存在会报错
d['a'] = 1  # 赋值
d.get("a", -1)  # 如果key不存在，返回None或指定的值
d.pop('a')  # 删除key
```
- set
> 不重复的数组
``` python
s = set([1,2,3])
s.add(6)
s.remove(6)
s1 & s2 # 两个set取交集
s1 | s2 # 两个set取并集
```

### 函数

- 内置函数
https://docs.python.org/3/library/functions.html

- 定义函数
```python
def my_fn(x):
    if(x>0)
        return x
    else
        return -x

# 空函数，pass占位符，让代码能运行起来
def nop():
    pass    

# 也可以用在其他语句中，让代码块中有内容，否则会报语法错误
if age>=18:
    pass
    
# 返回多个值
return nx, ny

# 接收多个值
x,y = fn();

# 其实就是返回tuple，只不过在函数中更方便，可以省略括号
# 没有return语句时，默认return None
```

- 默认参数
```python
def add(a=[]):
    a.append('end')
    return a;

add()   # ['end']
add()   # ['end', 'end']
# 默认参数需要指向不可变对象，否则会发生这种情况
# js中不会，C#中则不允许这样定义
```

- 可变参数
```python
def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum+n
    return sum

calc(1,2,3)
nums = [1,2,3]
calc(*nums) # 可以用*把list或tuple传进去

# 其实就是C#的params
```

- 关键字参数
``` python
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)
    if 'city' in kw:
        pass

person('bob', 36, city='beijing', gender='m')

# 自动组装为一个dict
# 其实也就是变相传入object参数
```

- 命名关键字参数
``` python
def person(name,age,*,city,job) # *是一个特殊分隔符
def person(name, age, *args, city='beijing', job) #如果有可变参数，就不需要加*了。命名关键字参数同样也可以有缺省值

person('name', 66, city='beijing', job='boss')   # 命名关键字参数必须传入参数名，否则会报错
```

- 递归
``` python
# 尾递归优化，函数返回的时候调用自身本身，不能是表达式，否则会栈溢出
def fact(n):
    if n==1:
        return 1
    return n*fact(n-1)
def fact(n):
    return fact_iter(n,1)

# 上面 fact(1000) 时会报栈溢出的错误

def fact(n):
    return fact_iter(num, product)
def fact_iter(num, num2):
    if(num==1):
        return num2
    return fact_iter(num-1, num*num2)
```

### 高级特性

- 切片
list, tuple, string 均可切片
``` python
# 其实就是其他语言的slice函数，但这个更牛逼
arr = [1,2,3,4,5,6]
arr[0:3]    # 按索引取0到3，不包含3
arr[:3]     # 0可省略
arr[-1]     # 取得倒数第一个
arr[-2:]    # 等同于[-2:0]，取得最后两个
arr[-2:-1]  # 取得倒数第2个，不包含-1（倒数第一个）
arr[:10:2]  # 前10，每2个取1个
arr[:]      # 复制一个list
```

- 迭代
``` python
from collections import Iterable    # 通过 Iterable 判断是否可迭代
isinstance([1,2,3], Iterable)   

d = {'a':1, 'b':2}  # dict默认迭代的是key, 迭代value需要用 value in d.values()
for key in d:
    print(key)

for i, value in enumerate(['a', 'b', 'c']): # 通过enumerate 把list变成索引-元素对
    print(i, value)
```

- 列表生成式
```python
list(range(1,11))   # 生成[1,2,3,4,5,6,7,8,9,10]
[x * x for x in range(1, 11)]   # 生成[1x1, 2x2, 3x3, ..., 10x10]
[m + n for m in "ABC" for n in "XYZ"]   # 2层循环
```

- 生成器
其实就是yield generator
``` python
# 直接把列表生成式的[]改成()，就创建了一个generator
arr = (x * x for x in range(10))

# 
def fib(max):
    n, a, b = 0, 0, 1
    while n<max:
        yield b
        a, b = b, a+b
        n=n+1
    return 'done'

# 生成器可以通过next()来获取下一个值，直到抛出StopIteration错误
# 还可以通过for in 获取，这样更方便，generator同时也是一个可迭代对象
```

- 迭代器
可以被next函数调用并不断返回下一个值的对象称为迭代器：Iterator
``` python
# 生成器都是Iterator对象，但list、dict、str虽然是Iterable，却不是Iterator
isinstance((x for x in range(10)), Iterator)    # True
isinstance([], Iterator)    # False

# 可以用iter把Iterable变成Iterator
isinstance(iter([1,2,3]), Iterator) # True
```

### 函数
函数名也是变量，可以被修改为其他的值，比如：
```python
abs(-1) # abs是系统内置的函数
abs = 1 # abs就变成了1，而不再是一个函数
```

- map
``` python
map(fn, array)  # 第一个参数为回调函数，第二个参数为数组
map(str, [1,2,3])   # 能作为函数使用的
```

- reduce
```python
# 接收两个参数，数组中从前往后
from functools import reduce
def fn(x, y):
    return x * 10 + y

reduce(fn, [1, 3, 5, 7, 9]) # 13579
```

- filter

- sorted
``` python
L = ['bob', 'about', 'Zoo', 'Credit']
sorted(L)

sorted(L, key=str.lower)    # 比较小写

def fn(item):               # 定义函数，返回小写
    return str.lower(item)
```

- 闭包
函数能返回函数，与js一样，存在闭包
```python
def count():
    fs = []
    for i in range(1, 4):
        def f():
             return i*i
        fs.append(f)
    return fs

f1, f2, f3 = count()    # 9, 9, 9 而不是1, 4, 9
```

- 拉姆达表达式
与 js, C# 相比，多了一个lambda前缀
```python
lambda x: x * x # lambda 参数: 逻辑, 多参数用逗号隔开，反而不需要括号(js, c#需要)，有括号会报错
# 等同于
def f(x):
    return x * x
```

- 装饰器 decorator
```python
import functools

def log(func):
    @functools.wraps(func)
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper

@log('execute')
def now():
    print('2015-3-25')

now()
execute now():
2015-3-25
```

- 偏函数
``` python
import functools
int2 = functools.partial(int, base=2)

int2('12345')
# 等同于
int('12345', base=2)
```

### 模块
建立一个文件夹，必须有 \_\_init\_\_.py，可以是空文件，也可以是一个模块的代码
``` python
thyiad
├─ __init__.py
├─ abc.py
└─ xyz.py

import thyiad.abc
from thyiad import abc
abc.xxx()
```

与es5一样，并没有私有变量，默认下划线开头的变量和函数不期望被外部访问

模块搜索路径：
```python
import sys
sys.path.append('/users/thyiad/my_scripts')

# 要么设置环境变量PYTHONPATH
```

### 