//: [Previous](@previous)

import Foundation

// nested for loop
func pairsDivisible(arr: [Int], k: Int) -> Int {
    var count = 0
    for i in 0..<arr.count {
        for j in (i + 1)..<arr.count {
            if (arr[i] + arr[j]) % k == 0 {
                count += 1
            }
        }
    }
    return count
}

print(pairsDivisible(arr: [1, 2, 3, 4, 5], k:3))

// dictionary
/*
 find the remainder of num / k
 insert it into dictionary
 if the key does not 
 */

// combinatrix?
