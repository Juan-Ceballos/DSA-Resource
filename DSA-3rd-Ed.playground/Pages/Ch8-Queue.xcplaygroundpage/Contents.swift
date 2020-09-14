import Foundation

// Queue - Array =============================================================================

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {
        get
    }
    var peek: Element? {
        get
    }
}

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil: array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("ray")
queue.enqueue("brian")
queue.enqueue("eric")
queue
queue.dequeue()
queue
queue.peek

// Queue - Doubly Linked List =================================================================


class DLNode<T>    { // Conform to equatable
    var next: DLNode?
    weak var prev: DLNode?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T>  {
    private (set) var head: DLNode<T>?
    private (set) var tail: DLNode<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: DLNode<T>? {
        return head
    }
    
    public var last: DLNode<T>? {
        return tail
    }
    
    func append(_ value: T)   {
        let newNode = DLNode(value)
        
        // empty list
        guard let lastNode = tail else  {
            head = newNode
            tail = newNode
            return
        }
        
        // no longer empty list
        lastNode.next = newNode
        newNode.prev = lastNode
        tail = newNode
    }
    
    func printForward() {
        var currentNode = head
        while let node = currentNode    {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
    
    func printReverse() {
        var currentNode = tail
        while let node = currentNode    {
            print(node.value, terminator: " -> ")
            currentNode = node.prev
        }
        print("nil")
    }
    
    func nodeAt(index: Int) -> DLNode<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 {return node}
                i -= 1
                node = node?.next
            }
        }
        
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    // remove param?
    public func remove(node: DLNode<T>?) -> T? {
        // if node remove is head
        // 1 - 2 - 3 - 4
        // 2 prev goes to nil
        // 1 next goes to nil
        
        
        // if node remove is mid
        
        // if node remove is tail
        
        // node doesn't exist
        return head!.value
    }
    
    // TODO - Add node to the front
    
    // TODO - Delete Head
    
    // TODO - Delete Tail
    
    
    
    // TODO - Insert value after node
    
    // TODO - Delete node at index
    
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

let numDLL = DoublyLinkedList<Int>()
numDLL.append(0)
numDLL.append(1)
numDLL.append(2)
numDLL.append(3)

print(numDLL)
numDLL.printForward()
numDLL.printReverse()

//==================================================================
//public class QueueLinkedList<T>: Queue {
//    private var list = DoublyLinkedList<T>()
//
//    public init() {}
//
//    public func enqueue(_ element: T) -> Bool {
//        list.append(element)
//        return true
//    }
//
//    public func dequeue() -> T? {
//        guard !list.isEmpty, let element = list.first else {
//            return nil
//        }
//
//        return list.remove(element)
//    }
//
//    public var peek: T? {
//        list.first
//    }
//
//    public var isEmpty: Bool {
//        list.isEmpty
//    }
//}
