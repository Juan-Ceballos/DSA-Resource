//: [Previous](@previous)

import Foundation

func numIdenticalPairs(_ nums: [Int]) -> Int {
    var numberOfPairs = 0
    for index in stride(from: 0, to: nums.count - 1, by: 1) {
        for num in index..<nums.count - 1 {
            if nums[num + 1] == nums[index] {
                numberOfPairs += 1
            }
        }
    }
    return numberOfPairs
}

// adds each value to freq dict. since array values are added in order, and i < j
// the count is updated when an equal value is added, 
func numIdenticalPairsFD(_ nums: [Int]) -> Int {
    var frequency: [Int: Int] = [:]
    var total = 0
    for val in nums {
        if let count = frequency[val] {
            total += count
        }
        frequency[val, default: 0] += 1
    }
    return total
}
