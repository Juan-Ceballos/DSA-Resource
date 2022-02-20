//: [Previous](@previous)

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    
    var maxProfit = 0
    var minPrice = prices.first!
    
    for currentPrice in prices[1...] {
        minPrice = min(currentPrice, minPrice)
        maxProfit = max(currentPrice - minPrice, maxProfit)
    }
    
    return maxProfit
}
/*
 find biggest positive difference in array, subtraction done in order of array
 two pointers?
 
 7, 4 = -3 | 7 > 4
 1, 4 = 3
 1, 6 = 5
 1, 3 = 2
 
 [7,1]
 [7,1,9]
 
 */
