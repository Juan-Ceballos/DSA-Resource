//: [Previous](@previous)

import Foundation

func findIt(_ seq: [Int]) -> Int {
  var freqDict = [Int:Int]()
  for num in seq {
    if let count = freqDict[num] {
      freqDict[num] = count + 1
    } else {
      freqDict[num] = 1
    }
  }
  
  for (key, value) in freqDict {
    if value % 2 != 0 {
      return key
    }
  }
  
  return -1
}
