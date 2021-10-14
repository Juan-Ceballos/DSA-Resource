//: [Previous](@previous)

import Foundation

func solution(_ num: Int) -> Int {
  guard num > 0 else {
    return 0
  }
  
  let arr = Array(3..<num)
  let multiplesSum =
  arr.filter
  {$0 % 3 == 0 || $0 % 5 == 0}.reduce(0, +)
  return multiplesSum
}

