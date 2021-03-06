//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int], target: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let middleIndex = low + (high - low) / 2
        let middleValue = arr[middleIndex]
        
        if target == middleValue {
            return middleIndex
        } else if target < middleValue {
            high = middleIndex - 1
        } else if target > middleValue {
            low = middleIndex + 1
        }
    }
    
    return -9999
}

binarySearch(arr: [2], target: 2)
