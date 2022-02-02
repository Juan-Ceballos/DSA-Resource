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
    // map digits string, each char casted to string and then int
    // then do ternery on >= 5 and is added to map arr as 1 or 0 char
    // arr of chars is casted to string
  return String(digits.map { Int(String($0))! >= 5 ?  "1" : "0" })
}

func fakeBin3(digits: String) -> String {
    // map a string ternery on char for '0' or '1' then arr of chars .joined to get string
  return digits.map({ $0 < "5" ? "0" : "1" }).joined()
}

let sampleArr = ["h", "e", "l", "l", "o"]
let str1 = sampleArr.joined()
print(str1)

let sampleStr = "99992"
let arr1 = sampleStr.map{$0}
print(arr1[0])
