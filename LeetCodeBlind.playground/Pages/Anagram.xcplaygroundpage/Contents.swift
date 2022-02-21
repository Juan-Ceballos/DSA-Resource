//: [Previous](@previous)

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    var sArr = Array(s)
    var tArr = Array(t)
    
    for letter in sArr {
        guard let i = tArr.firstIndex(of: letter) else {
            return false
        }
        let a = tArr.remove(at: i)
    }
    
    return tArr.isEmpty
}

// you can compare 2 dictionaries
/*
 s, t anagrams?
 
 */
