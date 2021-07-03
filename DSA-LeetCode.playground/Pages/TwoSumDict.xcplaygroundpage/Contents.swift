//: [Previous](@previous)

import Foundation

// two sum using a dictionary to check if index for needed difference exist
// also a nested loop iteration method
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var freqDict = [Int: Int]()
    var result = [Int]()
    
    for (index, element) in nums.enumerated() {
        let currentDiff = target - element
        if let count = freqDict[currentDiff] {
            result.append(count)
            result.append(index)
        } else {
            freqDict[element] = index
        }
    }
    
    return result
}
