//: [Previous](@previous)

import Foundation

// prefix
let strToPrefix = "ABCD"
let prefixOfStr = strToPrefix.prefix(2)
print(prefixOfStr)

// suffix
let strToSuffix = "ABCD"
let suffixOfStr = strToSuffix.suffix(2)
print(suffixOfStr)

let strToIndex = "Hello World!"
let start = strToIndex.index(strToIndex.startIndex, offsetBy: 1)
let end = strToIndex.index(strToIndex.startIndex, offsetBy: 4)
let range = start...end
let newStr = String(strToIndex[range])
print(newStr)

// One Character through Array
let strToArray = "ABCD"
let singleCharFromArr = Array(strToArray)[3]
print(singleCharFromArr)

// Check if contains substring
let strToCheckForSub = "ABCD"
let doesSub = strToCheckForSub.contains("BC")
print(doesSub)

// indices string property, distance, manipulation using indices
var strIndicesCheck = "ABCD"
let indeces = strIndicesCheck.indices
//print(indeces)
for i in strIndicesCheck.indices {
    print(i)
    let iD = strIndicesCheck.distance(from: strIndicesCheck.startIndex, to: i)
    print(iD)
    if iD == 2 {
        strIndicesCheck.remove(at: i)
    }
}
print(strIndicesCheck)
