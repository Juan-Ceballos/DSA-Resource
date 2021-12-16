//: [Previous](@previous)

import Foundation

func productFib(_ prod : UInt64) -> (UInt64,UInt64,Bool) {
  /*
  given the product of two fib numbers f(n) n  + 1
  0, 1, 1, 2, 3
  - traverse through a fib sequence at n and n + 1 and find and store two numbers that produce >= to input
    1) helper function fib(n)
      recursive call of fib
    2) currV variable to store product
    3) iterate while fn and fn + 1 < prod
       - store f(n)&+1
       - set currV
    4) compare currV to prod
  */
  var result: (UInt64,UInt64,Bool) = (0, 0, false)
  var currV: UInt64 = 0
  var n: UInt64 = 0
  var num1: UInt64 = 0
  var num2: UInt64 = 0
  var temp1 = [UInt64:UInt64]()
  var temp2 = [UInt64:UInt64]()
  while currV < prod {
    num1 = fib(n, &temp1)
    num2 = fib(n + 1, &temp2)
    n += 1
    currV = num1 * num2
  }
  result.0 = num1
  result.1 = num2
  result.2 = currV == prod
  return result
}
func fib(_ n: UInt64, _ memo: inout [UInt64: UInt64]) -> UInt64 {
  if let fibVal = memo[n] {return fibVal}
  if n == 0 {return 0}
  if n <= 2 {return 1}
  memo[n] = fib(n - 1, &memo) + fib(n - 2, &memo)
  return memo[n]!
}
