//: [Previous](@previous)

import Foundation

import Foundation

func parse(_ str:String) -> Node? {
    //TODO: write function that returns linked list from given string
  let strArr = str.components(separatedBy: " -> ")
  if strArr[0] == "nil" {
    return nil
  } else {
    return Node(Int(strArr[0])!, parse(strArr.dropFirst().joined(separator: " -> ")))
  }
}

/*
 func parseData(_ data: [String]) -> Node? {
     guard let head = data.first, let entry = Int(head) else {
         return nil
     }
     return Node(entry, parseData(Array(data.dropFirst())))
 }

 func parse(_ str: String) -> Node? {
     return parseData(str.components(separatedBy: " -> "))
 }
 */

// more alternatives in slack
