//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// startIndex
let strIndexFirstChar = str.startIndex
print(strIndexFirstChar)
// char by index subscript
let strFirstChar = str[strIndexFirstChar]
print(strFirstChar)

let lastStrIndex = str.index(before: str.endIndex)
let lastChar = str[lastStrIndex]
print(lastChar)

let charBeforeEndIndex = str.index(str.endIndex, offsetBy: -2)
let charBeforeEnd = str[charBeforeEndIndex]
print(charBeforeEnd)

let charAfterStartIndex = str.index(str.startIndex, offsetBy: 2)
let charAfterStart = str[charAfterStartIndex]
print(charAfterStart)

