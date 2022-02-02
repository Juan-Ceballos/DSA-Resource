//: [Previous](@previous)

import Foundation

func accum(_ s: String) -> String {
  var res = ""
  for (index, char) in s.enumerated() {
    let seqRes = repeatStr(String(char).lowercased(), index)
    if index < s.count - 1 {
        res += "\(String(char).uppercased())\(seqRes)-"
    } else {
        res += "\(String(char).uppercased())\(seqRes)"
    }
  }
  
  print(res)
  return res
}

func repeatStr(_ s: String, _ n: Int) -> String {
  var res = ""
  for num in 0..<n {
    res += s
  }
  return res
}

//------------------------
// .joined(separator: "-") for in between without having separator at end of string
func accum2(_ str: String) -> String {
    return str.enumerated().map {
        repeatElement(String($1), count: $0 + 1)
            .joined()
            .capitalized
    }
        .joined(separator: "-")
}

func accum3(_ str: String) -> String {
    return str.enumerated().map {
        String(repeating: $1, count: $0 + 1).capitalized
    }.joined(separator: "-")
}

func accum4(_ s: String) -> String {
    var result = ""
    var count = 1
    
    for character in s {
        result += "\(character)".uppercased()
        for _ in 1..<count {
            result += "\(character)".lowercased()
        }
        count += 1
        result += s.count == count - 1  ? "" : "-"
    }
    
    return result
}

func accum5(_ s: String) -> String {
    var result = [String]()
    
    for (i, value) in s.lowercased().enumerated() {
        var string = Array(repeating: value, count: i+1).map { String($0) }.joined().capitalized
        result.append(string)
    }
    
    return result.joined(separator: "-")
}

func accum6(_ s: String) -> String {
    return String(s.enumerated().map { String(repeating: $1, count: $0 + 1).capitalized + "-" }.reduce("", +).dropLast())
}

func accum7(_ s: String) -> String {
    var phrase = ""
    var count = 1
    for character in s {
        let add = String(repeating: character, count: count).capitalized
        phrase.append(add)
        if count < s.count {
          phrase.append("-")
        }
        count += 1
    }
    return phrase
}
