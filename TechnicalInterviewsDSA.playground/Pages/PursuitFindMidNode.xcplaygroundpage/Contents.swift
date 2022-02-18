//: [Previous](@previous)

import Foundation

/*
mid node linked list

questions:
less than 100
no guarantees
all ints
second middle for even list

algo:
*/

class Node<Int> {
  var data: Int
  var next: Node<Int>?

  init(_ data: Int, _ next: Node<Int>? = nil) {
    self.data = data
    self.next = next
  }
}

let node1 = Node(0)
let node2 = Node(1)
let node3 = Node(2)
let node4 = Node(3)

node1.next = node2
node2.next = node3
node3.next = node4
//print(node2.data)

 func midNode(_ node: Node<Int>?) -> Node<Int>? {
   var p1 = node
   var p2 = node

   guard let node = node else {
      return nil
   }

   while let current = p2 {
    p1 = current.next
    p2 = p1.next
   }

   return p1
}

print(midNode(node1)?.data ?? -1)

//----------------------------

func middleNode(_ head: ListNode?) -> ListNode? {
    var count = getCount(head)
    var currentNode = head
    for _ in 0..<(count / 2) {
        currentNode = currentNode?.next
    }
    return currentNode
}
func getCount(_ head: ListNode?) -> Int {
    guard let head = head else { return 0 }
    return 1 + getCount(head.next)
}

// Single-pass solution with two pointers

func middleNode2(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}

/*
## Solution Overview

#### Two Passes

1. Get the count of the Linked List
1. Iterate forward until you are at half that number

#### Two Pointers

1. Create a slow pointer and a fast pointer
1. While the fast pointer's next isn't null, move the slow pointer ahead one node, and the fast pointer ahead by two nodes
1. Return the node the slow pointer is pointing at
*/
