//: [Previous](@previous)

import Foundation

func findOutlier(_ array: [Int]) -> Int {
  /*
  arrSize >= 3
  all even or odd except one
  [1, 2, 3]
  [4, 5, 6]
  iterate array, count odds and evens return * doesn't return parity number
  all we need is the number that is the parity
  I could break up array into two arrays and return the element in the one with size of one
  1) filter into new arr based on %2
  2) check count
  3) if not one filter other condition return element
  */
  var result = array.filter{$0 % 2 == 0}
  if result.count == 1 {
    return result[0]
  } else {
    result = array.filter{$0 % 2 == 1 || $0 % 2 == -1}
      return result[0]
  }
}
