//: [Previous](@previous)

import Foundation

func spiralMatrix(matrix: [[Int]]) -> [Int] {
    /*
     traverse matrix in spiral
     meet boundaries, store traversed positions bool
     */
    
    var visited = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    var currCol = 0
    var currRow = 0
    var result = [Int]()
    //print(visited)
    
    enum Directions: Int {
        case down
        case up
        case right
        case left
    }
    
    var currDirection = Directions.right
    
    var arrVisited = visited.flatMap {$0}
    while arrVisited.contains(false) {
        switch currDirection {
        case .right:
            result.append(matrix[currRow][currCol])
            visited[currRow][currCol] = true
            arrVisited = visited.flatMap {$0}
            if currCol < matrix[0].count - 1 {
                let nextSpaceToVisit = visited[currRow][currCol + 1]
                if nextSpaceToVisit == false {
                    currCol += 1
                } else {
                    currRow += 1
                    currDirection = .down
                }
            } else {
                currRow += 1
                currDirection = .down
            }
        case .down:
            result.append(matrix[currRow][currCol])
            visited[currRow][currCol] = true
            arrVisited = visited.flatMap {$0}
            if currRow < matrix.count - 1 {
                let nextSpaceToVisit = visited[currRow + 1][currCol]
                if nextSpaceToVisit == false {
                    currRow += 1
                } else {
                    currCol -= 1
                    currDirection = .left
                }
            } else {
                currCol -= 1
                currDirection = .left
            }
        case .left:
            result.append(matrix[currRow][currCol])
            visited[currRow][currCol] = true
            arrVisited = visited.flatMap {$0}
            if currCol > 0 {
                let nextSpaceToVisit = visited[currRow][currCol - 1]
                if nextSpaceToVisit == false {
                    currCol -= 1
                } else {
                    currRow -= 1
                    currDirection = .up
                }
            } else {
                currRow -= 1
                currDirection = .up
            }
        case .up:
            result.append(matrix[currRow][currCol])
            visited[currRow][currCol] = true
            arrVisited = visited.flatMap {$0}
            if currRow > 0 {
                let nextSpaceToVisit = visited[currRow - 1][currCol]
                if nextSpaceToVisit == false {
                    currRow -= 1
                } else {
                    currCol += 1
                    currDirection = .right
                }
            } else {
                currCol += 1
                currDirection = .right
            }
        }
    }
    return result
}

print(spiralMatrix(matrix: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
