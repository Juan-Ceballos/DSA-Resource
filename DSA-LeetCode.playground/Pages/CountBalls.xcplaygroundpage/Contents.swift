//: [Previous](@previous)

import Foundation

func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
    var freqDict = [Int: Int]()
    var sum = 0
    for ball in lowLimit...highLimit {
        var currentAdd = ball
        while currentAdd != 0 {
            sum += currentAdd % 10
            currentAdd = currentAdd / 10
        }
        if let count = freqDict[sum] {
            freqDict[sum] = count + 1
        } else {
            freqDict[sum] = 1
        }
        sum = 0
    }
    return freqDict.values.max() ?? 1
}
