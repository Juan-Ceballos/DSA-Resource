//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int], target: Int) -> Bool {
    
    // divide and conquer for log n runtime
    // has to be sorted, cut out numbers we don't have to look through
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while leftIndex <= rightIndex {
        
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = arr[middleIndex]
        
        print("middle value = \(middleValue), left index = \(leftIndex), right index = \(rightIndex), [\(arr[leftIndex]), \(arr[rightIndex])]")
        
        if middleValue == target {
            return true
        }
        
        if target < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if target > middleValue {
           leftIndex = middleIndex + 1
        }
    }
    
    return false
}

let sortedArr1 = [3, 5, 8, 9, 11, 22, 37]
binarySearch(arr: sortedArr1, target: 37)
