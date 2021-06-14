//: [Previous](@previous)

import Foundation

func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
    for index in indices {
        matrix[index[0]] = matrix[index[0]].map {$0 + 1}
        for num in 0...m - 1 {
            matrix[num][index[1]] += 1
        }
    }
    let flat = matrix.flatMap {$0}
    var count = 0
    for element in flat {
        if element % 2 != 0 {
            count += 1
        }
    }
    return count
}
