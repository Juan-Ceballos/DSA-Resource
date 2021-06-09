//: [Previous](@previous)

import Foundation

func maximumWealth(_ accounts: [[Int]]) -> Int {
    var maxWealth = 0
    var sum = 0
    for account in accounts {
        for num in 0...account.count - 1 {
            sum += account[num]
        }
        if sum > maxWealth {
            maxWealth = sum
        }
        sum = 0
    }
    return maxWealth
}

// reduce and max function implementation
