//: [Previous](@previous)

import Foundation

func countTargets(_ n: Int, _ sequence: [Int]) -> Int {
    var count = 0
    for (index, element) in sequence.enumerated() {
      if index >= n {
        if element == sequence[index - n] {
          count += 1
        }
      }
    }
    return count
}
