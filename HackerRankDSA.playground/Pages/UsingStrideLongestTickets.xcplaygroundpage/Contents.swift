//: [Previous](@previous)

import Foundation

func countingTickets(arr: [Int]) -> Int {
    
    var count = 0
    var max = 0
    let sortedTickets = arr.sorted()
    
    if arr.count == 1 {
        return 1
    }
    
    for i in stride(from: 0, to: sortedTickets.count - 1, by: 1) {
        if sortedTickets[i] == sortedTickets[i + 1] || sortedTickets[i] + 1 == sortedTickets[i + 1] {
            count += 1
            if count > max {
                max = count
            }
        } else {
            count = 0
        }
    }
    
    return max + 1
}

countingTickets(arr: [1, 2, 3, 7, 8, 9, 10, 0, 5, 6])
