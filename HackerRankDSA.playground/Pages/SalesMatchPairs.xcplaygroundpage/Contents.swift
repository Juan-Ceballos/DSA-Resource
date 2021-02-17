//: [Previous](@previous)

import Foundation
/*
 Question:
 given the size of the array, return the number of paired ints
 size of atleast 1 so lowest answer is 0
 
 ALgo:
 create a frequency dictionary
 divide each value for the keys by 2, add result to toal sum
 
 Pseudo:
 */

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    
    var freqDict = [Int:Int]()
    var pairs = 0
    
    for num in ar {
        if let count = freqDict[num] {
            freqDict[num] = count + 1
        } else {
            freqDict[num] = 1
        }
    }
    
    for (key, value) in freqDict {
        pairs += value / 2
    }
    
    return pairs
    
}
