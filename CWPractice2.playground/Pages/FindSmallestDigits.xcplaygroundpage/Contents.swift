//: [Previous](@previous)

import Foundation

func smallest(_ n: Int) -> (Int, Int, Int) {
  var i = 0
  var j = 0
  var val: Character = "*"
  var nArr = Array(String(n))
  var nArr2 = Array(String(n))
  var sNArr = nArr.sorted {$0 < $1}
  for (index, char) in nArr.enumerated() {
    if nArr[index] != sNArr[index] {
      j = index
      val = sNArr[index]
      break
    }
  }
  // same low num
  // index i j reversed output
  for index in j + 1..<nArr.count {
    if nArr[index] == val {
      i = index
    }
  }
  
  var temp = i
  while temp > j && temp > 0 {
    nArr.swapAt(temp, temp - 1)
    temp -= 1
  }
  
  var temp2 = j
  while temp2 < i && temp2 < nArr2.count {
    nArr2.swapAt(temp2, temp2 + 1)
    temp2 += 1
  }
  
  let result = Int(String(nArr))!
  
  let small = min(i, j)
  let big = max(i, j)
  
  if nArr == nArr2 {return (result, small, big)} else {return (result, i, j)}
}

/*
  209917
  012799
  j = 0
  i = 1
  get the smallest number
  by getting index of number i and placing in index j for smallest number
  
  1 digit
  3 -> (3, 0, 0) return n
  2 digit
  23 -> () find smaller between two swap
  3 digit
  213 -> find smallest number move to front
  132 ->
  sort number 123
  iterate through original number if there's a mismatch store index(i) and value
  iterate through rest of number and first first value store index
  perform swap return tuple
  */

func smallest2(_ n: Int) -> (Int, Int, Int) {
    var min = n
    var i = 0
    var j = 0
    for removeIndex in n.description.indices {
        var strN = n.description
        let digit = strN.remove(at: removeIndex)
        for insertIndex in n.description.indices {
            var newStrN = strN
            newStrN.insert(digit, at: insertIndex)
            if Int(newStrN)! < min {
                min = Int(newStrN)!
                i = newStrN.distance(from: newStrN.startIndex, to: removeIndex)
                j = newStrN.distance(from: newStrN.startIndex, to: insertIndex)
            }
        }
    }
    return (min, i, j)
}

print(smallest2(539))
