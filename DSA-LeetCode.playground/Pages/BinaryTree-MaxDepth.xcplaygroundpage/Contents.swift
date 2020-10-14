//: [Previous](@previous)
import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 

func maxDepth(_ root: TreeNode?) -> Int {
        
        if root == nil {
                return 0
            } else {
                return 1 + max(maxDepth(root!.left), maxDepth(root!.right))
            }
}
        
        /*
        maxDepth(3)
        if root == nil return 0: No, else
        return 1 + max(maxDepth(left = 9), maxDepth(right = 20))
        maxDepth(9) compare to maxDepth(20)
        maxDepth(9)
        if root == nil return 0: No, else
        return 1 + max(maxDepth(nil), maxDepth(nil))
        maxDepth(nil) compare to maxDepth(nil)
        if root == nil return 0: Yes
        return 0 for right
        compare 0 to 0 for left
        MaxDepth(9) = 0 compare to MaxDepth(right = 20)
        maxDepth(20)
        if root == nil return 0: No, else
        return  1 + max(maxDepth(left = 15), maxDepth(right = 7))
        0 compare to 0
        return 1 + 1 + 1 + 0 = 3
        */
