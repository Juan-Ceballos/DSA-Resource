//: [Previous](@previous)

import Foundation

func diamond(_ size: Int) -> String? {
  if size % 2 == 0 || size < 0 {
    return nil
  }
  
  var result = ""
  
  for y in 1...size {
    for num in 0..<(size - y) / 2 {
      result += " "
    }
    for x in 1...y {
      if y % 2 != 0 {
        result += "*"
      }
    }
    
    while result.last == " " {
      result.remove(at: result.index(before: result.endIndex))
    }
    
    if y % 2 == 0 {
      result += "\n"
    }
  }
  
  for y in (1..<size).reversed() {
    for num in (0..<((size - y) / 2)).reversed() {
      result += " "
    }
    for x in 1...y {
      if y % 2 != 0 {
        result += "*"
      }
    }
    
    while result.last == " " {
      result.remove(at: result.index(before: result.endIndex))
    }
    
    if y % 2 == 0 {
      result += "\n"
    }
  }
  
  result += "\n"
  return result
}

func diamond2(_ size: Int) -> String? {
    guard size > 0 && size % 2 == 1 else {
        return nil
    }
    var diamond = ""
    let centerRow = size/2 + 1
    for row in 1...size {
        let spaces = abs(centerRow - row)
        diamond += String(repeating: " ", count: spaces) + String(repeating: "*", count: size-spaces*2) + "\n"
    }
    return diamond
}
