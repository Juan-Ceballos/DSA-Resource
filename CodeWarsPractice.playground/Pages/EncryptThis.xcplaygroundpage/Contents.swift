//: [Previous](@previous)

import Foundation

func encryptThis(text:String) -> String{
  let arr = text.split(separator: " ")
  var result = [String]()
  for word in arr {
    var arrWord = Array(word)
    var currentArr = [String]()
    if arrWord.count < 3 {
      currentArr.append(String(arrWord[0].asciiValue!))
      if arrWord.count > 1 {
        for num in 1...arrWord.count - 1 {
          let str = String(arrWord[num])
          currentArr.append(str)
        }
      }
      let currentPiece = currentArr.joined(separator: "")
      result.append(currentPiece)
    } else {
      currentArr.append(String(arrWord[0].asciiValue!))
      for num in 1...arrWord.count - 1 {
        let str = String(arrWord[num])
        currentArr.append(str)
      }
      currentArr.swapAt(1, currentArr.count - 1)
      let currentPiece = currentArr.joined(separator: "")
      result.append(currentPiece)
    }
  }
  
  return result.joined(separator: " ")
}
