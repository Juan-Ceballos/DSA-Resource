//: [Previous](@previous)

import Foundation

func hourglassSum(arr: [[Int]]) -> Int {
    var sum = 0
    var currentMax = -63
    //arr[0][0] + 01 + 02 + 10x + 11 + 12x + 20 + 21 + 22
    for (i, row) in arr.enumerated() {
        if i <= 3 {
           for (j, cell) in row.enumerated() {
                if j <= 3 {
                    sum += (cell + row[j + 1] + row[j + 2] + arr[i + 1][j + 1] +
                    arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2])
                    if sum > currentMax {
                        currentMax = sum
                    }
                }
                sum = 0
           }
        }
    }
    return currentMax
}
