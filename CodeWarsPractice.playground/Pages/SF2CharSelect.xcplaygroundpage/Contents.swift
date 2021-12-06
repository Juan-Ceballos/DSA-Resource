//: [Previous](@previous)

import Foundation

func streetFighterSelection(fighters: [[String]], position: (row: Int, column: Int), moves: [Direction]) -> [String] {
  /*
  moves [Direction] .up, .down, .left, .right
  up, right = +1
  down, left = -1
  
  fighters[row][col]
  up-down, move row
  left-right, move col
  
  lock in row movement
  if row = 0 lock up, +0
  if row = 1 lock down, +0
  
  rotate horizontal - col
  if col = 0 left is +5
  if col = 5 right is - 5
  
  [.left: (-1, 5), .right (1, -5), up down (+/-1, 0)]
  
  - store current character
  - store current character return array
  - create movesDict
  - iterate through moves
  - for each move check if in corner and add .1
  - else go in dict and add based on key from move
  - add and store character
  - return array
  */
  print("he")
  var res = [String]()
  var currChar = ""
  var currPosition = position
  let movesDict = [Direction.up: (-1, 0), .down: (1, 0), .right: (1, -5), .left: (-1, 5)]
  for move in moves {
    switch move {
      case .up:
      if currPosition.0 == 0 {currChar = fighters[currPosition.0 + movesDict[.up]!.1][currPosition.1]}
      else {currChar = fighters[currPosition.0 + movesDict[.up]!.0][currPosition.1]
           currPosition.0 += movesDict[.up]!.0}
      res.append(currChar)
      case .down:
      if currPosition.0 == 1 {currChar = fighters[currPosition.0 + movesDict[.down]!.1][currPosition.1]}
      else {currChar = fighters[currPosition.0 + movesDict[.down]!.0][currPosition.1]
           currPosition.0 += movesDict[.down]!.0}
      res.append(currChar)
      case .right:
      if currPosition.1 == 5 {currChar = fighters[currPosition.0][currPosition.1 + movesDict[.right]!.1]
                             currPosition.1 += movesDict[.right]!.1}
      else {currChar = fighters[currPosition.0][currPosition.1 + movesDict[.right]!.0]
           currPosition.1 += movesDict[.right]!.0}
      res.append(currChar)
      case .left:
      if currPosition.1 == 0 {currChar = fighters[currPosition.0][currPosition.1 + movesDict[.left]!.1]
                             currPosition.1 += movesDict[.left]!.1}
      else {currChar = fighters[currPosition.0][currPosition.1 + movesDict[.left]!.0]
           currPosition.1 += movesDict[.left]!.0}
      res.append(currChar)
    }
  }
  return res
}
