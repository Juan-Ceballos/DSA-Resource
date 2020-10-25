//: [Previous](@previous)

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    /*
     Questions:
     if no profit output is 0
     1 for 5 then 3 for 6
     1 for 5
     0
     Algo:
     find the difference for every pair of consecutive days
     add anything above zero
     if profits are all the same, buy first sell last
     Pseudo:
     for each element:
     compare current to next
     if positive store in profit else continue
     if profit is < max vs min
     return
     */
    
    var profit = 0
    var largestProfit: Int = 0
    var min: Int = prices.first ?? 0
    var max: Int = prices.first ?? 0
    var dayMinFound: Int = 0
    var dayMaxFound: Int = 0
    
    for day in 0...prices.count - 1 {
        if day == prices.count - 1 {
            if max < prices[day] {
                max = prices[day]
                dayMaxFound = day
            }
            break
        }
        if prices[day + 1] - prices[day] > 0 {
            profit += (prices[day + 1] - prices[day])
            if min > prices[day] {
                min = prices[day]
                dayMinFound = day
            }
            if max < prices[day] {
                max = prices[day]
                dayMaxFound = day
            }
        }
    }
    largestProfit = dayMinFound < dayMaxFound ? max - min : largestProfit
    
    return (largestProfit > profit ? largestProfit : profit)
}

print(maxProfit([7, 1, 5, 3, 6, 4]))
