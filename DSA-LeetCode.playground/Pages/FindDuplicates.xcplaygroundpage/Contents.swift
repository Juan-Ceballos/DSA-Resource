//: [Previous](@previous)

import Foundation


func findDuplicatesDict(_ nums: [Int]) -> [Int] {
        // Pseudo
        
        var freqDict = [Int:Int]()
        var dupArr = [Int]()
    
        for element in nums {
            if let count = freqDict[element] {
                freqDict[element] = count + 1
            } else {
                freqDict[element] = 1
            }
        }
    
        for (key, value) in freqDict {
            if value == 2 {
                dupArr.append(key)
            }
        }
        
        return dupArr
    }


func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums //extra space can be avoided by inout parameters
        var res : [Int] = []
        for num in nums{
            if nums[abs(num) - 1] < 0{ //if the value is negative it means we have seen/visited it before
                res.append(abs(num))
            }
            nums[abs(num) - 1] *= -1 //setting visited value to negative
        }
        return res
    }

