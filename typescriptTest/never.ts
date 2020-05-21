interface Square {
    kind: 'square';
    size: number;
  }
  
  interface Rectangle {
    kind: 'rectangle';
    width: number;
    height: number;
  }
  
  // 有人仅仅是添加了 `Circle` 类型
  // 我们可能希望 TypeScript 能在任何被需要的地方抛出错误
  interface Circle {
    kind: 'circle';
    radius: number;
  }
  
  type Shape = Square | Rectangle | Circle;

  function area(s: Shape) {
    if (s.kind === 'square') {
      return s.size * s.size;
    } else if (s.kind === 'rectangle') {
      return s.width * s.height;
    }
    //  else if(s.kind === 'circle'){
    //     return s.radius * s.radius;
    // }else {
    //   // Error: 'Circle' 不能被赋值给 'never'
    //   const _exhaustiveCheck: never = s;
    //   return s;
    // }
  }

  console.log(area({kind: 'xxx', radius: 5}))
    
  type FieldState = {
    value: string;
  };
  
  type FormState = { isValid: boolean } & { [fieldName: string]: FieldState };

  // 联合类型可以使用，但不能赋值
  
  