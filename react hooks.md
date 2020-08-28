# react hooks

### 1.useState
state hook
```javascript
const [count, setCount] = useState(0);
```

### 2.useEffect
effect hook
```javascript
useEffect(()=>{
    // do some thing
}, [])
// 默认每次render后都会执行, 不会阻塞浏览器绘制
// 返回值会在执行前，先执行一遍，一般设置为一个函数，作为销毁操作
// 第二个参数设置为[]，等同于didMount，只会执行一遍
// 第二个参数设置为其他state值，则只会在其他state值变更时才执行
```

### 3.useContext
context hook
```javascript
const colors = {
    white: 'white',
    black: 'black',
}
const ColorContext = React.createContext(colors.white);
function App(){
    return (
        <ColorContext.Provider value={colors.black}>
            <Body />
        </ColorContext.Provider>
    )
}
function Body(){
    const color = useContext(ColorContext);
    return <div>{color}</div>
}
// 旧的class写法
class Body extends React.Component{
    static contextType = ColorContext;

    render(){
        return <div>{this.context}</div>
    }
}
```

### 4.useReducer
reducer hook
```javascript
function initFunc(initState){
    return {...initState};
}
function reducer(state, action){
    switch(action.type){
        case 'reset':
        return initFunc(action.payload);
    }
}
const [state, dispatch] = useReducer(reducer, initState, initFunc);
// 第三个参数可选
```

### 5.useCallback
callback hook
```javascript
const cacheFun = useCallback(fn, deps); // 缓存函数
```

### 6.useMemo
useMemo hook
```javascript
const cacheValue = useMemo(fn, deps);   // 缓存值
```

### 7.useRef
useRef hook
```javascript
function MyInput(){
    const inputRef = useRef(null);
    return <input ref={inputRef} />
    // 通过inputRef.current来访问dom引用
}
```

### 8.useImperativeHandle
useImperativeHandle hook
```javascript
// forward：转发ref到子元素内部
// 通过ref.current来访问
const ForwardInput = React.forwardRef((props, ref)=>{
    return <input ref={ref} />
})
const ref = React.createRef(null);
<ForwardInput ref={ref}/>

// useImperativeHandle包裹一个ref返回
// 需要配合fowardRef使用，父层ref的值是这个包裹后的对象，同样通过ref.current访问
function FancyInput(props, ref){
    const inputRef = useRef(null);
    useImperativeHandle(ref, ()=>({
        focus: ()=>{
            inputRef.current.focus();
        }
    }))
    return <input ref={inputRef} />
}
FancyInput = React.forwardRef(FancyInput);
```

### 9.useLayoutEffect
useLayoutEffect hook
```javascript
useLayoutEffect(()=>{
    // do something
}, [])
// 使用方式与useEffect一样，dom变更之后会调用，但useLayoutEffect会阻塞浏览器绘制
```

### 10.useDebugValue
useDebugValue hook
```javascript
const useTest = ()=>{
    const [num, setNum] = useState(0);
    useDebugValue('测试');
    return {num, setNum}
}

function HookComp(){
    const {num, setNum} = useTest();
    // 开发者工具中，这个组件会显示<Unknown></Unknown>，右侧的Hooks一栏中会显示用到的hook，Test: "测试"

    return <div>{num}</div>
}
```