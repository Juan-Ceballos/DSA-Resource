//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int], target: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        
        let middleValue = arr[middle]
        
        if target == middleValue {
            return middle
        } else if target < middleValue {
            high = middle - 1
        } else if target > middleValue {
            low = middle + 1
        }
    }
    
    return -9999
}

let sortedList = [0, 1, 2, 3, 4, 5]
print(binarySearch(arr: sortedList, target: 2))
