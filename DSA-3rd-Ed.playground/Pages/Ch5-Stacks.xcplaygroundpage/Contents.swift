import UIKit

// reverse an array stacks

// Question 1
struct Stack<T> {
    var arr: [T] = [T]()
    
    // mutating, can change properties within it's own instance methods
    // using mutating lets you do so when and write back to struct
    // structs are value types that allows for mutating
    mutating func push(value: T)    {
        arr.append(value)
    }
    
    mutating func pop() -> T?    {
        return arr.popLast()
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
}

let input = [0, 1, 2, 3]

func reverseArray(arr: [Int]) -> [Int] {
    var tempStack = Stack(arr: arr)
    var reversedArr = [Int]()
    
    if tempStack.isEmpty()  {
        return []
    }
    else    {
        while !tempStack.isEmpty()  {
            reversedArr.append(tempStack.pop()!)
        }
        return reversedArr
    }
    
}

reverseArray(arr: input)

//=======================================================

// Question 2, Balance the parentheses
/*
Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:
 1
h((e))llo(world)() // balanced parentheses
 2
(hello world // unbalanced parentheses
*/

func balanceBrackets(str: String) -> Bool  {
    
    //()
    
    var tempStack = Stack(arr: [Character]())
    
    for char in str {
        if char == "("  {
            tempStack.push(value: char)
        }
        else if char == ")" {
            if tempStack.isEmpty()  {
                // no open bracket to pop when str still has closed left
                return false
            }
            else {tempStack.pop()}
        }
    }
    
    if tempStack.isEmpty()  {
        return true
    }
    else    {
        return false
    }
    
}

balanceBrackets(str: "(((")
balanceBrackets(str: "()()()")
balanceBrackets(str: "")
