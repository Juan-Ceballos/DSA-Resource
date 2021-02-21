//: [Previous](@previous)

import Foundation

func binarySearchIterativeRange(arr: [Int], target: Int) -> Int {
    
    let range = 0 ..< arr.count - 1
    
    var right = range.upperBound
    var left = range.lowerBound
    
    while right >= left {
       
        let middleIndex = left + (right - left) / 2
        let middleValue = arr[middleIndex]
        
        if target == middleValue {
            return middleIndex
        }
        
        else if target < middleValue {
            right = middleIndex - 1
        }
        
        else if target > middleValue {
            left = middleIndex + 1
        }
    }
    
    return -9999
    
}

let sortedArr1 = [3]
binarySearchIterativeRange(arr: sortedArr1, target: 3)
