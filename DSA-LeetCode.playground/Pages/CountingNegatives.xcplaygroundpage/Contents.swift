//: [Previous](@previous)

import Foundation

// brute force, iterative
func countNegatives(_ grid: [[Int]]) -> Int {
    var row = 0
    var column = 0
    var count = 0
    
    if grid[row][column] < 0 {
        return grid.count * grid[row].count
    }
    
    for row in grid {
        for num in row {
            if num >= 0 {
                count += 1
            } else {
                break
            }
        }
    }
    
    
    let result = (count) - (grid.count * grid[row].count)
    print(result * -1)
    return result * -1
    
}

// O(n + m)
func countNegativesOpt(grid: [[Int]]) -> Int {
    var row = grid.count - 1
    var col = 0
    var count = 0
    
    while row >= 0 && col < grid[0].count {
        if grid[row][col] < 0 {
            count += grid[row].count - col
            row -= 1
        } else {
            col += 1
        }
    }
    
    return count
}

print(countNegativesOpt(grid: [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]))

func findFirstNegative(_ arr: [Int]) -> Int {
    var low = 0
    var high = arr.count - 1
    
    while low < high {
        let middle = low + (high - low) / 2
        let middleValue = arr[middle]
        
        if middleValue < 0 {
            high = middle - 1
        } else {
            low = middle + 1
        }
        
    }
    
    if low == arr.count - 1 && arr[low] >= 0 {
        return 0
    }
    
    return arr[low] >= 0 ? arr.count - low - 1 : arr.count - low
}

func countNegativesBS(grid: [[Int]]) -> Int {
    var count = 0
    
    for row in grid {
        let negsInRow = findFirstNegative(row)
        count += negsInRow
    }
    
    return count
}

print(countNegativesBS(grid: [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]))

