//: [Previous](@previous)

import Foundation

func great(_ name: String, _ owner: String) -> String {
  if name == owner {
    return "Hello boss"
  } else {
    return "Hello guest"
  }

}

/*
 func great(_ name: String, _ owner: String) -> String {
   return "Hello \(name == owner ? "boss" : "guest")"
 }
 */
