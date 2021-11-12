//: [Previous](@previous)

import Foundation

func validBraces(_ string:String) -> Bool {
  /*
  open (, {, [
  closed ), }, ]
  the newest open must be closed, just care about the last brace
  - have an array for open and closed types
  - take open braces put them in a stack
  - try to pop and match
  - if don't match return false
  - if empty return false
  - if end of string loop is reached return true
  */
  var openBraces = [Character]()
  let bracesDict: [Character: Character] = ["(" :")", "{": "}", "[": "]"]
  
  for char in string {
    print(openBraces)
    let currClosed = bracesDict[char] // == ")", nil
    if currClosed != nil {
      openBraces.append(char) // [(]
    } else {
      if let lastOpen = openBraces.popLast() { // ()
        if bracesDict[lastOpen]! != char {
          print("\(bracesDict[lastOpen]!), \(char)")
          return false
        }
      } else {
        return false
      }
    }
  }
  
  return openBraces.isEmpty
}
