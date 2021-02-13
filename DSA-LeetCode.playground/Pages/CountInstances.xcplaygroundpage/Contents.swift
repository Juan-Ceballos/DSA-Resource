//: [Previous](@previous)

import Foundation

/*
 get an array of sorted integers
 and an int
 
 how many instances of that int is in the array
 
 Questions:
 given an integer we'll find the number of times said appears in a sorted array
 
 edge cases, empty -> return
 
 sample input [0, 1, 2, 2, 3, 4], 2 -> 2
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
extension Array where Element == Int {
    
    func count(of value: Int) -> Int {
        guard !isEmpty else {
            return 0
        }
        
        var count = 0
        
        for element in self {
            if element == value {
                count += 1
            }
        }
        
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
//
