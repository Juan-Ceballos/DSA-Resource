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
    // or generate all the not take options with rest
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

/*
 Notes when first doing problem
      t = maxDistance >= 0
      ls = list of distances ls.count >= 1
      k = number of times in list willing to visit >= 1
  
      main condition:
      has to drive to t towns
      secondary:
      as close to distance t
      
      note - try not to modify ls
  
      edges
      max distance = 0
      min l in ls > t
      
      store currK
      sort and store ls
      store currTotal
      iterate through sorted ls while not done with arr or currK < k
        - if currTotal - value < 0 continue
        - else subtract value from currTotal
        - add 1 to currK
  
      Check max by ks
      sort store ls
      iterate and grab next k - 1
      add values
      update max if <= t
      if max still == 0 return -1 else return max
    */

// problem done after reviewing
func chooseBestSum2(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
  var max = -1
  let allCombinations = combinations2(ls)
  
  for comb in allCombinations {
    if comb.count == k {
      let totalDistance = comb.reduce(0, +)
      if totalDistance > max && totalDistance <= t {
        max = totalDistance
      }
    }
  }
  
  return max
  
}

func combinations2(_ arr: [Int]) -> [[Int]] {
  if arr.isEmpty {return [[]]}
  
  let first = arr[0]
  let rest = Array(arr[1...])
  
  let combsWithoutFirst = combinations2(rest)
  var combsWithFirst = [[Int]]()
  
  for comb in combsWithoutFirst {
    let combWithFirst = comb + [first]
    combsWithFirst.append(combWithFirst)
  }
  
  return combsWithoutFirst + combsWithFirst
}
