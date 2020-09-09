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
    print(curr)
    while curr != nil {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
        print()
    }
    
    return prev
}

print(listReverse(list: list)!)

// ==========================
// challenge 4

// merge list
// takes 2 sorted linked list, merges into single sorted linked list.
// return new linked list sorted nodes

// input 2 linked list, make generice comparable for function
func mergeSortLinkedList<Value: Comparable>(left: LinkedList<Value>, right: LinkedList<Value>) -> LinkedList<Value> {
    // 1 -> 2 -> 9
    // 4 -> 5 -> 6
    
    // 1 -> 2 3 4 5 6
    
    // if one is empty return the other list
    guard !left.isEmpty() else {
        return right
    }
    
    guard !right.isEmpty() else {
        return left
    }
    
    // have head node
    var newHead: Node<Value>?
    
    // tail node
    var tail: Node<Value>?
    
    // head of each list before iterating
    var currentLeft = left.head
    var currentRight = right.head
    
    // determine head tail from both list to assign, newHead, and tail
    if let leftNode = currentLeft, let rightNode = currentRight {
        // head = lower from left or right
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        
        tail = newHead
    }
    
    // compare and add after tail assigned in previous if let
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        
        tail = tail?.next
    }
    
    // add remaining nodes
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    // take newHead added to list to return and iterate all values from that node attached to
    // it up to tail to add for list
    var list = LinkedList<Value>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    return list
    
    // What I was trying to do
    //var input1Temp = input1
    //var input2Temp = input2
    //var newList = LinkedList<Value>()
    
    //    guard let input1Nodes = input1Temp.head else {
    //        return input2Temp
    //    }
    //
    //    guard let input2Nodes = input2Temp.head else {
    //        return input1Temp
    //    }
    //
    //
    //    if input1Nodes.value <= input2Nodes.value {
    //        newList.push(value: input1Nodes.value)
    //    } else {
    //        newList.push(value: input2Nodes.value)
    //    }
}

var list1 = LinkedList<Int>()
var list2 = LinkedList<Int>()

list2.push(value: 4)
list2.push(value: 5)
list2.push(value: 6)

mergeSortLinkedList(left: list1, right: list2)

// ===================================================
// challenge 5
// remove all occurences of given element
// 1 -> 3 -> 3 -> 4
// remove 3
// 1 -> 4

func removeAll<Value: Comparable>(input: Value, listInput: LinkedList<Value>) -> LinkedList<Value>    {
    
    // traverse list from head to tail
    // remove reference when value matches input in node
    
    var list = listInput

    // if head is the input
    while let head = list.head, head.value == input {
        list.head = list.head?.next
    }
    
    var prev = list.head
    var current = list.head?.next
    
    while let currentNode = current {
        guard currentNode.value != input else {
            prev?.next = currentNode.next
            current = prev?.next
            continue
        }
        prev = current
        current = current?.next
        list.tail = prev
    }
    
    var curr = list.head
    var next = curr?.next
    
    // what I tried doing
//    while curr != nil {
//        if next?.value == input {
//            curr?.next = next?.next
//            next = curr?.next
//        } else {
//            curr = curr?.next
//        }
//    }
    
    return list
}

var listCh5 = LinkedList<Int>()
listCh5.push(value: 1)
listCh5.push(value: 2)
listCh5.push(value: 3)
listCh5.push(value: 4)
listCh5.push(value: 5)

print(listCh5)

removeAll(input: 3, listInput: listCh5)

print(listCh5)
