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
 //------ Combinations With Notes ------

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
