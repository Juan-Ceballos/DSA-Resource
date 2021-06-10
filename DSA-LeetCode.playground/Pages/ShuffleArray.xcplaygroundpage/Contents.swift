//: [Previous](@previous)

import Foundation

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var result = [Int]()
    for index in 0...n - 1 {
        result.append(nums[index])
        result.append(nums[index + n])
    }
    return result
}

