//: [Previous](@previous)

import Foundation

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    /*
     Questions:
     List is Empty: Return empty array
     equal numbers do not count
     Algorithm:
     [8, 1, 2, 2, 3]
     go to each number
     look at every other number
     if less than increase count
     reset count
     go to next number
     
     sort?
     count for everything to the left of number except same number
     
     [1, 2, 2, 3, 8]
     */
    
    let tempNums = nums
    var resultArr = [Int]()
    var count = 0
    
    for element in tempNums {
        for num in 0...tempNums.count - 1 {
            if tempNums[num] < element {
                count += 1
            }
        }
        resultArr.append(count)
        count = 0
    }
    
    return resultArr
    
}
