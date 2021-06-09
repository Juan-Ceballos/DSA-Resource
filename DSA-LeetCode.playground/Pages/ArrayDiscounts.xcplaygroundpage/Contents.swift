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

func finalPricesStack(_ prices: [Int]) -> [Int] {
    var result = prices
    var stack = [Int]()
    
    for index in stride(from: prices.count - 1, through: 0, by: -1) {
        let currentPrice = prices[index]
        
        while let last = stack.last, last > currentPrice {
            _ = stack.removeLast()
        }
        
        let discount = ((stack.last ?? Int.max) <= currentPrice) ? (stack.last ?? Int.max) : 0
        
        result[index] -= discount
        
        stack.append(currentPrice)
    }
    
    return result
}
