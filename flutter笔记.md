### 布局

- Row, Column
> 等同于flex, Row和Column对应flexDirection, Expanded控制子元素的flex值，只不过不能具体到扩充比例
mainAxisAlignment、crossAxisAlignment对应justifyContent、alignItems，控制主轴和
```dart
Row(
    children: <Widget>[
        RaisedButton(
            onPressed: (){

            },
            color: Colors.redAccent,
            child: Text('红色按钮'),
        ),
        Expanded(child: new RaisedButton(
            onPressed: (){

            },
            color: Colors.pinkAccent,
            child: Text('黄色按钮'),
        ))
    ]
)
```

- Stack
> alignMentPositioned组件等同于absolute布局
``` dart
Statck(
    alignment: FractionOffset(0.5, 0.8),
    children: <Widget>[
        new CircleAvatar(
            backgroundImage: NetworkImage(''),
            radius: 100.0,
        ),
        new Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlue,
            ),
            padding: EdgeInsets.all(5.0),
            child: new Text(''),
        ),
        new Positioned(
            top: 10,
            left: 10,
            child: new Text(''),
        )
    ]
)
```
- Card
> 卡片

### 导航

- 前进
```dart
Navigator.push(context, new MaterialPageRoute(
    builder: (context) => new SecondScreen()    // 第二个页面也是一个widget
))
```

