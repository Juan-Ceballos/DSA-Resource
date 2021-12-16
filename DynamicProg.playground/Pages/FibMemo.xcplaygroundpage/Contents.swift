//: [Previous](@previous)

import Foundation

func fib(n: Int) -> Int {
    
    var fibs: [Int] = [1, 1]
    (2...n).forEach { (i) in
        fibs.append(fibs[i - 1] + fibs[i - 2])
    }
    return fibs.last!
}

print(fib(n: 4))

func fib2(_ n: Int, _ memo: inout [Int: Int]) -> Int {
  if let fibVal = memo[n] {
    return fibVal
  }
  if n == 0 {return 0}
  else if n <= 2 {return 1}
  memo[n] = fib2(n - 1, &memo) + fib2(n - 2, &memo)
  return memo[n]!
}
var temp = [Int:Int]()
print(fib2(4, &temp))
