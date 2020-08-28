- zarm被注释掉的问题
    > 其实并没有注释掉，因为一个原有写法问题：
    > ``` ts
    > const Confirm2 = Confirm as any;
    > const Alert2 = Alert as any;
    > const Modal2 = Modal as any;
    > ```
    > as any导致Confirm没有被打包，所以报错找不到Confirm
    > 另外一个文件中恰好有相同引入并且注释掉zarm的代码，误以为是它。。。

- 原代码如下修改后能运行起来
    - 添加一个mp的入口文件（app.mp.tsx），export一个createApp:
        ``` ts
        // 必须叫createApp，会被挂载到windows下，初始化的时候被使用
        export default function createApp() {
            // mp自动在小程序中仿spa运行（根节点，递归渲染子树）
            const container = document.createElement('div');
            container.id = 'root';
            document.body.appendChild(container);

            render(<App />, container);
        }
        ```
    - 把所有的懒加载代码干掉
        > 一定要全部干掉，留1个会有问题，就是那个react 130错误。。

- 因为把所有的引用都打包进去了，出来的文件略大，insure-ui项目下一个空页面的vendors及default都有900多k（未压缩）。整体打包出来有10多M，图片等素材占主要体积

