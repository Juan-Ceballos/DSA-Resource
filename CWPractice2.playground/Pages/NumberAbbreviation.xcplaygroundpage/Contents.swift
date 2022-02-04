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

func condense2(_ n: Int) -> String {
    let num = Double(n)
    for (powNum, suffix) in zip([4.0, 3.0, 2.0, 1.0], ["t", "b", "m", "k"]) {
        let abbreviation = pow(1000.0, powNum)
        if abs(num) >= abbreviation {
            return String(format: "%.1f", (num / abbreviation)) + suffix
        }
    }
    return "\(n)"
}

//-----------------
enum Suffix: String {
  case thousand = "k"
  case million = "m"
  case billion = "b"
  case trillion = "t"
  
  static func fromInt(number: Int) -> Suffix? {
    if (number >= 1000000000000) {
      return .trillion
    } else if (number >= 1000000000) {
      return .billion
    } else if (number >= 1000000) {
      return .million
    } else if (number >= 1000) {
      return .thousand
    } else {
      return .none
    }
  }
  
  func condenseNumber(number: Int) -> String {
    switch self {
      case .thousand: return String(format: "%.1f", Double(number) / 1000.0) + self.rawValue
      case .million: return String(format: "%.1f", Double(number) / 1000000.0) + self.rawValue
      case .billion: return String(format: "%.1f", Double(number) / 1000000000.0) + self.rawValue
      case .trillion: return String(format: "%.1f", Double(number) / 1000000000000.0) + self.rawValue
    }
  }
}

func condense3(_ num: Int) -> String {
  let suffix = Suffix.fromInt(number: abs(num))
  return suffix?.condenseNumber(number: num) ?? String(num)
}

//-------------------

func condense4(_ num: Int) -> String {
  func pow(_ num: Int, _ x: Int) -> Int {
    var sum = 1
    for _ in 1 ... x {
      sum *= num
    }
    return sum
  }
  func around(_ strNum: String) -> String {
    var count = 0
    if strNum.count % 3 == 0 {
      if strNum.count < 7 {
      count = strNum.count - (strNum.count / 3 + 1)
      } else {
        count = strNum.count - 3
      }
    } else {
      count = strNum.count - (strNum.count % 3)
    }
    let doubleNum = Double(strNum)
    let integer = pow(10, count)
    let final = doubleNum! / Double(integer)
    return String(format: "%.1f", final)
  }
  
  let stringNumber: String = String(abs(num))
  
  switch num {
  case 0 ... 999: return stringNumber
  case -999 ... 0 : return  "-" + stringNumber
  case 1_000 ... 999_999: return around(stringNumber) + "k"
  case -999_999 ... -1_000: return "-" + around(stringNumber) + "k"
  case 1_000_000 ... 999_999_999: return around(stringNumber) + "m"
  case -999_999_999 ... -1_000_000: return "-" + around(stringNumber) + "m"
  case 1_000_000_000 ... 999_999_999_999: return around(stringNumber) + "b"
  case -999_999_999_999 ... -1_000_000_000: return "-" + around(stringNumber) + "b"
  case 1_000_000_-000_000 ... 999_999_999_999_999: return around(stringNumber) + "t"
  case -999_999_999_999_999 ... -1_000_000_000_000: return "-" + around(stringNumber) + "t"
  default:
    return stringNumber
  }
}

//---------------

func condense5(_ num: Int) -> String {
    let n = num < 0 ? -num : num
    var numStr = String(n)
    let (dotIndex, tag) = n < 1000000000000 ? n < 1000000000 ? n < 1000000 ? n < 1000 ? (0, "") : (-3,"k") : (-6,"m") : (-9,"b") : (-12,"t")
    numStr.insert(".", at: numStr.index(numStr.endIndex, offsetBy: dotIndex))
    return tag == "" ? String(num) : num > 0 ? String(format: "%.1f", Double(numStr)!) + tag : "-" + String(format: "%.1f", Double(numStr)!) + tag
}
