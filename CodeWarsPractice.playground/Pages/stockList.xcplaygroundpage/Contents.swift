//: [Previous](@previous)

import Foundation

func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    /*
    A-Z
    code of 3,4,5 or more chars. 1s char capital letter book category
    Int for number of books of that code in stock
    Input: List of categories, stocklist
    find book count for each category in stock list
  
    1) setup result string to build
    2) Break up each string in listArr using components [B] [150]
    3) add first letter, and value to a dictionary
    4) iterate through list of categories
       - Setup string to input ie. (A:
       - check dictionary for value
       - close string for that part
    5) return result
    */
  
  if listOfArt.isEmpty || listOfCat.isEmpty {
    return ""
  }
  
  var result = ""
  var listDict = [String: Int]()
  for code in listOfArt {
    let currentCode = code.components(separatedBy: " ")
    print(currentCode)
    let currentAmount = Int(currentCode[1])!
    let currentLetter = String(currentCode[0].first!)
    print(currentAmount)
    print(currentLetter)
    if let amount = listDict[currentLetter] {
      listDict[currentLetter] = amount + currentAmount
    } else {
      listDict[currentLetter] = currentAmount
    }
  }
  
  for (index, cat) in listOfCat.enumerated() {
    if index != listOfCat.count - 1 {
      result += "(\(cat) : \(listDict[cat] ?? 0)) - "
    } else {
      result += "(\(cat) : \(listDict[cat] ?? 0))"
    }
  }
  return result
}
