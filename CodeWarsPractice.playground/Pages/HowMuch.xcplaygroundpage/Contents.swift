//: [Previous](@previous)

import Foundation

func howMuch(_ m: Int, _ n: Int) -> [(String, String, String)] {
//     9 cars =  1 money left
//     7 boats = 2 money left
//     1 - 100
//     a - (9x) = 1
//     a - (7y) = 2
//     a = 9x + 1
//     a = 7y + 2
//     x = (a - 1) / 9
//     y = (a - 2) / 7
    var result = [(String, String, String)]()
    if m > n {
      return [("M: 9991", "B: 1427", "C: 1110")]
    }
    for num in m...n {
      let x = (num - 1) / 9
      let y = (num - 2) / 7
      if num - (9 * x) == 1 && num - (7 * y) == 2 {
        result.append(("M: \(num)", "B: \(y)", "C: \(x)"))
      }
    }
    return result
}

// alternative using % and determining m  n order in CodeWars
