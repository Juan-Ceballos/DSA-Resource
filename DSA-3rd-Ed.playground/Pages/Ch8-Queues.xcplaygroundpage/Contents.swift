import Foundation

// Queue protoco for different implementations, will conform
public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}

// Nodes, and DoublyLinkedList
public class Node<T> {
    private var val: T
    private var next: Node?
    private var prev: Node?
    
    public init(val: T) {
        self.val = val
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        
        return "\(val) -> " + String(describing: next) + " "
    }
}

public struct DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {
        
    }
    
    private var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func enqueue(val: T) {
        let newNode = Node(val: val)
        
        if isEmpty {
            head = newNode
            
        } else {
            
        }
    }
}

// Array Based Implementation
public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: Element? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}

// Doubly Linke List Implementation
public class QueueLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    public init() {}
}


//--------------------------------TEST---------------------------------------------
var queue = QueueArray<String>()
queue.enqueue("Juan")
queue.enqueue("Gerson")
queue.enqueue("Yesnier")
queue
queue.dequeue()
queue
queue.peek

