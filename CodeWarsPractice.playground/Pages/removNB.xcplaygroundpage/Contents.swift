//: [Previous](@previous)

import Foundation

// given range 1 to n find 2 numbers that product is equal to sum of range - the two numbers a, b
// return every pair that does so, (a,b) (b,a) counts
func removNb(_ n: Int) -> [(Int,Int)] {
  var result = [(Int, Int)]()
  let sumSeries = (n * (1 + n)) / 2
  for num in (1...n).reversed() {
    let b = num
    let a = (sumSeries - b) / (b + 1)
    if a < n {
      if a * b == sumSeries - a - b {
        result.append((a,b))
      }
    }
  }
  return result
}
