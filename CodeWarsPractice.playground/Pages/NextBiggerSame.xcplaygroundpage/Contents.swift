//: [Previous](@previous)

import Foundation
// too slow for bigger numbers
func nextBigger(num: Int) -> Int? {
  /*
  1) from num + 1 to num * 10 - 1 for loop
  2) compare numbers sorted
  123, 124, 125,
  
  store all nums from step 1
  123 - 132 -
     finding the first number with the same digits as input starting from (input + 1)
  */
  let arrNum = Array(String(num)).sorted {$0 < $1}
  print(arrNum)
  for n in num + 1..<num * 10 {
    let nS = Array(String(n)).sorted {$0 < $1}
    if nS == arrNum {
      return n
    }
  }
  
  return nil
}

// my convoluted solution with notes
func nextBigger2(num: Int) -> Int? {
  /*
  1) from num + 1 to num * 10 - 1 for loop
  2) compare numbers sorted
  123, 124, 125,
  
  --------------------
  123 - 132 -
  
  find all combinations of number
  sort them
  find first number grater than input
  ---------------------
  
  find next number bigger than first digit
  1, 23
  102
  120
  if number bigger than first number exist
  sort the rest
  return
  ----------
  1 -> nil
  23 -> 32 (swap)
  234 -> 2, 34 - > 243
  210 -> 2, 10 -> nil
  251 -> 2, 51 -> 5, 21 -> 512
  2432 -> 24, 32 23 -> 2 432 -> 2432 3
  251 -> 2 51, -> 25 1 -> 521 -> 5, 21
  go to last two numbers
  see if can swap for bigger number, if cant swap and move up to compare from second num
  rinse repeat
  */
  print(num)
  if num < 10 {
    return nil
  }
  
  var arrNum = Array(String(num))
  let setNum = Set(arrNum)
  if setNum.count == 1 {
    return nil
  }
  
  for (index, num) in arrNum.enumerated().reversed() {
    if index - 1 >= 0 {
    let lastDigit = num
    let secondLastDigit = arrNum[index - 1]
    if lastDigit > secondLastDigit {
      var rest = Array(arrNum[index...]).sorted {$0 < $1}
      //print(rest)
      for (index, val) in rest.enumerated() {
        if val > secondLastDigit {
          rest.swapAt(index, 0)
          break
        }
      }
      //print(rest)
      
      var i = index
      for element in rest {
        arrNum[i] = element
        i += 1
      }
      arrNum.swapAt(index, index - 1)
      var restB = Array(arrNum[index...]).sorted {$0 < $1}
      print(restB)
      let restBSorted = restB.sorted {$0 < $1}
      i = index
      for element in restB {
        arrNum[i] = element
        i += 1
      }
      //print(arrNum)
      return Int(String(arrNum))
    }
    }
    
      // 251 -> 25, 1 -> 521
      // 251 -> 251 -> 25, 1 -> 521
    // if theres a swap sort everything before?
    //251 -> 215 -> 251 521 ->
  }
//   if arrNum.count == 2 {
//     arrNum.swapAt(0, 1)
//     let res = String(arrNum)
//     return Int(res)
//   }
  return nil
}

// didnt use this
func permutations(_ n:Int, _ a: inout Array<Character>) {
    if n == 1 {print(a); return}
    for i in 0..<n-1 {
        permutations(n-1,&a)
        a.swapAt(n-1, (n%2 == 1) ? 0 : i)
    }
    permutations(n-1,&a)
}
