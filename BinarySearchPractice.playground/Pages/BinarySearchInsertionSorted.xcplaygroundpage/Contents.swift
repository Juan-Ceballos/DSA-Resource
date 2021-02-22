//: [Previous](@previous)

import Foundation

func binarySearchLeftIterative(arr: [Int], value: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        
        if arr[mid] >= value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return low
}

func binarySearchRightIterative(arr: [Int], value: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        
        if arr[mid] > value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return low
}

let sortedArr1 = [3, 5, 5, 5, 7, 8]
binarySearchLeftIterative(arr: sortedArr1, value: 4)
binarySearchRightIterative(arr: sortedArr1, value: 9)
binarySearchLeftIterative(arr: sortedArr1, value: 9)

