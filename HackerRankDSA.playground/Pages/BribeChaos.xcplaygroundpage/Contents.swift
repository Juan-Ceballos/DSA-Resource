//: [Previous](@previous)

import Foundation

func minimumBribes(q: [Int]) -> Void {
    var bribe = 0
    for (index, element) in q.enumerated() {
        if element - (index + 1) > 2 {
            print("Too chaotic")
            return
        }
        // if current element - 2 is less than or equal to 0 set startIndex
        // 0 if not set equal to current index - 2
        // element = index of where should be - 1
        let startIndex = element - 2 <= 0 ? 0 : element - 2
        if startIndex < index {
            for iterator in startIndex ..< index {
                if q[iterator] > element {
                    bribe += 1
                }
            }
        }
    }
    print(bribe)
}

minimumBribes(q: [1, 2, 5, 3, 7, 8, 6, 4])
