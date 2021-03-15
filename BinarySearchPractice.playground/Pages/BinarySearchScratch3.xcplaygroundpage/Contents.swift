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
        } else if middleValue > target {
            high = middle - 1
        } else if middleValue < target {
            low = middle + 1
        }
    }
    
    return -9999
}

let sortedList = [0, 1, 2, 3, 4, 5]
print(binarySearch(arr: sortedList, target: 2))

