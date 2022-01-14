//: [Previous](@previous)

import Foundation

// APPROACH 1: Too slow maybe
func listSquared(_ m: Int, _ n: Int) -> [(Int, Int)] {
    /*
      divisors of numbers
      square each number
      sum of these numbers
      the sum is a number that has a square root
      questions
      find all nums between m and n with divisors that the sum of squared is a square
      in: m, n
      out: [(numWithDivisorsThatHaveSum, sumOfSquares)]
      ex: (42), 1, 2, 3, 21, 14, 6, 7 = squared = (2500)
  
      1 <= m <= n
      brute force
      1) go through each number between m and n inclusive
      2) for every mod 0 in said number square and add to sum memoize function
      3) check if sum has clean square root
      4) if so add num and sum to tuple and into tuple array
  
  
      
    */
  var result = [(Int, Int)]()
  
  if m == 1 && n == 1 {
    return [(1, 1)]
  }
  
  var divisors = Array(m...n)
  for num in divisors {
    var memo = [Int: (Int, Int)?]()
    if let res = squareMath(num, &memo) {
        result.append(res)
    }
  }
  //print(result)
  return result
}

func squareMath(_ num: Int, _ memo: inout [Int: (Int, Int)?]) -> (Int, Int)? {
  if let sol = memo[num] {
    return sol
  }
  
  let values = divisors(num)
  print(values)
  let checkSquare = values.reduce(0, +)
  for val in 1...(checkSquare / 2) + 1 {
    if val * val == checkSquare {
      memo[num] = (num, checkSquare)
      return memo[num]!
    }
  }
  memo[num] = nil
  return nil
}

func divisors(_ num: Int) -> [Int] {
  var result = [Int]()
  
  for n in 1...num {
    if num % n == 0 {
      result.append(n * n)
    }
  }
  
  return result
}
//----------------
func getDivisors2(_ x:Int) -> [Int]{
    let sqr = sqrt(Double(x))
    var list = [Int]()
    for i in 1..<Int(sqr)+1 {
        if x % i == 0 {
            list.append(i)
            if i != (x/i) {
                list.append((x/i))
            }
        }
    }
    return list
}

func numberIsSquare2(_ x: Int) -> Bool{
    return Int(sqrt(Double(x))) * Int(sqrt(Double(x))) == x
}

func listSquared2(_ m: Int, _ n: Int) -> [(Int, Int)] {
    var list = [(Int, Int)]()
    for value in m ... n{
        let sumOfDivisors = getDivisors2(value).map{$0 * $0}.reduce(0, +)
        if numberIsSquare2(sumOfDivisors){
            list.append((value, sumOfDivisors))
        }
    }
    return list
}
