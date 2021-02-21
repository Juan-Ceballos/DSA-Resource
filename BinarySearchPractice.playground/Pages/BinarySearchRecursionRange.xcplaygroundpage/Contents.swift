//: [Previous](@previous)

import Foundation

// -> Int? for index, Bool for is in array
// need the range parameter since the recursion needs a smaller part of the array to set the new middle index, iteratively the change to left and right index would be made in while loop and new middle index is calculated
func binarySearchRecursion(arr: [Int], target: Int, range: Range<Int>) -> Int? {
    
    // divide and conquer for log n runtime
    // has to be sorted, cut out numbers we don't have to look through
        
    if range.lowerBound > range.upperBound {
        return nil
    }
    
    else {
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        let middleValue = arr[middleIndex]
        
        if target == middleValue {
            return middleIndex
        }
        
        else if target < middleValue {
            return binarySearchRecursion(arr: arr, target: target, range: range.lowerBound ..< middleIndex)
        }
        
        else {
            return binarySearchRecursion(arr: arr, target: target, range: (middleIndex + 1) ..< range.upperBound)
        }
        
    }
}

let sortedArr1 = [3, 5]
binarySearchRecursion(arr: sortedArr1, target: 5, range: (0 ..< sortedArr1.count - 1))
