### 基础部分

- 可以用var，也可以指定类型，默认值为null
``` dart
var myNull; // == null
```

- 函数可选声明返回类型
``` dart
fn(){
    return true;
}
bool fn(){
    return true;
}
```

- 与js的promise类似，有个future的玩意用来干这个异步的事情
``` dart
HttpRequest.request(url)
    .then(value=>{})
    .catchError(error=>{})
```

- async和await
``` dart
fn() async{ // 真诡异，async放在后面，而不是前面
    var request = await HttpRequest.request(url);
    print(request);
}
``` 

- 导入包
``` dart
import 'package:flutter/material.dart';
```