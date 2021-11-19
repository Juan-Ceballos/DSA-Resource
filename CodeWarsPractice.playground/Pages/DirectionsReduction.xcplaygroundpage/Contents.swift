//: [Previous](@previous)

import Foundation

func dirReduc(_ arr: [String]) -> [String] {
    /*
      remove adjacent directions that cancel each other out
      N, S, E, W
      Use a stack method since only care about most recent
      Establish relationship between N:S E:W
      If North goes in or South goes in if next is
      variable to keep track of wated Direction
  1 - create wastedDirection variable to keep track of what next would result in pop
  2 - iterate through arr, push element assign element or remove placeholder on wastedDirection
  3 - if wasted pop, empty wasted or put placeholder back
      if not push update wasted
  4 - return what's left
      var a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
    */
  
  var resultStack = [String]()
  var wastedDirection = "*"
  // current = north, south, south, East, west, north, west
  // wasted = *, south, *, north, west, North, *
  // result = west
  for direction in arr {
    if wastedDirection !=  direction {
      resultStack.append(direction)
      print(resultStack)
      switch direction {
        case "NORTH":
          wastedDirection = "SOUTH"
        case "SOUTH":
          wastedDirection = "NORTH"
        case "EAST":
          wastedDirection = "WEST"
        case "WEST":
          wastedDirection = "EAST"
        default:
          wastedDirection = "*"
      }
      print(wastedDirection)
    } else {
        if !resultStack.isEmpty {
          resultStack.removeLast()
          if !resultStack.isEmpty {
            switch resultStack[resultStack.count - 1] {
              case "NORTH":
              wastedDirection = "SOUTH"
              case "SOUTH":
              wastedDirection = "NORTH"
              case "EAST":
              wastedDirection = "WEST"
              case "WEST":
              wastedDirection = "EAST"
              default:
              wastedDirection = "*"
            }
          } else {
            wastedDirection = "*"
          }
          
        } else {
          wastedDirection = "*"
        }
      }
  }
  
  return resultStack
  // South, South, North, West
}
