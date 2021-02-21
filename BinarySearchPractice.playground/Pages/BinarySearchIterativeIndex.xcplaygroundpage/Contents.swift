//: [Previous](@previous)

import Foundation

// -> Int? for index, Bool for is in array
func binarySearch(arr: [Int], target: Int) -> Int {
    
    // divide and conquer for log n runtime
    // has to be sorted, cut out numbers we don't have to look through
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while leftIndex <= rightIndex {
        
        // optimized middle index
        let middleIndex = leftIndex + (rightIndex - leftIndex) / 2
        let middleValue = arr[middleIndex]
        
        print("middle value = \(middleValue), left index = \(leftIndex), right index = \(rightIndex), [\(arr[leftIndex]), \(arr[rightIndex])]")
        
        if middleValue == target {
            return middleIndex
        }
        
        else if target < middleValue {
            rightIndex = middleIndex - 1
        }
        
        else if target > middleValue {
           leftIndex = middleIndex + 1
        }
    }
    
    return -999
}

let sortedArr1 = [3]
binarySearch(arr: sortedArr1, target: 3)

//
// copy paste
// instead of returning middle index, would return whenever middle and
// where do we insert value when it r3emains sorted

