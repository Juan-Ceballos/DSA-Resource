//: [Previous](@previous)

import Foundation

func sumMix(_ arr: [Any]) -> Int {
  var sum = 0
  for element in arr {
    sum += Int("\(element)")!
  }
  return sum
}
