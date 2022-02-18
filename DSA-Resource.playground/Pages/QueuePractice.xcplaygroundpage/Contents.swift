//: [Previous](@previous)

import Foundation

class Queue<Int> {
    var list = [Int]()
    
    func enqueue(data: Int) {
        list.append(data)
    }
    
    func dequeue() -> Int? {
        if list.isEmpty {return nil}
        return list.removeFirst()
    }
}

let q1 = Queue<Int>()
q1.enqueue(data: 3)
q1.enqueue(data: 4)
q1.dequeue()
q1.dequeue()
q1.dequeue()
print(q1.list)
//---------------------------------------------------
class Node<Int> {
    var data: Int
    var next: Node<Int>?
    
    init(data: Int, next: Node<Int>? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<Int> {
    var head: Node<Int>?
    var tail: Node<Int>?
    
    init(head: Node<Int>? = nil, tail: Node<Int>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    func push(data: Int) {
        head = Node(data: data, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    func append(data: Int) {
        guard !isEmpty else {
            push(data: data)
            return
        }
        
        tail!.next = Node(data: data)
        tail = tail!.next
    }
    
    func remove() -> Int? {
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.data
    }
    
}

class QueueLinked<Int> {
    var list = LinkedList<Int>()
    
    init() {}
    
    public var peek: Int? {
        list.head?.data
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public func enqueue(data: Int) {
        list.append(data: data)
    }
    
    public func dequeue() -> Int? {
        list.remove()
    }
    
}

var qLinked = QueueLinked<Int>()
qLinked.enqueue(data: 0)
qLinked.enqueue(data: 1)
qLinked.enqueue(data: 2)
print(qLinked.dequeue()) // rerurns current head
