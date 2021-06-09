//: [Previous](@previous)

import Foundation

// brute force
func finalPrices(_ prices: [Int]) -> [Int] {
    var result = [Int]()
    var i = 1
    for (index, price) in prices.enumerated() {
        if index < prices.count - 1 {
            var i = index + 1
            while i < prices.count {
                if price >= prices[i] {
                    result.append(price - prices[i])
                    break
                } else {
                    if i == prices.count - 1 {
                        result.append(price)
                        break
                    }
                    i += 1
                }
            }
        }
    }
    result.append(prices[prices.count - 1])
    return result
}
