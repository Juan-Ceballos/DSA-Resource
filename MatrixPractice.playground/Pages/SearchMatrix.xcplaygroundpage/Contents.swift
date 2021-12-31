//: [Previous](@previous)

import Foundation

func searchMatrixSorted(matrix: [[Int]], target: Int) -> Bool {
    for row in matrix {
        let found = binarySearch(arr: row, target: target)
        if found {
            return true
        }
    }
    return false
}

func searchMatrixSorted2(matrix: [[Int]], target: Int) -> Bool {
    var low = 0
    var high = matrix.count - 1
    
    // binary search rows, bs searched row, move to next row using bs
    while low <= high {
        let middle = low + (high - low) / 2
        let middleRow = matrix[middle]
        let value = binarySearch(arr: middleRow, target: target)
        if value == true {
            return true
        } else if matrix[middle][0] > target {
            high = middle - 1
        } else {
            low = middle + 1
        }
    }
    
    return false
}

func searchMatrixSorted3(matrix: [[Int]], target: Int) -> Bool {
    // based on the pattern of a matrix where down, right increases and up left de.
    // we traverse the array based on value to path our way through to target
    var currRow = 0
    var currCol = matrix[0].count - 1
    
    while currRow >= 0 && currCol >= 0 && currRow <= matrix.count - 1 && currCol <= matrix[0].count - 1 {
        let currValue = matrix[currRow][currCol]
        if currValue == target {
            return true
            // if greater nothing above is going to be worth checking
        } else if currValue < target {
            currRow += 1
            // if less everything under is greater and should move to the left
        } else {
            currCol -= 1
        }
    }
    
    return false
}

func binarySearch(arr: [Int], target: Int) -> Bool {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        let middleValue = arr[middle]
        
        if target == middleValue {
            return true
        } else if target < middleValue {
            high = middle - 1
        } else {
            low = middle + 1
        }
    }
    
    return false
}

func binarySearch2(arr: [Int], target: Int) -> Int? {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        let middleValue = arr[middle]
        
        if target == middleValue {
            return middleValue
        } else if target < middleValue {
            high = middle - 1
        } else {
            low = middle + 1
        }
    }
    
    return nil
}

print(binarySearch(arr: [1, 2, 4, 9, 11], target: 8))
print(searchMatrixSorted(matrix: [[1, 2, 5], [6, 8, 9], [10, 12, 15]], target: 9))
print(searchMatrixSorted(matrix: [[1, 2, 5], [6, 8, 9], [10, 12, 15]], target: 20))
print(searchMatrixSorted2(matrix: [[1, 2, 5], [6, 8, 9], [10, 12, 15]], target: 1))
print(searchMatrixSorted3(matrix: [[1, 2, 5, 7], [8, 9, 10, 12], [15, 20, 25, 26]], target: 10))
