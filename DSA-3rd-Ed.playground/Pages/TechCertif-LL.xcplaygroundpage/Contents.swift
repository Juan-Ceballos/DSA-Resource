// Middle of a Linked List

// Given a singly linked list with head node head, return a middle node of linked list.


// input: 1 -> 2 -> 3 -> 4 -> 5 -> nil
// output: 3 -> 4 -> 5 -> nil

// 1) I would have to find length of list
// 2) grab middle node make it head of new list
// 3) push

import Foundation

public class Node<Value> {
  var value: Value
  var next: Node?

  init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1: Node<Int> = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

//print(node1.value)

public struct LinkedList<Value> {
  var head: Node<Value>?
  var tail: Node<Value>?

  public init() {}

  // head end insertion
  public mutating func push(value: Value) {

    // was doing head.next rather than head for next
    head = Node(value: value, next: head)

    if tail == nil {
      tail = head
    }
  }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "empty list"
        }
        
        return String(describing: head)
    }
}

var list = LinkedList<Int>()
list.push(value: 1)
list.push(value: 2)
list.push(value: 3)
list.push(value: 4)
list.push(value: 5)
list.push(value: 6)

//print(list.head!.value)

func middleNode<T>(list: LinkedList<T>) -> LinkedList<T>  {
    var fast = list.head
    var slow = list.head
    var newList = LinkedList<T>()
    
    while let fastNext = fast?.next {
        fast = fastNext.next
        slow = slow?.next
    }
    
    print("here")
    //print(slow?.value)
    //print(slow?.next?.value)
    
    while let slowNext = slow?.next {
        //print("hello")
        print(slow?.value)
        newList.push(value: slow!.value)
        slow = slowNext
    }
    
    newList.push(value: slow!.value)
//    while let slowList = slow?.next {
//        slow = slow?.next
//        newList.push(value: slowList.value)
//    }
    print(newList.head?.value)
    print(newList.tail?.value)
    print(newList)
    return newList
}

middleNode(list: list)
