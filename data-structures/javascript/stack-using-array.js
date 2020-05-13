// array implementation
class Stack {
  constructor() {
    this.list = []
  }

  peek() {
    return this.list[this.list.length - 1];
  }

  push(value) {
    this.list.push(value)
    return this;
  }

  pop() {
    this.list.pop();  
    return this;
  }
}

const myStack = new Stack();
myStack.push('Google');
myStack.peek();
myStack.push('Udemy');
myStack.push('DEV');
myStack.pop();
console.log(myStack);