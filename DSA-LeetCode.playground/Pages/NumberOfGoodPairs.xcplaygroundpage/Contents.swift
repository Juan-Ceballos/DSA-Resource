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
