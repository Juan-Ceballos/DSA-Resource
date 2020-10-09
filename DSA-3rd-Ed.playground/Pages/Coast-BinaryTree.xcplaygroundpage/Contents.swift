import Foundation

/*
 Binary Search Trees
 
 - Binary Trees
    - Each node can have at most two children.
    - Children have parents.
 
 - Properties of binary search trees
    - Left child values are less than parent node value.
    - Right child values are greater than or equal to parent node value.
    - The values in a binary search tree must be comparable!!!.!
 
 - Three common methods of a binary search tree:
    - Insert
    - Remove
    - Search / Contains
 
 - Why a binary search tree?
    - All of the above methods can be performed with a runtime of O(log n). This is ideal. We want this.
 
 - Removal / Deletion / Obliteration
    - Three cases:
        - Removal of a leaf node.
        - Removal of a node with one child.
        - Removal of a node with two children.
 
 */

class BinaryNode<T> {
    
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T){
        self.value = value
    }
    
}

extension BinaryNode {
    
    public func inOrderTraversal(_ visit: (BinaryNode) -> ()) {
        leftChild?.inOrderTraversal(visit)
        visit(self)
        rightChild?.inOrderTraversal(visit)
    }
    
    public var minimum: T {
        return leftChild?.minimum ?? self.value
    }
    
}

// Values must be comparable
struct BinarySearchTree<T: Comparable> {
    
    // The root of our tree
    private (set) var root: BinaryNode<T>?
    
    // Not Necessary
    init() {}
    
    // Public function that can be called
    public mutating func insert(_ value: T) {
       root = insert(root, value)
    }
    
    // Helper function for insertion of binary node
    private func insert(_ node: BinaryNode<T>?, _ value: T) -> BinaryNode<T> {
        
        // We reached the destination to place the new node.
        guard let node = node else { return BinaryNode<T>(value) }
        
        // The value we are inserting is less than the value of the node we are currently at.
        if value < node.value {
            node.leftChild = insert(node.leftChild, value)
        } else { // The value we are inserting is greater than or equal to the value of the node we are currently at.
            node.rightChild = insert(node.rightChild, value)
        }
        
        return node
    }
    
    // Runtime is O(n)
    public func contains(_ value: T) -> Bool {
        
        var exists = false // By default the value does not exist.
        
        // Visits all nodes in the tree to see if the value exists.
        root?.inOrderTraversal({ (node) in
            if node.value == value {
                exists = true // Found the value.
            }
        })
        
        return exists
    }
    
    // Runtime is O(log n)
    public func betterContains(_ value: T) -> Bool {
        
        // Start at the beginning
        var currentNode = root
        
        // Continue searching as long as currentNode exists.
        while let node = currentNode {
            
            if node.value == value { // Found the value we are looking for
                return true
            }
            
            // Value we are looking for is less than the current value. Go left.
            if value < node.value {
                currentNode = node.leftChild
            } else { // Value we are looking for is greater than or equal to the current value. Go right.
                currentNode = node.rightChild
            }
            
        }
        // We failed to find the value
        return false
        
    }
    
    public mutating func removeNode(_ value: T) {
        root = removeNode(root, value)
    }
    
    private func removeNode(_ node: BinaryNode<T>?, _ value: T) -> BinaryNode<T>? {
        
        guard let node = node else { return nil }
        
        // We found the node we want to remove
        if node.value == value {
            // Case 1: Removal of a leaf node
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            } else if node.leftChild == nil { // Case 2a: Node has right child
                return node.rightChild
            } else if node.rightChild == nil { // Case 2b:  Node has left child
                return node.leftChild
            } else { // Case 3: Node has two children
                if let right = node.rightChild {
                    node.value = right.minimum
                    node.rightChild = removeNode(node.rightChild, node.value)
                }
            }
        } else if value < node.value { // The value we are searching for is less than the value of the current node.
            node.leftChild = removeNode(node.leftChild, value)
        } else { // The value we are searching for is greater than or equal to the value of the current node.
            node.rightChild = removeNode(node.rightChild, value)
        }
        
        return node
    }
    
}

/*
 
 First call to remove (root, 64)
    - root.value = 12
    - root.rightChild = remove(root.rightChild, 64) => root.rightChild
 Second call to remove (root.rightChild, 64)
    - root.rightChild.value = 14
    - root.rightChild = remove(root.rightChild.rightChild, 64) => root.rightChild.rightChild
 Third call to remove (root.rightChild.rightChild, 64)
    - root.rightChild.rightChild.value = 23
    - root.rightChild.rightChild = remove(493Node, 64) => 493Node
 Fourth call to remove (493Node, 64)
    - 493Node.value = 493
    - 493Node.leftChild = remove(node64, 64) => nil
 Fifth call to remove (Node64, 64)
    - node64.value = 64
    - return nil
    
 */

/* Insertion
                    12
                   /  \
                       14
                      /  \
                          23
                         /  \
                            493
                            /  \
                           64
 */

var uhh = BinarySearchTree<Int>()

uhh.insert(12)
uhh.insert(14)
uhh.insert(23)
uhh.insert(493)
uhh.insert(64)
uhh.insert(503)

uhh.root?.inOrderTraversal({ (node) in
    print(node.value, terminator: " ")
})

