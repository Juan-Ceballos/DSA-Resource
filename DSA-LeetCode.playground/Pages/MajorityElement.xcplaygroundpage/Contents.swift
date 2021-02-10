//: [Previous](@previous)

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    // Pseudo:
    var frequencyDict = [Int:Int]()
    var majorityCount = nums.count / 2
    for num in nums {
        if let count = frequencyDict[num] {
            frequencyDict[num] = count + 1
        } else {
            frequencyDict[num] = 1
        }
    }
    for (key, value) in frequencyDict {
        if value > majorityCount {
            return key
        }
    }
    return -999
}

majorityElement([3, 2, 3])

// return 3 since appears more than count/2 
