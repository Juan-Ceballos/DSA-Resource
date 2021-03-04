//: [Previous](@previous)

import Foundation

func binarySearch(arr: [Int], target: Int) -> Int {
    
    // set up low and high variables
    
    var low = 0
    var high = arr.count - 1
    
    // while loop for searching array using middle index
    // approching target as we key into one element
    // <= to make sure it executes last value before exiting
    while low <= high {
        // set up middle
        let middle = low + (high - low) / 2
        let currentMidValue = arr[middle]
        // compare target to middle move left or right
        if currentMidValue == target {
            return middle
        } else if currentMidValue > target {
            high = middle - 1
        } else if currentMidValue < target {
            low = middle + 1
        }
    }
    
    // this mean doesn't exist in array, went through all searches
    return -999
}

binarySearch(arr: [1, 2, 3, 4, 5, 6], target: 2)
