//: [Previous](@previous)

import Foundation

func make2dArray(r: Int, c: Int) {
    for _ in 1...r {
        for _ in 1...c {
            print("[]", terminator: "")
        }
        print("\n")
    }
}

make2dArray(r: 5, c: 4)

func traverse2dArr(matrix: [[Int]]) {
    for arr in matrix {
        for num in arr {
            print(num, terminator: " ")
        }
    }
}

traverse2dArr(matrix: [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
