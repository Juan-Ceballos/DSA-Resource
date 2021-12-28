//: [Previous](@previous)

import Foundation

func combos(arr: [Int]) -> [[Int]] {
    if arr.isEmpty {
        return [[]]
    }
    
    let first = arr[0]
    let rest = Array(arr[1...])
    
    let combsWithoutFirst = combos(arr: rest)
    
    var combsWithFirst = [[Int]]()
    
    for comb in combsWithoutFirst {
        let combWithFirst = [first] + comb
        combsWithFirst.append(combWithFirst)
    }
    
    return combsWithoutFirst + combsWithFirst
    
}


