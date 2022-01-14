//: [Previous](@previous)

import Foundation

let helloStrToCount = "Hello"
let countOfHelloStr = helloStrToCount.count
print(countOfHelloStr)

var intToStringup = 29
var stringedUp = Int(intToStringup)
var stringedUp2 = "\(intToStringup)"
print(stringedUp)
print(stringedUp2)

var stringToInt = "325"
var intAsStr = Int(stringToInt) // ?? or !
var intAsStr2 = (stringToInt as NSString).integerValue
print(intAsStr)
print(intAsStr2)

