//: [Previous](@previous)

import Foundation

func fakeBin(digits: String) -> String {
    var bin = ""
    for digit in digits {
        if Int("\(digit)")! < 5 { // Int(String(digit))!
            bin += "0"
        } else {
            bin += "1"
        }
    }
    return bin
}

// -----

func fakeBin2(digits: String) -> String {
  
  return String(digits.map { Int(String($0))! >= 5 ?  "1" : "0" })
}

func fakeBin3(digits: String) -> String {
  return digits.map({ $0 < "5" ? "0" : "1" }).joined()
}
