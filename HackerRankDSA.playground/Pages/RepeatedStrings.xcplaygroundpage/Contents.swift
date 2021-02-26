//: [Previous](@previous)

import Foundation

func repeatedStrings(s: String, n: Int) -> Int {
    let stringCount = s.count
    let remainder = n % stringCount
    let multiplier = n / stringCount
    let patternPrefix = s.prefix(remainder).filter({ $0 == "a" }).count
    let aValue = s.filter({ $0 == "a" }).count * multiplier
    return aValue + patternPrefix
}

repeatedStrings(s: "abca", n: 100)
