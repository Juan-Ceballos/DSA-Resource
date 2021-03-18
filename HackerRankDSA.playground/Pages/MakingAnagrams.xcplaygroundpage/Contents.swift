//: [Previous](@previous)

import Foundation

func makeAnagram(a: String, b: String) -> Int {

    // delete letters that are only found in one of the strings
    var dictA = [Character:Int]()
    var dictB = [Character:Int]()
    var count = 0
    
    for char in a {
        if let count = dictA[char] {
            dictA[char] = count + 1
        } else {
            dictA[char] = 1
        }
    }
    
    for char in b {
        if let count = dictB[char] {
            dictB[char] = count + 1
        } else {
            dictB[char] = 1
        }
    }
    
    for (key, value) in dictA {
        if let charInB = dictB[key] {
            count += abs(value - charInB)
            dictB[key] = 0
            dictA[key] = 0
        } else {
           count += value
        }
    }
    
    for (key, value) in dictB {
        if let charInA = dictA[key] {
            count += abs(value - charInA)
        } else {
            count += value
        }
    }
    
    
    print(dictA)
    print(dictB)
    return count

}

makeAnagram(a: "abv", b: "abc")
