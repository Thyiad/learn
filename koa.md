## koa

### koa2-cors
> 用来阻止跨域攻击

### koa-bodyparser
> 把koa2上下文的formData数据解析到ctx.request.body中

### koa-router
> koa的路由中间件
``` javascript
var router = new Router();
router.get("/getList", (ctx, next=>{
// ctx.router available
}))
app.use(router.routes()).use(router.allowedMethods())
```