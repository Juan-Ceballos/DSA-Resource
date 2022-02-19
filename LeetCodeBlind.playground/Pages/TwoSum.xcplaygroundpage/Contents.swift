//: [Previous](@previous)

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var diffDict = [Int: Int]()
    var result = [Int]()
    
    for (index, element) in nums.enumerated() {
        let diff = target - element
        if let match = diffDict[diff] {
            result.append(match)
            result.append(index)
        } else {
            diffDict[element] = index
        }
    }
    
    return result
}


/*
 dictionary for value and index
 result array
 
 1) iterate through array and get the difference between target and element
 2) if the difference does not exist in the dictionary add value and index to dict
 3) if does exist add index of current element and value of dict of it's index to result arr
 4) return result
 */
