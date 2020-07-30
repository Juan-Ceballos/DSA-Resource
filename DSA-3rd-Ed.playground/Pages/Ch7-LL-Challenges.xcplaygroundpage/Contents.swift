import Foundation

// print nodes of linked list in reverse
//================== Implement Linked List ================
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
    
    public mutating func reverse()  {
        // where does the tail go, how does list hold it?
        print(tail?.value)
        print(tail?.next?.value)
        tail = head
        print(tail?.value)
        print(tail?.next?.value)
        var prev = head
        var current = head?.next
        print(current?.value)
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
            print(head?.value)
        }
        
        head = prev
        print(head?.value)
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

//=============================================

// 1 -> 2 -> 3
// 3, 2, 1

// ch1
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

//========================================================
// ch 2
func middleNode<Value>(list: LinkedList<Value>) -> Node<Value>?  {
    var slow = list.head
    var fast = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

// ===================================================
// ch 3

// reverse a linked list
// implemented as linked list function
print("original list \n\(list)")
list.reverse()
print("list reversed \n\(list)")

func listReverse<Value>(list: LinkedList<Value>) -> Node<Value>? {
    var curr = list.head
    var prev: Node<Value>?
    var next: Node<Value>?
    
    while curr != nil {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
        print()
    }
    
    return prev
}

print(listReverse(list: list))
