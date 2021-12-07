//: [Previous](@previous)

import Foundation

extension Array {
  var combinationsWithoutRepetition: [[Element]] {
    guard !isEmpty else { return [[]] }
    return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    /*
     k = 2 t = 5 ls =
     [1, 2, 3]
     [2, 3].cwr
     [3].cwr
     [].cwr -> [[]].fm [[]]
     */
  }
}

func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
  var result   = -1
  var auxArray = ls.combinationsWithoutRepetition
  for array in auxArray {
    if array.count == k {
      let value = array.reduce(0, +)
      if value <= t, value > result {
        result = value
      }
    }
  }
  return result
}

var arrMatrix = [1, 2, 3]
print(arrMatrix.combinationsWithoutRepetition)

func combinations(arr: [Int]) -> [[Int]] {
    // base case, return empty if empty
    if arr.isEmpty {return [[]]}
    
    // first element in current array, used to decide on each take or not take
    let first = arr[0]
    // the rest, used for current element not taken
    let rest = Array(arr[1...])
    
    // recursive call, the not take route generated
    let combsWithoutFirst = combinations(arr: rest)
    // the take route
    var combsWithFirst = [[Int]]()
    
    // for each not take route, generate route where you do take
    for comb in combsWithoutFirst {
        let combWithFirst = comb + [first]
        combsWithFirst.append(combWithFirst)
    }
    
    // combine all the not takes choices with take
    return combsWithoutFirst + combsWithFirst
}

print(combinations(arr: [1, 2, 3]))
