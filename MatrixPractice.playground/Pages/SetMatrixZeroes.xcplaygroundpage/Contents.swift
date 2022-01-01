//: [Previous](@previous)

import Foundation

func setMatrixZeroes(matrix: inout [[Int]]) {
    /*
     if find a 0 set the row and column to 0
     111, 101, 111
     101, 000, 101
     
     111
     101
     111
     
     rows that contain 0
     cols that contain 0
     colId: 1
     rowId: 1
     
     
     */
    var rowIds = Set<Int>()
    var colIds = Set<Int>()
    
    for (i, row) in matrix.enumerated() {
        for (j, col) in row.enumerated() {
            if matrix[i][j] == 0 {
                rowIds.insert(i)
                colIds.insert(j)
            }
            
        }
    }
    
    for id in rowIds {
        for (i, col) in matrix[id].enumerated() {
            matrix[id][i] = 0
        }
    }
    
    for id in colIds {
        for (j, row) in matrix.enumerated() {
            matrix[j][id] = 0
        }
    }
    
    print(matrix)
}

var matrixInput = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
setMatrixZeroes(matrix: &matrixInput)
