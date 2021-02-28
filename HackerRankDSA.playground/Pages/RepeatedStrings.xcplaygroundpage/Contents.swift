//: [Previous](@previous)

import Foundation

func repeatedStrings(s: String, n: Int) -> Int {
    // count of given string
    let stringCount = s.count
    // remainder of full string lenght divided by substring given
    let remainder = n % stringCount
    // how many times substring is repeated
    let multiplier = n / stringCount
    // count of a in given substring
    let patternPrefix = s.prefix(remainder).filter({ $0 == "a" }).count
    // number of a in a repeated string count
    let aValue = s.filter({ $0 == "a" }).count * multiplier
    // the number of times string repeated has a plus what would be in a remainder string
    return aValue + patternPrefix
}

repeatedStrings(s: "abca", n: 100)
