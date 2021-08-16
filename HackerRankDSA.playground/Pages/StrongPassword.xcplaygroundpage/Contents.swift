//: [Previous](@previous)

import Foundation

// too slow for hackerrrank
func minimumNumber(n: Int, password: String) -> Int {
    let numbers = "0123456789"
    let lowerCase = "abcdefghijklmnopqrstuvwxyz"
    let upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let specialCharacters = "!@#$%^&*()-+"
    var count = 0
    var hasCharArr = [0, 0, 0 ,0]
    
    for char in password {
        if !hasCharArr.contains(0) {
            break
        }
        if hasCharArr[0] == 0 && numbers.contains(char)  {
            hasCharArr[0] = 1
            continue
        } else if hasCharArr[1] == 0 && lowerCase.contains(char)  {
            hasCharArr[1] = 1
            continue
        } else if hasCharArr[2] == 0 && upperCase.contains(char) {
            hasCharArr[2] = 1
            continue
        } else if hasCharArr[3] == 0 && specialCharacters.contains(char) {
            hasCharArr[3] = 1
            continue
        }
    }
    
    for element in hasCharArr {
        if element == 0 {
            count += 1
        }
    }
    
    if n < 6 {
        count += (6 - (n + count))
    }
    
    return count
}
