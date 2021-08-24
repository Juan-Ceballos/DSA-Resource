//: [Previous](@previous)

import Foundation

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
}

/*
Questions:
Null, Empty

In/Out:
3 -> 2 -> 1 = 1, 2, 3

Algo:
Method1
Iterate through Input Linked List
for each node, Sorted Insert function into a new list
return said list


*/

func insertSort(head: Node?) -> Node? {
  
  if head == nil {
    return head
  }
  
  if head?.next == nil {
    return head
    // also deep copy here
  }
  
  var temp = head
  var result: Node? = nil
  
  while let current = temp {
    result = sortedInsert(result, current.data)
    // insert sort with shallow copy
    /*
    result = nil
    result = 1 -> 2 -> 3 -> nil
    */
    temp = temp?.next
  }
  
  return result

}

