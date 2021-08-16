//: [Previous](@previous)

import Foundation

func removeDuplicateWords(str: String) -> String {
    
    let strArr = str.split(separator: " ")
    var resultArr = [String]()
    var resultSet = Set<String>()
    
    for word in strArr {
        if !resultSet.contains(String(word)) {
            resultSet.insert(String(word))
            resultArr.append(String(word))
        }
    }
    
    let result = resultArr.joined(separator: " ")
    
    return result
}

removeDuplicateWords(str: "Boy oh Boy that will do")
/*

Java Script Implementation

function removeDuplicateWords (s) {
  
  let strSet = new Set();
  let strArr = s.split(" ")
  
  for (let i = 0; i <= strArr.length - 1; i++) {
    let word = strArr[i]
    strSet.add(word)
  }
  
  let resultArr = Array.from(strSet)
  let resultStr = resultArr.join(" ")
  
  return resultStr
}
*/

// Swift
