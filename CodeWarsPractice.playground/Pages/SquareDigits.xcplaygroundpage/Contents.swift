//: [Previous](@previous)

import Foundation

// string being a collection of chars let you use .joined(), and compactMap
func squareDigits(_ num: Int) -> Int {
    Int(String(num).compactMap() {
        String(Int(pow(Double(String($0))!, 2)))
    }.joined())!
}
