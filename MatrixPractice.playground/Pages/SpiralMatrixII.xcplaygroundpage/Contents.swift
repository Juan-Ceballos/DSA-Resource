//: [Previous](@previous)

import Foundation

func SpiralMatrixII(n: Int) -> [[Int]] {
    var maxRow = n - 1
    var maxCol = n - 1
    var startRow = 0
    var startCol = 0
    var currRow = 0
    var currCol = 0
    var dir = "R"
    var valueCounter = 1
    var result = Array(repeating: Array(repeating: -1, count: n), count: n)
    print(result)
    
    while currRow < n && currCol < n && valueCounter < n * n {
        
        if dir == "R" {
            for currCol in startCol...maxCol {
                if result[currRow][currCol] == -1 {
                    result[currRow][currCol] = valueCounter
                    valueCounter += 1
                }
            }
            
            startRow += 1
            dir = "D"
            print("r")
        }
        
        else if dir == "D" {
            for currRow in startRow...maxRow {
                if result[currRow][currCol] == -1 {
                    result[currRow][currCol] = valueCounter
                    valueCounter += 1
                }
            }
            
            maxCol -= 1
            dir = "L"
            print("d")
        }
        
        else if dir == "L" {
            for currCol in (startCol...maxCol).reversed() {
                if result[currRow][currCol] == -1 {
                    result[currRow][currCol] = valueCounter
                    valueCounter += 1
                }
            }
            
            maxRow -= 1
            dir = "U"
            print("l")
        }
        
        else if dir == "U" {
            for currRow in (startRow...maxRow).reversed() {
                if result[currRow][currCol] == -1 {
                    result[currRow][currCol] = valueCounter
                    valueCounter += 1
                }
            }
            
            startCol += 1
            dir = "R"
            print("u")
        }
    }
    
    return result
}

SpiralMatrixII(n: 3)

