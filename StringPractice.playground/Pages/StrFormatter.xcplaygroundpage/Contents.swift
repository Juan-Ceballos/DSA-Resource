//: [Previous](@previous)

import Foundation

let strToFormat = 0.0056
// % represents what we're formatting based on argument
// .2 what place starting form 10th at .1
// f = floating point number
let formatted = String(format: "%.2f", strToFormat)
let formattedHigher = String(format: "%.3f", strToFormat)
print(formatted) // rounds
print(formattedHigher)


// different string format to imitate stop watch 00:00

