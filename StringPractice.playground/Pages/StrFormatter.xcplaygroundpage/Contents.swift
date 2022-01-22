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
//let sampleDate = Date(timeIntervalSince1970: TimeInterval(StringProtocol())
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
print("Custom Date Format:")
customDateFormatter.dateFormat = "EEEE, MMMM d, yyyy - hh:mm:ss a zzz"
print(customDateFormatter.string(from: now))

// string to date
let sampleDate = "01.18.22" // date format has to be right for string, valid date str
let df = DateFormatter()
let df2 = DateFormatter()

//df.locale = Locale(identifier: "na")
df.dateStyle = .short
df2.dateStyle = .full
print(df.date(from: sampleDate) ?? "none")
print(df2.date(from: sampleDate) ?? "none") // improper string for format of datestyle full
//Locale.availableIdentifiers
//TimeZone.knownTimeZoneIdentifiers
//print(TimeZone.abbreviationDictionary)

let calendar = Calendar.current // used for date components calendar based on device
//let christmasComponent = DateComponents(calendar: <#T##Calendar?#>, timeZone: <#T##TimeZone?#>, era: <#T##Int?#>, year: <#T##Int?#>, month: <#T##Int?#>, day: <#T##Int?#>, hour: <#T##Int?#>, minute: <#T##Int?#>, second: <#T##Int?#>, nanosecond: <#T##Int?#>, weekday: <#T##Int?#>, weekdayOrdinal: <#T##Int?#>, quarter: <#T##Int?#>, weekOfMonth: <#T##Int?#>, weekOfYear: <#T##Int?#>, yearForWeekOfYear: <#T##Int?#>)
var christmasComponents = DateComponents()
christmasComponents.calendar = calendar
christmasComponents.month = 12
christmasComponents.day = 25
christmasComponents.year = 2022

let christmas = calendar.date(from: christmasComponents)
let df3 = DateFormatter()
df3.dateStyle = .full
df3.timeStyle = .full
print(df3.string(from: christmas ?? Date()))

// specific days in future
var familyComponents = DateComponents()
familyComponents.calendar = calendar
familyComponents.month = 2
familyComponents.year = 2025
familyComponents.weekday = 2 // day of week 2 = monday
familyComponents.weekdayOrdinal = 3 // third monday of month
let familyDay = calendar.date(from: familyComponents)
let df4 = DateFormatter()
df4.dateStyle = .full
df4.timeStyle = .full
print(df4.string(from: familyDay ?? Date()))


// Date Calculations
let df5 = DateFormatter()
df5.dateStyle = .full
df5.timeStyle = .medium

let nowPlusHour = Date(timeInterval: 60 * 60, since: Date()) // ints are in seconds
let nowPlusHour2 = Date(timeIntervalSinceNow: 60 * 60) // now date built in just have to pass
// in time interval to calc from now
print(df5.string(from: nowPlusHour))
print(df5.string(from: nowPlusHour2))
// maybe create a calendar date using date components and can calculate a new date using that
// calendar date and timeInterval in Date constructor
let dayAfterChristmas = Date(timeInterval: 60 * 60 * 24, since: christmas ?? Date())
// day after christmas using calendar.date set with christmas components as christmas variable
print(df5.string(from: dayAfterChristmas))

// different date and calendar methods
let distantPast = Date.distantPast
let distantFuture = Date.distantFuture
print(df5.string(from: distantPast))
print(df5.string(from: distantFuture))
let startOfDay = calendar.startOfDay(for: now) // can enter date as arg
print(df5.string(from: startOfDay))

var nextMondayComponents = DateComponents()
nextMondayComponents.weekday = 2
nextMondayComponents.hour = 9
let nextMonday = calendar.nextDate(after: now, matching: nextMondayComponents, matchingPolicy: .nextTime)
print(df5.string(from: nextMonday ?? Date()))

// next week at noon
var nowComponents = calendar.dateComponents([.day, .month, .year], from: now)
nowComponents.hour = 12
let nextWeek = calendar.date(byAdding: .day, value: 7, to: calendar.date(from: nowComponents)!)
print(df5.string(from: nextWeek!))

// calculate num of days between now and christmas
var christmasComponents2 = DateComponents()
//christmasComponents2.calendar = calendar
christmasComponents2.day = 25
christmasComponents2.year = 2022
christmasComponents2.month = 12
let christmasDay2 = calendar.date(from: christmasComponents2)
let numberOfDaysTilChristmas = calendar.dateComponents([.day], from: now, to: christmasDay2!)
// full days, to count when in middle of day use (..., from: calendar.startOfDay(for: now), to...)
print(numberOfDaysTilChristmas.day!)
