//: [Previous](@previous)

import Foundation

func validateQueens(_ matrixSize: Int, input: [Int]) -> Bool {

  var checkSet = Set<Int>()

  for (x, y) in input.enumerated() {
    // Row check
    if checkSet.contains(y) {
      return false
    } else {
      checkSet.insert(y)
    }

    // Diagonal check
    var stepCount = 0

    // Top left
    while (y + stepCount) < matrixSize && (x - stepCount) > 0 {
      stepCount += 1
      if input[x - stepCount] == y + stepCount { return false }
    }

    stepCount = 0
    // Top right
    while (y + stepCount) < matrixSize && (x + stepCount) < matrixSize - 1 {
      stepCount += 1
      if input[x + stepCount] == y + stepCount { return false }
    }

    stepCount = 0
    // Bottom left
    while (y - stepCount) > 1 && (x - stepCount) > 0 {
      stepCount += 1
      if input[x - stepCount] == y - stepCount { return false }
    }

    stepCount = 0
    // Bottom right
    while (y - stepCount) > 1 && (x + stepCount) < matrixSize - 1 {
      stepCount += 1
      if input[x + stepCount] == y - stepCount { return false }
    }

  }

  return true
}

print(validateQueens(6, input: [6, 4, 2, 1, 3, 5]))
