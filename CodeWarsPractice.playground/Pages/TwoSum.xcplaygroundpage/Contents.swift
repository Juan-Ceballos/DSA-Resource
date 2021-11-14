//: [Previous](@previous)

import Foundation

func twosum(numbers: [Double], target: Double) -> [Int] {
    if numbers.count == 2 {
      return [0, 1]
    }
    
    var sortedNumbers = numbers.sorted {$0 < $1}
    
    for (index, num) in numbers.enumerated() {
      let pairValue = target - num
      if pairValue < 0 {
        continue
      } else {
        if let existingValue = binarySearch(sortedNumbers, pairValue) {
          let pairIndex = numbers.lastIndex(of: existingValue)
          return [index, pairIndex!]
        }
      }
    }
    
    return [-1]
  }
  
  func binarySearch(_ arr: [Double], _ target: Double) -> Double? {
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
      let middle = low + (high - low) / 2
      let middleValue = arr[middle]
      if middleValue == target {
        return middleValue
      } else if middleValue > target {
        high = middle - 1
      } else {
        low = middle + 1
      }
    }
    
    return nil
  }


func twosum2(numbers: [Double], target: Double) -> [Int] {
    for i in 0..<(numbers.count-1) {
      for j in (i+1)..<numbers.count {
        if numbers[i] + numbers[j] == target {
          return [i,j]
        }
      }
    }
    return [];
  }
