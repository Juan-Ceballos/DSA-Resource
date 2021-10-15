//: [Previous](@previous)

import Foundation

func getTotalX(a: [Int], b: [Int]) -> Int {
    var count = 0
    for num in 1...100 {
        if factorsA(num: num, arr: a) && factorsB(num: num, arr: b) {
            count += 1
        }
    }
    return count
}

func factorsA(num: Int, arr: [Int]) -> Bool {
    for element in arr {
        if num % element != 0 {
            return false
        }
    }
    
    return true
}

func factorsB(num: Int, arr: [Int]) -> Bool {
    for element in arr {
        if element % num != 0 {
            return false
        }
    }
    return true
}
