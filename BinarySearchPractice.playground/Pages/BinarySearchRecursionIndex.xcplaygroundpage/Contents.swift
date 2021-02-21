//: [Previous](@previous)

import Foundation

func binarySearchRecursion(arr: [Int], target: Int, leftIndex: Int, rightIndex: Int) -> Int? {
    
    // divide and conquer for log n runtime
    // has to be sorted, cut out numbers we don't have to look through
        
    if leftIndex > rightIndex {
        return nil
    }
    
    else {
        let middleIndex = leftIndex + (rightIndex - leftIndex) / 2
        let middleValue = arr[middleIndex]
        
        if target == middleValue {
            return middleIndex
        }
        
        else if target < middleValue {
            return binarySearchRecursion(arr: arr, target: target, leftIndex: leftIndex, rightIndex: middleIndex - 1)
        }
        
        else {
            return binarySearchRecursion(arr: arr, target: target, leftIndex: middleIndex + 1, rightIndex: rightIndex)
        }
        
    }
}

let sortedArr1 = [3]
binarySearchRecursion(arr: sortedArr1, target: 3, leftIndex: 0, rightIndex: sortedArr1.count - 1)
