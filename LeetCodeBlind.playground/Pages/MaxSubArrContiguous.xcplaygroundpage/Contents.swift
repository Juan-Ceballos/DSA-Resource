//: [Previous](@previous)

import Foundation

/*
 Dynamic Problem - Express in terms of sub-problems
 
 */
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return Int.min
    }
    var maxValue = nums[0]
    var preMax = nums[0]
    for i in 1..<nums.count {
        let value = nums[i]
        let curMax = max(preMax + value, value)
        maxValue = max(maxValue, curMax)
        preMax = curMax
    }
    return maxValue
}


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
