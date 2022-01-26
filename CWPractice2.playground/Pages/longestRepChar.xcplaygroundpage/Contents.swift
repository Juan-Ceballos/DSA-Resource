//: [Previous](@previous)

import Foundation

func longestRepetition(_ s: String) -> [String: Int]{
  /*
  input: string, s
  output: [(char): number of times char appears consec]
  if tie return first
  empty return ["": 0]
  
  abbc
  1) iterate through string and store all consec chars
  2) iterate through stored and grab largest count
  
  1) iterate through string and store consec arr
  2) create next one if count is larger replace var
  */
  
  var longestArr = [String]()
  var currArr = [String]()
  if s.isEmpty {return ["": 0]}
  var currC = s[s.startIndex]
  for char in s {
    if currC == char {
      currArr.append(String(char))
    } else {
      currC = char
      if currArr.count > longestArr.count {
        longestArr = currArr
        currArr = [String(currC)]
      } else {
        currArr = [String(currC)]
      }
    }
  }
  if currArr.count > longestArr.count {
    longestArr = currArr
  }
  print(longestArr)
  return [longestArr[0]: longestArr.count]
}

func longestRepetition2(_ s: String) -> [String: Int]{
  var current = ("", 0)
  var most = ("", 0)
  for char in s.map { String($0) } {
    if char != current.0 { current = (char, 1) } else { current.1 += 1 }
    if current.1 > most.1 { most = current }
  }
  
  return [most.0: most.1]
}

func longestRepetition3(_ s: String) -> [String: Int]{
  var uniqueCharacters = ""
        var maxCount = 0
        var maxOccurringCharacter = ""
  for char in s {
    if uniqueCharacters.contains(char) {
      uniqueCharacters += String(char)
    }
     else if uniqueCharacters.contains(char) != true{
        uniqueCharacters = ""
 uniqueCharacters += String(char)
      }
    let count = Array(uniqueCharacters).filter{$0 == char}.count
    if count > maxCount {
      maxCount = 0
      maxCount += count
      maxOccurringCharacter = String(char)
      print(uniqueCharacters)
      }
    }
  return [maxOccurringCharacter: maxCount]
}
