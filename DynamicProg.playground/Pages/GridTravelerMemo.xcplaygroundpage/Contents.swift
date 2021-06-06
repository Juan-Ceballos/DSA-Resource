import UIKit

func gridTraveler(m: Int, n: Int) -> Int {
    // grid m x n ie 2 by 3
    // [][][]
    // [][][]
    
    if m == 1 && n == 1 {
        return 1
    }
    
    if m == 0 || n == 0 {
        return 0
    }
    
    return gridTraveler(m: m - 1, n: n) + gridTraveler(m: m, n: n - 1)
    
}
// Brute Force Recursive
print(gridTraveler(m: 4, n: 4))

func gridTravelerMatrix(m: Int, n: Int) -> Int {
    
    if m <= 1 || n <= 1 {
        return 1
    }
    
    var matrix = Array(repeating: Array(repeating: 1, count: m), count: n)
    
    for i in 1..<m {
        for j in 1..<n {
            matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
        }
    }
    
    
    return matrix[m - 1][n - 1]
}

print(gridTravelerMatrix(m: 4, n: 4))
