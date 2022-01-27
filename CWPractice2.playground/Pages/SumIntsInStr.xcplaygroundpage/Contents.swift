//: [Previous](@previous)

import Foundation

func sumOfIntegersInString(_ string: String) -> Int {
    if let num = Int(string) {return num}
    var numStr = ""
    for char in string {
      let s = String(char)
      if Int(s) != nil {numStr += s}
      else {numStr += "-"}
    }
    if numStr.isEmpty {return 0}
    let numStrArr = Array(numStr.split(separator: "-")).map{Int($0)!}
    let sum = numStrArr.reduce(0, +)
    return sum
}

/*
iterate string
if Int(s) add to num string "Int(n),"
sprint num string based on ","
reduce array return result
*/

func sumOfIntegersInString2(_ string: String) -> Int {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted).flatMap({Int($0)}).reduce(0, +)
}

func sumOfIntegersInString3(_ string: String) -> Int {
    let result = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        .filter{ return $0.isEmpty == false }
        .map{return Int($0)! }
        .reduce(0, {x, y in x + y})
    return result
}

func sumOfIntegersInString4(_ string: String) -> Int {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted).reduce(0, { $0 + (Int($1) ?? 0) })
}
