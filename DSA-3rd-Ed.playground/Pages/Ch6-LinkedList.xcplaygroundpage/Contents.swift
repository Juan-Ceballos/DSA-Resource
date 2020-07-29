//: [Previous](@previous)

import Foundation

// Node
public class Node<Value> {
    public var value: Value
    // pointer to the next node that has a value and pointer
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
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

// creating a linked list
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

// Implementing nodes like this can become tedious as list grows
// Implement a LinkedList to manage Node objects

// Linked-List
public struct LinkedList<Value> {
    public var head: Node<Value>? // first
    public var tail: Node<Value>? // last
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // front of the list, head first insertion
    public mutating func push(value: Value) {
        // Node with value, and setting it's pointer to current head
        // this makes it the new head
        head = Node(value: value, next: head)
        
        // if no tail, tail is also the head
        if tail == nil {
            tail = head
        }
    }
    
    // end of the list, tail first insertion
    public mutating func append(value: Value)   {
        
        // if empty just push to create head/tail
        guard !isEmpty else {
            push(value: value)
            return
        }
        
        // if not empty
        // new node after the tail node
        tail!.next = Node(value: value)
        // your new node is also the tail of the list
        tail = tail!.next
    }
    
    // first find the node where you want to insert your value
    // node(at:) will try to retrive node at given index
    // iterative traversal since start from head
    public mutating func node(at index: Int) -> Node<Value>? {
        // create and keep reference to the head
        var currentNode = head
        // keep track of current number of traversals
        var currentIndex = 0
        
        // using a while loop traverse until desired index
        // if not there get nil
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // once you find index, insert new node
    // @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func insert(value: Value, after node: Node<Value>) -> Node<Value> {
        
        // if desired after tail, tail end insertion so append
        guard tail !== node else {
            append(value: value)
            return tail!
        }
        
        // linke up node with rest of list and return new node
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // returns value removed from list, optional if empty
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            
            // by moving the head down a node, you remove first node of list
            // once method is done, ARC removes node from list
            head = head?.next
            // incase removing empties list set tail to nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // remove from last have tail but have to know node before tail
    // so have to do a traversal from head
    @discardableResult
    public mutating func removeLast() -> Value? {
        // if head is nil there's nothing to remove so return nil
        guard let head = head else {
            return nil
        }
        
        // if only has one node, as in head.next is nil, basically pop
        guard head.next != nil else {
            return pop()
        }
        
        // keep going until current node.next is nil which signifies tail
        // keep track of prev
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        // since current is the last disconnect it from prev.next ref
        // update tail reference
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
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
// push values backwards to show adding to front
list.push(value: 3)
list.push(value: 2)
list.push(value: 1)

print(list)

// added next value shows adding at end
list.append(value: 4)

print(list)

print("Before inserting: \(list)")
var middleNode = list.node(at: 1)!
for _ in 1...4 {
    middleNode = list.insert(value: -1, after: middleNode)
}
  print("After inserting: \(list)")


print("Before popping list: \(list)")
let poppedValue = list.pop()
print("After popping list: \(list)")
print("Popped value: " + String(describing: poppedValue))


// O(n) since have to traverse whole list to get to tail
print("Before removing last node: \(list)")
let removedValue = list.removeLast()
print("After removing last node: \(list)")
print("Removed value: " + String(describing: removedValue))


print("Before removing at particular index: \(list)")
let index = 1

// need node before one you want to remove beforehand
let node = list.node(at: index - 1)!

let removedValueAt = list.remove(after: node) // so after node before it
print("After removing at index \(index): \(list)")
print("Removed value: " + String(describing: removedValueAt))
print(list.tail?.value)
