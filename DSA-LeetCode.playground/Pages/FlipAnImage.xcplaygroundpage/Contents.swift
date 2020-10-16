//: [Previous](@previous)

import Foundation

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    // each row reversed
    // inverted each number flipped
    /*
     Questions:
     empty: return []
     
     Algorithm:
     go to each array
     reverse the array
     if 0 set to 1, if 1 set to 0
     
     Psuedo:
     for arr in input :
     arr.reversed
     for element in arr
     if statement
     */
    
    var tempMatrix = [[Int]]()
    
    for rowCount in 0...A.count - 1 {
        tempMatrix.append(A[rowCount].reversed())
        for count in 0...A[rowCount].count - 1 {
            if tempMatrix[rowCount][count] == 0 {
                tempMatrix[rowCount][count] += 1
            } else {
                tempMatrix[rowCount][count] -= 1
            }
        }
    }
    
    return tempMatrix
    
}
