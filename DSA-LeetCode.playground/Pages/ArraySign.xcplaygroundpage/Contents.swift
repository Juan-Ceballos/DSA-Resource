//: [Previous](@previous)

import Foundation

func arraySign(_ nums: [Int]) -> Int {
        var count = 0
        for num in nums {
            if num == 0 {
                return 0
            } else if num < 0 {
                count += 1
            }
        }
        if count % 2 == 0 {
            return 1
        } else {
            return -1
        }
   }
