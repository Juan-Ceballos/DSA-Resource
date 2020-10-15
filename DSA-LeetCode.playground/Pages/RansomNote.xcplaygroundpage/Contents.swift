//: [Previous](@previous)

import Foundation

// Try doing with freq dictionary
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    // return true if magazine string contains all letters for ransom note
    // all lower case
    // bool: true or false
    
    /*
     magazine array
     go through each letter of ransom note
     if in magizine array remove letter from magazine and put in blank word
     if blank and ransom same return true
     */
    
    var magArr = Array(magazine)
    var wordCheck = ""
    
    for element in ransomNote {
        if magArr.contains(element) {
            if let firstIndexOfElement = magArr.firstIndex(of: element) {
                magArr.remove(at: firstIndexOfElement)
            }
            wordCheck += String(element)
        }
    }
    
    return wordCheck == ransomNote
    
}

