### 1. 带静态函数的枚举
``` ts
enum Weekday {
  Monday,
  Tuseday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

namespace Weekday {
  export function isBusinessDay(day: Weekday) {
    switch (day) {
      case Weekday.Saturday:
      case Weekday.Sunday:
        return false;
      default:
        return true;
    }
  }
}

const mon = Weekday.Monday;
const sun = Weekday.Sunday;

console.log(Weekday.isBusinessDay(mon)); // true
console.log(Weekday.isBusinessDay(sun));
```

有点像C#的class定义const字段+一个static函数:
``` CSharp
public class Weekday{
    public const string Monday="Monday";
    // ...
    public const string Saturday="Saturday";
    public const string Sunday="Sunday";

    public static bool isBusinessDay(string day){
        switch (day) {
            case Saturday:
            case Sunday:
                return false;
            default:
                return true;
        }
    }
}
```

### 2. global.d.ts
这是一个特殊文件，修改原始类型以及定义新的全局类型
``` ts
interface Window {
  helloWorld(): void;
}
```

也可以在任意模块文件中定义global:
``` ts
declare global{
    interface Window {
        helloWorld(): void;
    }
}
```

### 3. lib选项能提供精细的控制
```ts
"compilerOptions": {
  "target": "es5",
  "lib": ["es6", "dom"]
}
```
- JavaScript 功能
  - es5
  - es6
  - es2015
  - es7
  - es2016
  - es2017
  - esnext
- 运行环境
  - dom
  - dom.iterable
  - webworker
  - scripthost
- ESNext 功能选项
  - es2015.core
  - es2015.collection
  - es2015.generator
  - es2015.iterable
  - es2015.promise
  - es2015.proxy
  - es2015.reflect
  - es2015.symbol
  - es2015.symbol.wellknown
  - es2016.array.include
  - es2017.object
  - es2017.sharedmemory
  - esnext.asynciterable

### 4.函数
函数与java, C#一样：参数可选、默认值、重载
用interface来定义函数、new关键字调用，没啥用吧，意义何在。。
``` ts
interface ReturnString {
  (): string;
}
declare const foo: ReturnString;

const bar = foo(); // bar 被推断为一个字符串。
```
``` ts
interface CallMeWithNewToGetString {
  new (): string;
}

// 使用
declare const Foo: CallMeWithNewToGetString;
const bar = new Foo(); // bar 被推断为 string 类型
```

### 5.类型兼容
class的类型兼容比较有意思，只比较变量和方法（构造函数、静态变量、方法不检查）：
``` ts
class Animal {
  feet: number;
  constructor(name: string, numFeet: number) {}
}

class Size {
  feet: number;
  constructor(meters: number) {}
}

let a: Animal;
let s: Size;

a = s; // OK
s = a; // OK
```

### 6.never
底层类型，永远不会发生的类型，比如：
当一个函数永远不会返回、一个函数一直throw error时

### 7.索引签名
```ts
type KeyString = { [key: string]: number };

type Index = 'a' | 'b' | 'c';
type FromIndex = { [k in Index]?: number };


```

### 8.infer
这个比较有意思，能从extends中推断类型
```ts
type Func = (user: User) => void;

ParamsType<T> = T extends (param: infer P) => any ? P : T;
// 如果 T 是 (param: P) => any，那么ParamsType 的返回类型就是P，否则为T

type returnType = ParamsType<Func>; // User
```

### 9.高级类型
- Partial<T>
  将属性全部变为可选
- Readonly<T>
  将属性全部变为只读
- Record<U, T>
  指定属性范围，值类型为T
- Pick<T, U>
  提取部分属性
- Required<T>
  属性全部必填
- Exclude<U1, U2>
  排除类型
- Extract<U1, U2>
  提取相同类型
- Omit<T, U>
  排除接口中指定的属性
- NonNullable<U>
  排除null和undefined类型
- Parameters<F>
  提取函数的参数，返回数组类型
- ConstructorParameters<C>
  提取构造函数的参数，返回数组类型
- ReturnType<F>
  提取函数的返回值类型
- InstanceType<C>
  获取构造函数的返回类型
- ThisParameterType<T>
  获取函数中this的数据类型
- OmitThisParameter<F>
  移除函数中的this类型，函数体中不允许使用this
