import Foundation

// print nodes of linked list in reverse

class Node<Value> {
    // node has value, and pointer to next node
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
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

// when create instance var list = LinkedList<Int>, so list of nodes hold ints
struct LinkedList<Value> {
    var head: Node<Value>? // node classes need type when declaring instance
    var tail: Node<Value>?
    
    // forgot public init
    public init() {}
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public mutating func push(value: Value) {
        // insert node beginning of list
        // next points to something w/ value and pointer
        // head is now node that has the given value and points to current head
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
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

// 1 -> 2 -> 3
// 3, 2, 1

func reverseList(node: Node<Int>?)  {
    
    guard let node = node else {
        return
    }
    
    reverseList(node: node.next)
    print(node.value)
}

func reverseListPrint(list: LinkedList<Int>) {
    reverseList(node: list.head)
}

var list = LinkedList<Int>()
list.push(value: 1)
list.push(value: 2)
list.push(value: 3)

print(list)
reverseListPrint(list: list)
