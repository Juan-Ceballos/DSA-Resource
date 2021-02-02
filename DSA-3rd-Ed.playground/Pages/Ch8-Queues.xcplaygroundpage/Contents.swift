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
    var val: T
    var next: Node?
    weak var prev: Node?
    
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
    private (set) var head: Node<T>?
    private (set) var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public mutating func enqueue(val: T) {
        let newNode = Node(val: val)
        
        guard let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        lastNode.next = newNode
        newNode.prev = lastNode
        tail = newNode
    }
    
    public mutating func remove(node: Node<T>?) -> T? {
        let prev = node?.prev
        let next = node?.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        if next == nil {
            tail = prev
        }
        node?.prev = nil
        node?.next = nil
        
        return node?.val
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: list)
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
    
    public var peek: T? {
        list.first?.val
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public func enqueue(_ element: T) -> Bool {
        list.enqueue(val: element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        
        return list.remove(node: element)
    }
}

var listQueue = QueueLinkedList<String>()
listQueue.enqueue("Jordan")
listQueue.enqueue("Jeff")
listQueue.enqueue("Joseph")
listQueue
print(listQueue)
listQueue.dequeue()
print(listQueue)
print(listQueue.peek)

//--------------------------------TEST---------------------------------------------
var queue = QueueArray<String>()
queue.enqueue("Juan")
queue.enqueue("Gerson")
queue.enqueue("Yesnier")
queue
queue.dequeue()
queue
queue.peek

public class RingBuffer<T> {
    public var array: [T?]
    public var readIndex = 0
    public var writeIndex = 0
    
    init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    public var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
    
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    public var first: T? {
        return array[readIndex]
    }
    
    public func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    public func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
}

public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
    
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}

var queueRB = QueueRingBuffer<String>(count: 10)
queueRB.enqueue("Ray")
queueRB.enqueue("Brian")
queueRB.enqueue("Eric")
queueRB
queueRB.dequeue()
queueRB
queueRB.peek
