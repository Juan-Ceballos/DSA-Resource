//: [Previous](@previous)

import Foundation

/*
 jumping on clouds
 traversing to the end of the array
 can go to the next index or index + 2
 recursion
 iterate through array check if can jump 2 or can jump 1
 each jump increase the count
 index placeholder 0 to count - 1
 */

func jumpingOnClouds(c: [Int]) -> Int {
    var index = 0
    var jumps = 0
            
    while index < c.count - 1 {
        if index + 1 == c.count - 1 {
            jumps += 1
            break
        }
        if c[index + 2] == 0 {
            index += 2
            jumps += 1
        } else {
            index += 1
            jumps += 1
        }
    }
    return jumps
}
