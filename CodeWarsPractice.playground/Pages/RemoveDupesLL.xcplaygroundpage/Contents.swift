//: [Previous](@previous)

import Foundation

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
}

func removeDuplicates(head:Node?) -> Node? {
  if head == nil || head?.next == nil {
    return head
  }
  
  var temp = head!.next
  var prev = head
  
  while let current = temp {
    if current.data == prev?.data {
      prev?.next = current.next
      temp?.next = nil
      temp = prev?.next
    } else {
        temp = current.next
        prev = current
    }
  }
  return head
}
