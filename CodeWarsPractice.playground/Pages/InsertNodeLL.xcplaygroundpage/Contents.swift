//: [Previous](@previous)

import Foundation

// other submission, using recursion
enum InsertNthError: Error {
  case outOfRange
}

func insertNth(_ head: Node?, _ index: Int, _ data: Int) throws -> Node? {
  if index == 0 {
    let node = Node(data)
    node.next = head
    return node
  }
  
  guard let node = head else { throw InsertNthError.outOfRange }
  node.next = try insertNth(node.next, index - 1, data)
  return node
}

class OutOfBoundsError : Error {
}

func insertNth2(_ head: Node?, _ index: Int, _ data: Int) throws -> Node? {
  guard index > 0 else {
    return push(head, data)
  }
  guard let head = head else { throw OutOfBoundsError() }
  let tail = try insertNth2(head.next, index - 1, data)
  return push(tail, head.data)
}


// no recursion
enum LinkedListError : Error {
    case invalidIndex
}

func insertNth3(_ head: Node?, _ index: Int, _ data: Int) throws -> Node? {
  let newNode = Node(data)
  if index == 0 {
    newNode.next = head
    return newNode
  }
  var current = head
  for _ in 1...index-1 {
    current = current?.next
  }
  if current != nil {
    newNode.next = current!.next
    current!.next = newNode
    return head
  }
  throw LinkedListError.invalidIndex
}
