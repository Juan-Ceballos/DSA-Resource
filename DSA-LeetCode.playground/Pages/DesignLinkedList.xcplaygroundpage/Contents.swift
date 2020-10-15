//: [Previous](@previous)

import Foundation

class Node<Int> {
    var val: Int
    var next: Node?
    
    init(_ val: Int, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}


class MyLinkedList {

    /** Initialize your data structure here. */
    var head: Node<Int>?
    var tail: Node<Int>?
    
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        
        var tempIndex = 0
        var currentNode = head
        
        if head == nil {
            return -1
        }
        
        while let current = currentNode {
            if tempIndex == index {
                return current.val
            } else {
                tempIndex += 1
                currentNode = current.next
            }
        }
        
        return -1
        
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        
        head = Node(val, next: head)
                if tail == nil {
                    tail = head
                }

    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        // case 1
        // empty
        // -> 1
        
        guard head != nil else {
            head = Node(val)
            tail = head
            return
        }
        
        var node = head
        
        // get to end
        while node?.next != nil {
            node = node?.next
        }
        
        // set next of last to new node
        node?.next = Node(val)
        
        
        //tail = newNode
        // case 2
        // 1 -> 2 -> 3
        // 1 -> 2 ->3 -> 4
        
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        // 1 -> 2 -> 3 ->4
        // 2, 99
        // 1-> 2 -> 99 -> 3 -> 4
        // 5, 100
        // 1 -> 2 -> 99 -> 3 -> 4 -> 100
        
        //***Study node at, prevnode, DeleteAt
        
        let newNode = Node(val)
        var currentNode = head
        var currentIndex = 0
        
        if head == nil {
            head = Node(val, next: head)
        }
        
        while let current = currentNode {
            if currentIndex == index - 1 {
                newNode.next = current.next
                current.next = newNode
                break
            } else if index == 0 {
                addAtHead(val)
                break
            } else {
                currentIndex += 1
                currentNode = current.next
            }
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        var currentIndex = 0
        var currentNode = head
        
        while let current = currentNode {
            if index == 0 {
                head = current.next
                break
            }
            else if currentIndex == index - 1 {
                currentNode?.next = current.next?.next
                break
            }
            
            else {
                currentIndex += 1
                currentNode = current.next
            }
        }
        
        // dlete head, tail, or invalid
        
        
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

extension MyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "empty list"
        }
        return String(describing: head)
    }
}



/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

let obj = MyLinkedList()
obj.addAtIndex(0, 10)
obj.addAtIndex(0, 20)
obj.addAtIndex(1, 30)

print(obj)

func strTest(input: String) {
    
    let tempArr = Array(input)
    print(tempArr)
}

strTest(input: "Hello")
