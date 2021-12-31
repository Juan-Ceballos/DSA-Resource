//: [Previous](@previous)

import Foundation

//************* Creating Matrix *************
var theatre = [[Int]]()

for row in 0..<5 {
    var currRow = [Int]()
    for seat in 0..<10 {
        currRow.append(0)
    }
    theatre.append(currRow)
}

//print(theatre)

var theatre2 = Array(repeating: Array(repeating: 0, count: 10), count: 5)
print(theatre2)

//************* Updating Matrix *************

for row in 0...1 {
    for col in 0..<theatre2[row].count {
        theatre2[row][col] = 1
    }
}

print(theatre2)

