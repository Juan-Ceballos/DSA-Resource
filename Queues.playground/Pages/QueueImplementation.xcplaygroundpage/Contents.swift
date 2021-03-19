import UIKit

// Queues, FIFO, abstract data type

struct Queue<T> {
    // implementing a queue using an array
    private var elements = [T]()
    
    public var isEmpty: Bool    {
        return elements.isEmpty
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public var count: Int   {
        return elements.count
    }
    
    // add item to elements
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    // remove item from front of elements array
    public mutating func dequeue() -> T?    {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

var queue = Queue<String>()
queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")

print("\(queue.peek ?? "") is at the front of the line")

queue.dequeue()

print("fellows left in line are \(queue)")

queue.enqueue("Eric")
print("there are \(queue.count) on line")

// iterate through queue structure

var queueCopy = queue

while let value = queueCopy.dequeue()   {
    print("fellow: \(value)")
}

print("there are \(queueCopy.count) fellows left in queueCopy")
