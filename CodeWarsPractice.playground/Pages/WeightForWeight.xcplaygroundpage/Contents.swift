//: [Previous](@previous)

import Foundation

func orderWeight(_ s: String) -> String {
  /*
  add the digits in the string
  - add mod 10 to 0 divide num by ten repeat while num != 0
  - add the index in a dictionary
  - sort list based on complete dictionary
  */
  print(s)
  var arrS = s.split(separator: " ")
  var weightDict = [String: (Int, Int)]()
  var resultArr = [String]()
  var i = 0
  
  for s in arrS {
    let weight = weigh(Int(s) ?? 0)
    weightDict["\(s), \(i)"] = (weight, Int(s) ?? 0)
    i += 1
  }
  
  let weightsIncreasing = weightDict.sorted {
    ($0.value.0, $0.key) < ($1.value.0, $1.key)
  }.map {"\($0.value.1)"}
  
  print(weightsIncreasing)
  
  print(weightsIncreasing.joined(separator: " "))
  return weightsIncreasing.joined(separator: " ")
}

func weigh(_ s: Int) -> Int {
  var sum = 0
  var tempS = s
  
  while tempS > 0 {
    sum += tempS % 10
    tempS /= 10
  }
  
  return sum
}
