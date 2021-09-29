//: [Previous](@previous)

//
/*
Questions:
input: string, most common character, ignore white space
output: the character, string, empty return empty

in/out
("Hello World!") => "l"
("Hello World!!!!") => "!"
("abacaba") => "a"
("") => ""
(llww) => l
("lwlw") => "l"
("lwLw") => "l"

algo
1) iterate through string
2) add non empty characters, into a freq dictionary, lowercase as add to freq.
3) find the highest value, if there's a tie compare firstindex of each ties character, >=
4) return said char
*/

func mostCommonChar(str: String) -> String {
  var freqDict = [Character:Int]()
  var mcl = [Character]()
  var strTemp = str.filter{String($0) != " "}
  //print("\(strTemp) hello")
  var maxValue = 0
  var commonLetter = ""
  var earliestMcl = ""
  var earliestIndex = Int.max
  var strTempArr = Array(strTemp)
  //print(strTempArr)
  if str == "" {
    return ""
  }

  for char in strTemp {
    if let count = freqDict[char] {
    freqDict[char] = count + 1
    } else {
    freqDict[char] = 1
    }
  }
  //print(freqDict)

  for (key, value) in freqDict {
    if value > maxValue {
      commonLetter = String(key)
      maxValue = value
    }
  }

  for (key, value) in freqDict {
    if value == maxValue {
      mcl.append(key)
    }
  }

  for letter in mcl {
    let index = strTempArr.firstIndex(of: letter) ?? Int.max
    if index < earliestIndex {
      earliestMcl = String(letter)
      earliestIndex = index
    }
  }

  print(earliestMcl)
  return earliestMcl
}

mostCommonChar(str: "Hello World!")
mostCommonChar(str: "")
mostCommonChar(str: "Hello World!!!!")
mostCommonChar(str: "abacaba")
mostCommonChar(str: "lwlw")
mostCommonChar(str: "lllww")
mostCommonChar(str: "lwLw")
