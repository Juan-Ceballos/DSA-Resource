//: [Previous](@previous)

import Foundation

func findUniq(_ arr: [Double]) -> Double {
  // your code here
  /*
  at least 3 numbers [1, 1, 2]
  find unique number
  [1, 1, 2]
  [0, 1, 1]
  */
  let temp = arr.sorted {$0 < $1}
  if temp[0] != temp[1] {
    return temp[0]
  }
  return temp[arr.count - 1] // unique integer in the array
}
