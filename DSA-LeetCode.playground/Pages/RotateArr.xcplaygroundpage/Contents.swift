//: [Previous](@previous)

import Foundation

func rotate(_ nums: inout [Int], _ k: Int) {
    /*
     
     Questions:
     change array in place
     
     Algo:
     if double array, any rotation inside
     [0, 1, 2, 3]  k = 2
     [0, 1, 2, 3, 0, 1, 2, 3]
     3, 0, 1, 2
     k = 1
     get size
     double array
     based on k grab from index k + 1 to size - 1
     
     Pseudo:
     count = nums.size
     tempNums = nums
     nums += tempNums
     for count k + 1 to size - 1
     {nums append = tempnums[count]}
     
     
     
     
     */
    // Input: nums = [1,2,3,4,5,6,7], k = 3
    let tempK = k % nums.count
    // tempK = the remainder of how much we're shifting to the right
    // divided by number of elements
    var prev: Int
    var temp: Int
    for i in 0..<tempK {
        // 0 to remainder
        prev = nums[nums.count - 1]
        // last element in arr
        for j in 0..<nums.count {
            // 0 to number of elements
            temp = nums[j]
            // element in now store in temp
            nums[j] = prev
            // element in now is last element in arr
            prev = temp
            // new last element is element were in now
        }
    }
    
    //         let count = nums.count
    //         let tempNums = nums
    //         var newNums = [Int]()
    //         nums += tempNums
    //         //print(nums)
    
    //         if count == 0 || count == 1 || count < k {
    //            nums = tempNums
    //         }
    //         else if count % 2 == 0 {
    //            for num in k...count - 1 + k {
    //                 newNums.append(nums[num])
    //             }
    //             nums = newNums
    //         } else {
    //             for num in k + 1...count + k {
    //                 newNums.append(nums[num])
    //             }
    //             nums = newNums
    //         }
    
    //         print(newNums)
    //         print(nums)
    
}

