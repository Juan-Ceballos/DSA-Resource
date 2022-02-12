//: [Previous](@previous)

import Foundation

class Node<Int> {
    var data: Int
    var next: Node<Int>?
    
    init(data: Int, next: Node<Int>? = nil) {
        self.data = data
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) -> " + String(describing: next) + " "
    }
}

let node1 = Node(data: 8)
let node2 = Node(data: 2)
let node3 = Node(data: 5)
let node4 = Node(data: 6)
let node5 = Node(data: 9)
let node6 = Node(data: 11)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
print(node1)

// at least one node
func middleNode(node: Node<Int>) -> Node<Int> {
    if node.next == nil {return node}
    
    var slow = node
    var fast = node
    
    while let endNode = fast.next {
        if endNode.next == nil {return slow}
        fast = endNode.next!
        slow = slow.next!
    }
    
    return slow
}

print(middleNode(node: node1))
