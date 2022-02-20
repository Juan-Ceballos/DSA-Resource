//: [Previous](@previous)

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    let setNums = Set(nums)
    return setNums.count < nums.count
}
