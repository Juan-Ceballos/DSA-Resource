//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int]) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low < high {
        let middle = low + (high - low) / 2
        let middleValue = arr[middle]
        
        if middleValue < 0 {
            high = middle - 1
        } else {
            low = middle + 1
        }
        
    }
    
    if low == arr.count - 1 && arr[low] >= 0 {
        return 0
    }
    
    return arr[low] >= 0 ? arr.count - low - 1 : arr.count - low
}
