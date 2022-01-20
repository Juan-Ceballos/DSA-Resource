//: [Previous](@previous)

import Foundation

let now = Date()
let calendar = Calendar.current
var birthDayComponents = DateComponents()
birthDayComponents.month = 6
birthDayComponents.day = 2
birthDayComponents.year = 2022
birthDayComponents.calendar = calendar
let birthday = calendar.date(from: birthDayComponents)
let numberOfDaysComponents = calendar.dateComponents([.day], from: calendar.startOfDay(for: now), to: birthday!)
print(numberOfDaysComponents.day!)

