//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int], target: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        let middleValue = arr[middle]
        
        if middleValue == target {
            return middle
        } else if middleValue < target {
            high = middle - 1
        } else {
            low = middle + 1
        }
        
    }
    
    return -9999
}
