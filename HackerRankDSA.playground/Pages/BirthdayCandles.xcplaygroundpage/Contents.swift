//: [Previous](@previous)

import Foundation

func birthdayCakeCandles(candles: [Int]) -> Int {
    if candles.count == 1 {
        return candles[0]
    }
    
    /*
    return the number of highest value
    
    1 - sort the array
    2 - find the first index of last element
    3 - return the count - index
    */
    let sortedCandles = candles.sorted{$0 < $1}
    let firstMax = Int(sortedCandles.firstIndex(of: sortedCandles[sortedCandles.count -                     1])!)
    return sortedCandles.count - firstMax
}
