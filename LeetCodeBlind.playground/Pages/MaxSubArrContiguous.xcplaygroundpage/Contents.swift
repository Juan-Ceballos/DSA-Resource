//: [Previous](@previous)

import Foundation

/*
 Dynamic Problem - Express in terms of sub-problems
 - For this problem sums kinda stores subarrays
 -
 */
func maxSubArray(_ nums: [Int]) -> Int {
    // current and max sum is first number in array
    var currSum = nums[0]
    var maxSum = nums[0]
    
    // from second element to last
    for i in 1..<nums.count {
        // check wheter max is current element OR
        // the sum of previous elements(could be one element) PLUS the current element
        // the sum of the previous elements called currSum could be a single element prior
        currSum = max(nums[i], currSum + nums[i])
        // check wheter maxSum is the current maxSum or the found currSum
        maxSum = max(maxSum, currSum)
    }
    return maxSum
}

//-------------
func bruteMaxSubArr(_ nums: [Int]) -> Int {
    var max = Int.min
    for num in 0..<nums.count {
        for (index, element) in nums.enumerated() {
            if index + num < nums.count {
                let sum = Array(nums[index...index + num]).reduce(0, +)
                if sum > max {
                    max = sum
                }
            } else {break}
        }
    }
    return max
}
