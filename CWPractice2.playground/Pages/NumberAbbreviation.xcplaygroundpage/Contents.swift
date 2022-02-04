//: [Previous](@previous)

import Foundation

func condense(_ num: Int) -> String {
  //print(num)
  if num < 1000 && num > -1000 {return String(num)}
  let x = 32455 // 1,200 - 12,000 - 120,000 mil: 1,000,000 - 10,000,000 - 100,000,000
  // 4 % 3 = 1
  // 5 % 3 = 2
  //6 % 3  = 0
 // 7 % 3  = 1
 // 8 % 3 = 2
  // 9 % 3 = 0
  // always looking at 1.0 10.0 or 100.0
  //let xstr = String(format: "", x)
  //print(xstr)
  let letter = getLetter(num)
  var num2 = 0.0
  if num < 0 {
    num2 = formatNum((num * -1))
  }
  else{num2 = formatNum(num)}
  //print(num2)
  let nf = NumberFormatter()
  nf.maximumFractionDigits = 1
  //nf.minimumFractionDigits = 2
  nf.roundingMode = .halfUp
  var n = nf.string(for: num2)!
  let n2 = nf.string(for: 1.0)!
  print(n2)
  if n == "1" {n = "1.0"}
  if num < 0 {
    if !n.contains(".") {n += ".0"}
    return "-\(n)\(letter)"
  }
  else{
    if !n.contains(".") {n += ".0"}
    return "\(n)\(letter)"
  }
}

func formatNum(_ num: Int) -> Double {
  let strNumArr = Array(String(num)).map{String($0)}
  let count = strNumArr.count
  switch count % 3 {
    case 0:
    let shortNum = strNumArr[0...4].joined()
    let shortNumConverted = (Int(shortNum)!)
    let a = Double(shortNumConverted) / 100.0
    return a
    // [1, 2, 0] 120 / 100.0 1.20
    case 1:
      let shortNum = strNumArr[0...2].joined()
      let shortNumConverted = (Int(shortNum)!)
    let a = Double(shortNumConverted) / 100.0
    return a
    case 2:
      let shortNum = strNumArr[0...3].joined()
      let shortNumConverted = (Int(shortNum)!)
    let a = Double(shortNumConverted) / 100.0
    return a
    default:
      return 0.0
  }
  return 0.0
}

func getLetter(_ num: Int) -> String {
  let val = abs(num)
  switch val {
    case 1000..<1_000_000:
      return "k"
    case 1_000_000..<1_000_000_000:
      return "m"
    case 1_000_000_000..<1_000_000_000_000:
      return "b"
    case 1_000_000_000_000...Int.max:
      return "t"
    default: return ""
  }
}

 
/*
 -1000 - 1000 return String(Int)!
  1200 -> 1.2k
- determine wheter input is k, m, b, or t
- function takes int returns string
  - check num value return string based on range
*/
