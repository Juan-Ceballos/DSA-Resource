//: [Previous](@previous)

import Foundation

private struct Queue<T> {
    var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    mutating public func enqueue(element: T) {
        elements.append(element)
    }
    
    mutating public func dequeue() -> T? {
        guard !isEmpty else {return nil}
        return elements.removeFirst()
    }
    
    public var front: T? {
        return elements.first
    }
    
}


