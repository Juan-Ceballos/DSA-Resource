//: [Previous](@previous)

import Foundation

func binarySearchLeftIterative(arr: [Int], value: Int) -> Int {
    // low variable for index of first element
    var low = 0
    // high variable for last index
    var high = arr.count - 1
    
    // while have not exhausted array
    while low <= high {
        // calculate the middle index in the array
        let mid = low + (high - low) / 2
        // if current middle value is greater or equal to value we're inserting
        // move to lower half of array since we're looking to find the element in array that is greater to insert this at its left
        // moved left if less than or equal to middle
        if arr[mid] >= value {
            high = mid - 1
            
        // value is greater than current middle move up
        } else {
            // low is only changed when greater than middle
            low = mid + 1
        }
    }
    // return low right before element
    return low
}

func binarySearchRightIterative(arr: [Int], value: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        // value is less than current middle keep moving down
        // moved left if less than middle
        if arr[mid] > value {
            high = mid - 1
        // value is greater than or equal move up
        } else {
            // moved up if greater than or equal to middle value
            low = mid + 1
        }
    }
    // return low right after element
    return low
}

let sortedArr1 = [3, 5, 5, 5, 7, 8]
binarySearchLeftIterative(arr: sortedArr1, value: 4)
binarySearchRightIterative(arr: sortedArr1, value: 9)
binarySearchLeftIterative(arr: sortedArr1, value: 9)

