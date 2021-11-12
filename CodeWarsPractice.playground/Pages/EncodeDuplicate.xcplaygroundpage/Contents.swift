//: [Previous](@previous)

import Foundation

func duplicateEncode(_ word: String) -> String {
  var result = ""
  var freqDict = [String: String]()
  for letter in word {
    if let _ = freqDict[String(letter).lowercased] {
      freqDict[String(letter).lowercased] = ")"
    } else {
      freqDict[String(letter).lowercased] = "("
    }
  }
  
  for letter in word {
   result += freqDict[String(letter).lowercased]!
  }
  
  return result
}
