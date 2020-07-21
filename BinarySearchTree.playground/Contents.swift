import UIKit

class TreeNode  {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}

extension TreeNode  {
    func insert(_ newValue: Int)   {
        if newValue < value {
            if left != nil  {
                left?.insert(newValue)
            }
            else    {
                left = TreeNode(newValue)
            }
        }
        else    {
            if right != nil   {
                right!.insert(newValue)
            }
            else    {
                right = TreeNode(newValue)
            }
        }
    }
    
    func contains(_ targetValue: Int) -> Bool {
        if targetValue == value {
            return true
        }
        
        if targetValue < value  {
            if left != nil  {
                return left!.contains(targetValue)
            }
            else    {
                return false
            }
        }
        else    {
            if right != nil {
                return right!.contains(targetValue)
            }
            else    {
                return false
            }
        }
    }
    
    func inOrderTraversal() {
        left?.inOrderTraversal()
        print("\(value)", terminator: " ")
        right?.inOrderTraversal()
        
    }
    
    func delete(_ root: TreeNode?, _ targetValue: Int) -> TreeNode?  {
        guard let _ = root  else    {
            return nil
        }
        
        var root = root
        
        if targetValue < root!.value    {
            root?.left = delete(root?.left, targetValue)
        }   else if targetValue > root!.value   {
            root?.right = delete(root?.right, targetValue)
        }   else    {
            if root?.right == nil && root?.left == nil  {
                root = nil
                return root
            }
            else if root?.left == nil   {
                root = root?.right
            }   else if root?.right == nil   {
                root = root?.left
            }
            
            else    {
                let tempNode = minimum(root?.right)
                root?.value = tempNode!.value
                root?.right = delete(root?.right, tempNode!.value)
            }
        }
        
        return root
    }
    
    // helper function to find the minimum value of binary search tree
    func minimum(_ root: TreeNode?) -> TreeNode?  {
        var currentNode = root
        while let next = currentNode?.left  {
            currentNode = next
        }
        return currentNode
    }
}

/*
  12
 5 32
 */

// 5, 12, 32 in order
let rootNode = TreeNode(12)
rootNode.insert(5)
rootNode.insert(32)
rootNode.insert(3)
rootNode.insert(11)
rootNode.insert(15)
rootNode.insert(13)
rootNode.insert(21)
rootNode.insert(40)
rootNode.insert(50)
rootNode.insert(35)
rootNode.insert(65)

// if using in order traversal print order of the elements
// is guaranteed ascending
rootNode.inOrderTraversal()

rootNode.contains(5)
rootNode.contains(-5)
print()
rootNode.delete(rootNode, 32)
rootNode.inOrderTraversal()
