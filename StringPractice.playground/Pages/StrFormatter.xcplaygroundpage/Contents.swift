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
let numToFormat = 3
let numToFormat2 = 3
// % in order of args
// 02d, 2 figures first figure buffered by 0 if necessary, d = digits, : between each formatted arg
let formattedNum = String(format: "%02d:%02d", numToFormat, numToFormat2)
print(formattedNum)


// number formatter
let numForFormatter = 3200.0059
let percentFormatting = 0.5
print(numForFormatter)
let numFormatter = NumberFormatter()
let numFormatter2 = NumberFormatter()
numFormatter2.numberStyle = .percent
numFormatter.numberStyle = .currency
let number = numFormatter.string(for: numForFormatter)
print(number ?? "none")
let percentFormat = numFormatter2.string(for: percentFormatting)
print(percentFormat ?? "none")


// date formatter
let dateFormatter = DateFormatter()
let now = Date()
print(now)
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
print(dateFormatter.string(from: now))

let dateFormatterLocale = DateFormatter()
dateFormatterLocale.locale = Locale(identifier: "ja")
dateFormatterLocale.dateStyle = .full
dateFormatterLocale.timeStyle = .full
dateFormatterLocale.timeZone = TimeZone(identifier: "JST")
print(dateFormatterLocale.string(from: now))

let customDateFormatter = DateFormatter()
customDateFormatter.dateFormat = "EEEE, MMMM d, yyyy - hh:mm:ss a zzz"
print(customDateFormatter.string(from: now))

// string to date
let sampleDate = "01.18.22"

