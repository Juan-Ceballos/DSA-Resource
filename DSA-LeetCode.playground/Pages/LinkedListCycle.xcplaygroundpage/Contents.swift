//: [Previous](@previous)

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


//func hasCycleHash(_ head: ListNode?) -> Bool {
//
//    let frequencyDictionary = [ListNode:Int]()
//    print(frequencyDictionary)
//
//    return true
//}

func hasCycleTwoPointers(_ head: ListNode?) -> Bool {
    
    guard let currentNode = head, let nodeAfterCurrent = head?.next else {
        return false
    }
    
    var slowPointer = head
    var fastPointer = head?.next
    
    while let loopNode = slowPointer {
        if slowPointer === fastPointer {
            return true
        } else {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
    }
    
    return false
}


print(true)
