import UIKit

func transposeMatrix(matrix: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: 3), count: 3)
    
    for (i, row) in result.enumerated() {
        for (j, col) in row.enumerated() {
            result[i][j] = matrix[j][i]
        }
    }
    
    return result
}

print(transposeMatrix(matrix: [[0, 0, 1], [0, 1, 0], [0, 1, 1]]))
