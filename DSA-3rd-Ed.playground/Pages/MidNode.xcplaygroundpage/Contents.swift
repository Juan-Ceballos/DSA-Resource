//: [Previous](@previous)

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    public init(value: T) {
        self.value = value
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

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

func middleNode<T>(node: Node<T>)  {
    var slow = node
    var fast = node
    
    // iteration up here
    while let endNode = fast.next, let midNode = slow.next {
        fast = endNode.next! // setting temp var to wher iteration is at or node after that
        slow = midNode
    }
    print(slow)
}

middleNode(node: node1)
