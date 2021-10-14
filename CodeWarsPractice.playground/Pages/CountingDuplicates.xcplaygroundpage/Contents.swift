//: [Previous](@previous)

import Foundation

func countDuplicates(_ s:String) -> Int {
  var freqDict = [Character: Bool]()
  var arr = [Character]()
  var noOfDupes = 0
  let sL = s.map {Character($0.lowercased())}
  for char in sL {
    if let current = freqDict[char] {
      if !arr.contains(char) {
        arr.append(char)
        noOfDupes += 1
      }
    } else {
      freqDict[char] = true
    }
  }
  return noOfDupes
}
