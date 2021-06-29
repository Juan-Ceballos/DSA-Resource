//: [Previous](@previous)

import Foundation

// constant time
func take(_ arr: [Int], _ n: Int) -> [Int] {
  return Array(arr.prefix(n))
}

// my solution O(n)
func take2(_ arr: [Int], _ n: Int) -> [Int] {
  
  guard !arr.isEmpty else {
    return []
  }
  
  if n >= arr.count {
    return arr
  }
  
  var result = [Int]()
  
  
  for num in 0..<n {
    result.append(arr[num])
  }
  
  return result
  
}

