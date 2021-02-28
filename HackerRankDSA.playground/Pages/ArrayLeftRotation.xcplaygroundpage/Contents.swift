//: [Previous](@previous)

import Foundation

func rotLeft(a: [Int], d: Int) -> [Int] {
    let tempArr = a + a
    print(tempArr)
    let aSize = a.count - 1
    let resultSlice = Array(tempArr[d...aSize + d])
    print(resultSlice)
    return resultSlice
}

rotLeft(a: [1, 2, 3, 4, 5], d: 4)
