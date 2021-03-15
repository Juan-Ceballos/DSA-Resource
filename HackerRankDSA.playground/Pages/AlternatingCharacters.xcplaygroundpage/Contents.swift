//: [Previous](@previous)

import Foundation

func alternatingCharacters(s: String) -> Int {
    
    var count = 0
    var check: Character = "*"
    
    for (char) in s {
        if char != check {
            check = char
        } else if char == check {
            count += 1
        }
    }
    
    return count

}

alternatingCharacters(s: "ABAAA")
