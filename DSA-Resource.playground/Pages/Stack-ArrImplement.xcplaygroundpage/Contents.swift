import Foundation

struct Stack<T> {
    var arr = [T]()
    
    mutating func push(input: T) {
        arr.append(input)
    }
    
    mutating func pop() {
        arr.popLast()
    }
}

var myStack = Stack<Int>()
myStack.push(input: 5)
myStack.push(input: 4)
print(myStack)
myStack.pop()
print(myStack)
