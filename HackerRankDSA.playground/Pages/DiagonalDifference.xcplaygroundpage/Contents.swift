//: [Previous](@previous)

import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {
    /*
    add each diagonal in matrix, subtract them abslolute value
       0.       1
    [[2, 3], [4, 9]]
    23
    49
        0.          1.         2.
    [[2, 3, 5], [4, 9, 6], [5, 8, 3]
    235
    496
    583
    - per row grab in the column grab the number equal to row index, opposite for other         diagonal
    1) create two var diag1 and diag2
    2) iterate through each arr
        - add the value in the row index to diag1
        - add the value in count - row index ie. 2 - 0 = 2, 2 - 1 = 1, 2 - 2
    3) when done if num is neg *-1 else return diff
    due to patter of matrix i know which index to look in for each arr, so dont need         nested
    */
    
    var diag1 = 0
    var diag2 = 0
    
    for (index, row) in arr.enumerated() {
        diag1 += row[index]
        diag2 += row[(row.count - 1) - index]
    }
    
    let diff = diag1 - diag2
    
    if diff < 0 {
        return diff * -1
    }
    
    return diff
}
