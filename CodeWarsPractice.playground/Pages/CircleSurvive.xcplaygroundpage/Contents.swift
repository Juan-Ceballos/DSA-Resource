//: [Previous](@previous)

import Foundation

func josephusSurvivor(_ n: Int, _ k: Int) -> Int {
  var arr = Array(1...n)
  var result = arr
  var resI = [Int]()
  var temp = [Int]()
  var curr = 0
  
  while result.count > 4 {
    for (index, element) in result.enumerated() {
      if (index + 1) % 3 == 0 {
        resI.append(index)
      }
    }
    for i in resI {
      result[i] = -2
    }
    let pCount = result.count - 1
    result = result.filter{$0 != -2}
    if result.count < k {
      let start = Array(repeating: -1, count: k - result.count)
      result = start + result
    }
    let rem = pCount - resI[resI.count - 1]
    if rem != 0 {
      let resSub = Array(result[((pCount - 1) - rem)...])
      result = (resSub + result)
      result = Array(result[0..<((result.count - 1) - resSub.count + 1)])
      print(result)
      //return -1
    }
  }
  //print(result)
  return -1
}

func josephusSurvivor2(_ n: Int, _ k: Int) -> Int {
    var answer = Array(1...n)
    var stand = 0
    while answer.count != 1 {
        stand += (k - 1)
        if stand >= answer.count {
            stand %= answer.count
        }
        answer.remove(at: stand)
    }
    return answer.first!
}

/*
 while answer.count != 1:
 
 [1, 2, 3, 4, 5, 6, 7] answer
 stand = 0, k = 3
 stand += 2
 stand >= answer.count {}
 answer.remove(at: stand = 2)
 [1, 2, 4, 5, 6, 7]
 stand = 2 + 2 = 4
 stand >= answer.count {}
 answer.remove(at: stand = 4)
 [1, 2, 4, 5, 7]
 stand = 4 + 2 = 6
 stand(6) >= answer.count(5) {
    stand %= answer.count
    6 % 5 = 1
    stand = 1
 }
 answer.remove(at: stand = 1)
 [1, 4, 5, 7]
 stand += 2 (1 + 2 = 3)
 stand(3) >= answer.count(4) {}
 answer.remove(at: 3)
 [1, 4, 5]
 stand += 2 (3 + 2) = 5
 if stand(5) >= answer.count(3) {
    stand %= answer.count
    5 % 3 = 2
    stand = 2
 }
 answer.remove(at: 2)
 [1, 4]
 stand += 2 2+2 = 4
 if stand(4) >= answer.count(2) {
    stand %= answer.count
    4 %= 2 = 0
    stand = 0
 }
 answer.remove(at: 0)
 [4]
 answer.count now == 1 end loop
 
 return answer.first = 4
 */

func josephusSurvivor3(_ n: Int, _ k: Int) -> Int {
    if n == 1 {
      return n
    } else {
      return ((k-1) + josephusSurvivor3(n-1, k)) % n + 1
    }
}
