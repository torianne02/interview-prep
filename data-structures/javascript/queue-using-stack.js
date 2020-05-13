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

class Queue {
  constructor() {
    this.first = [];
    this.last = [];
  }

  enqueue(value) {
    const length = this.first.length;
    for (let i = 0; i < length; i++) {
      this.last.push(this.first.pop());
    }
    this.last.push(value);
    return this;
  }

  dequeue() {
    const length = this.last.length;
    for (let i = 0; i < length; i++) {
      this.first.push(this.last.pop());
    }
    this.first.pop();
    return this;
  }

  peek() {
    if (this.last.length > 0) {
      return this.last[0];
    }
    return this.first[this.first.length - 1];
  }
}

const myQueue = new Queue();
myQueue.enqueue('Joy');
myQueue.enqueue('Matt');
myQueue.enqueue('Pavel');
myQueue.peek();
myQueue.dequeue();
// myQueue.dequeue();
// myQueue.dequeue();
console.log(myQueue.peek());