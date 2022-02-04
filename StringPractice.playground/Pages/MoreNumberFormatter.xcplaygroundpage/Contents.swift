//: [Previous](@previous)

import Foundation

let number = 1234.5678
let numbers = [1234.5678, 112, 0.235, 12456.3, 213456, 789.12]
let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .currency
let strNum = numberFormatter.string(for: number)!
print(strNum)

let nf2 = NumberFormatter()
// 2 by default, can change using max significant digits
nf2.usesSignificantDigits = true
// change number of sig digits when set to true
//nf2.maximumSignificantDigits = 8
// also min digits


let strNumSD = nf2.string(for: number)
print(strNumSD!)
print(number)

nf2.maximumSignificantDigits = 6
// min will add extra 0s if number has less digits than property set to
nf2.minimumSignificantDigits = 6
print()
for num in numbers {
    let number = nf2.string(for: num)!
    print("\(num) -> \(number)")
}
print()

let nf3 = NumberFormatter()
nf3.roundingMode = .
// before decimal separator
nf3.minimumIntegerDigits = 10
// after decimal separator, rounds off after decimal goes over,
// will need maxFraction for specific
// nf3.maximumInteger will truncate to the left if num of digits greater
nf3.minimumFractionDigits = 10
for num in numbers {
    let number = nf3.string(for: num)!
    print("\(num) -> \(number)")
}

let nf4 = NumberFormatter()
let numbers2 = [1234.5, 1234.4, 1234.6]
let numbers3 = [1235.5, 1235.4, 1235.6]
print()

// rounding based on roundingMode property
nf4.roundingMode = .ceiling // always round up towards +infinity
for num in numbers2 {
    let number = nf4.string(for: num)!
    print("\(num) -> \(number)")
}
print("---------------------------")
for num in numbers3 {
    let number = nf4.string(for: num)!
    print("\(num) -> \(number)")
}
// if using decimal values less than one ie 0.23 need to use fractionalDecimal to not round 0

print()
let moneyNum: Double = 245
let split: Double = 3
let share = moneyNum/split
print(share)
let shareFormatted = String(format: "$%.2f", share) // could use currency in numformatter
print(shareFormatted)

print()
let numForHex = 255
let hex = String(format: "\(numForHex) in hex is %X", numForHex)
print(numForHex)
print(hex)

print()
// placeholder format in order of arguments
let hexColor = String(format: "%X%X%X", 120, 255, 125)
print(hexColor)
