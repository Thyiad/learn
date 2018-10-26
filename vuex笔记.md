# vuex笔记

### 1. store的声明：
``` js 
const store = new Vuex.Store({
	state: {
		count: 0,
	},
	mutations: {
		increment (state){
			state.count++;
		}
	}
})
```
	
### 2. 注入子组件
```js
const app = new Vue({
	el: '#app',
	sotre,
	components: {Counter},
	template: '',
})
```
	
### 3. 子组件通过 this.$store访问全局的store
``` js
computed:{
	count(){
		return this.$Store.state.count
	}
}
```
	
### 4. mapState
``` js
computed: mapstate({
	count: state => state.count,
	countAlias: 'count',
	// 常规函数，this才有效
	localThis (state) {
		return state.count+this.localCount,
	}
})
```

*  如果名称相同
mapState(['count', 'other'])
	
### 5. 对象展开符
``` js
computed: {
    localComputed (){
	
	},
	...mapState({
		// ...
	})
}
```
	
### 6. getter：store中派生出的状态
``` js
const store = new Vuex.Store({
	state: {
		todos: [
			{id:1, text: 'xxx', done: true}
		]
	},
	getters: {
		doneTodos: state=>{
			return state.todos.filter(todo=>todo.done)
		}
	}
})
```
* 通过store.getters获取
``this.$sotre.getters.doneTodos``
	
### 7. getter可以接受其他getter作为第二个参数：
``` js
doneTodosCount: (state, getters)=>{
	return getters.doneTodos.length
}
```
	
### 8. getter可以定义为函数
``` js
getTodoByID: (state, getters)=>(id)=>{
	return state.todos.find(todo=>todo.id===id);
}
```

* store.getters.getTodoById(2)

### 9. mapGetters
``` js
computed:{
	...mapGetters([
	'getter1','getter2','getter3'
	])
}
```
* 换名字就使用对象
``` js
mapGetters({
	doneCount: 'doneTodosCount'
})
```
	
### 10. mutations
* 通过调用mutation改变数据，类似于react的action
``` js
const store = new Vuex.Store({
	state:{
		count: 1
	},
	mutations:{
		increment(state){
			state.count++
		}
	}
})
```

* 通过commit触发
``store.commit('increment')``

*  传递额外参数
``store.commit('increment', 10)``
``` js
store.commit('increment',{
	count: 10
})
```

* 对象风格，类似于react的action
``` js
store.commit({
	type: 'increment',
	amount: 10
})
```

* 使用常量定义
``` js
mutations: {
	[SOME_MUTATION] (state){

	}
}
```


### 11. mutation遵守vue的响应规则
``` js
Vue.set(obj, 'newProp', 123)
state.obj={...state.obj, newProp: 123}
```

### 12. mapMutations
将store的函数映射到当前组件
``` js
methods: {
	...mapMutations([
		'increment',
		'increment2''
	]),
	...mapMutations({
		add: 'increment',	// 将this.add映射为this.$store.commit
	})
}
```

### 13. Action
action函数接受一个与store实例相同方法和属性的context对象
``` js
const store = new Vuex.Store({
	mutations:{
		increment(state){
			state.count++;
		}
	},
	actions: {
		increment(context){	// 也可以({commit, dispatch,state})，把context解构
			context.commit('increment')
		}
	}
})
```

### 14. Mutation和Action
* Mutation是同步的，直接修改state
* Action是允许异步的，通过调用mutation，间接修改state
* 视图层通过dispatch调用action，action通过commit调用Mutation，mutation直接修改state
* 类似react的reducer，mutaion是最终修改数据的地方，action同action
* react中通过一个redux的中间件支持异步action，vue的action就是设计成异步的，同步的直接使用mutation就可以了，个人感觉
* view action reducer, view action mutation

### 15. Module
可以像react拆分reducer那样拆分store
``` js
const moduleA={state:{},getters:{},mutations:{},actions:{}}
const moduleB={state:{},getters:{},mutations:{},actions:{}}

const store = new Vuex.Store({
	modules:{
		a: moduleA,
		b: moduleB,
	}
})

store.state.a
store.state.b

// 疑问，state通过命名调用，getter、mutation和action呢？是直接通过commit, dispatch调用吗？
// 看起来应该是直接调用：store.getters.xxx
```
### 16. Module 命名空间
使用namespaced进行标记：
``` js
const account={
	namespaced: true,
	state: {},
	getters: {
		isAdmin(state, getters, rootState, rootGetters){}		// store.getters['account/isAdmin']
	}
	mutations:{},,
	actions:{},
	// 嵌套的模块会继承命名空间
	modules:{}
}
```
* 带命名空间的绑定函数
``mapState('namespace', {}),``
``mapActions('namespace/childSpace', ['xxx'])``












	
	
	
	
	
	
	
	