//: [Previous](@previous)

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var firstZero = -1
    for (index, element) in nums.enumerated() {
        if element == 0 && firstZero == -1 {
            firstZero = index
        } else if element != 0 && firstZero != -1 {
            nums.swapAt(index, firstZero)
            firstZero += 1
        }
    }
}

/*
 questions:
 input: [Int]
 output: [Int] -> 0s moved to the left
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 [0,1,0,3,12]
 [1,0,0,3,12]
 [1, 3, 0, 0, 12]
 [1, 3, 12, 0, 0]
 
 [2, 4, 0, 5, 0, 0, 1]
 
 know where first 0 is
 [2,4,5,0,0,0,1]
 [2, 4, 5, 1, 0, 0, 0]
 */
