//: [Previous](@previous)

import Foundation

func camelcase(s: String) -> Int {
    // Write your code here
    var count = 1
    for character in s {
        if character.isUppercase {
            count += 1
        }
    }
    
    return count
}
