//: [Previous](@previous)

import Foundation

func searchMatrix(matrix: [[Int]], target: Int) -> Bool {
    /*
     each row is sorted but only the columns and rows are in increasing order
     so row[0] is least row.last is greatest, increases going right and straight down
     
        <- decreasing
     [1, 4, 7] |increasing
     [2, 5, 8] v
     [3, 6, 9]
     
     sol: start at top right check row when greater move down, less move left
     if rows were each it's own sorted array maybe iterative binary search
     OR search matrix algo moving to rows and col based on currValue compared to target
        possibly starting at top middle or middle or corner with condition reagarding bounds
     */
    
    var currRow = 0
    var currCol = matrix[0].count - 1
    // only worrying on the walls algo will hit when moving left and down
    while currRow <= matrix.count - 1 && currCol >= 0 {
        let currValue = matrix[currRow][currCol]
        if currValue == target {
            return true
        } else if currValue < target {
            currRow += 1
        } else {
            currCol -= 1
        }
    }
    return false
}

print(searchMatrix(matrix: [[1, 4, 7], [2, 5, 8], [3, 6, 9]], target: 1))


// what if only rows were sorted no binary iterative search
func searchMatrix2(matrix: [[Int]], target: Int) -> Bool {
    var currRow = (matrix.count - 1) / 2
    var currCol = (matrix[0].count - 1) / 2
    
    /*
     [2, 4, 8]
     [1, 2, 3]
     [4, 7, 9]
     */
    
    // secure the walls
    while currRow <= matrix.count - 1 && currCol >= 0 && currRow >= 0 && currCol <= matrix[0].count - 1 {
        
        let currTarget = matrix[currRow][currCol]
        
        if currValue == target {
            return true
        } else if currValue > target {
            print("")
        } else {
            print("")
        }
    }
    
    // Hard to determing stop condition, seems like an approach like this if not using any other data structures would need conditions for each time hit a wall on top of looking for where to go next if target != curr value
    return false
}


