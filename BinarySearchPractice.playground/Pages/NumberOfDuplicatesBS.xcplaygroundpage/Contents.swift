//: [Previous](@previous)

import Foundation

import Foundation

/*
 get an array of sorted integers
 and an int
 
 how many instances of that int is in the array
 
 Questions:
 given an integer we'll find the number of times said appears in a sorted array
 
 edge cases, empty -> return
 
 sample input [0, 1,1.5 2, 2,2.5 3, 4], 2 -> 2
 // range of values
 sample input [0, 1, 2, 2, 3, 4], 7 -> 0
 sample input [] -> 0
 sample input [0, 1, 2, 2, 3, 4], 3 -> 1
 
 Algo:
 
 Pseudo:
 
 */

//func numberOfAppearances(arr: [Int], target: Int) - {
//
//}
//.count(of: 4)
// something ull find in a framework or library

func binarySearchLeftIterative(arr: [Int], value: Double) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        if Double(arr[mid]) >= value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return low
}

func binarySearchRightIterative(arr: [Int], value: Double) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let mid = low + (high - low) / 2
        if Double(arr[mid]) > value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return low
}

extension Array where Element == Int {
    
    func count(of value: Int) -> Int {
        guard !isEmpty else {
            return 0
        }
        
        let left = binarySearchLeftIterative(arr: self, value: Double(value) - 0.5)
        let right = binarySearchRightIterative(arr: self, value: Double(value) + 0.5)
        
        let count = right - left
        
        return count
    }
}

let arr1 = [0, 1, 2, 2, 3, 4]
print(arr1.count(of: 2))

let arr2 = [0, 1, 2, 2, 3, 4]
print(arr2.count(of: 7))

let arr3 = [Int]()
print(arr3.count(of: 7))

let arr4 = [0, 1, 2, 2, 3, 4]
print(arr4.count(of: 0))

// binary, not finding something, binary search for the purpose of insertion
// 1) binary search work on a range of the array
// 2) once left acquired start from left found to the end
