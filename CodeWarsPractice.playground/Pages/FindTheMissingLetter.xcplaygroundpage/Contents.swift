//: [Previous](@previous)

import Foundation

func findMissingLetter(_ chArr: [Character]) -> Character {
  /*
  at least 2 letters all in one case
  always one letter missing
  
  [a, c] -> b
  [a, b, d] -> c
  [Q, R, T, U, V] -> S
  
  create an alphabet array
  find first index of first letter in input array
  grab from that index to the count of the array
  combine into a set
  return the only letter
  */
  
  let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  let isLower = chArr[0].isLowercase
  let startLetter = Character(chArr[0].lowercased())
  let startIndexInAlpha = alphabet.firstIndex(of: startLetter)!
  let endIndexInAlpha = chArr.count
  let subAlpha = alphabet[startIndexInAlpha...(startIndexInAlpha + endIndexInAlpha)]
  for char in subAlpha {
    if isLower == true {
      if !chArr.contains(char) {
        return char
      }
    } else {
      if !chArr.contains(Character(String(char).uppercased())) {
        return Character(String(char).uppercased())
      }
    }
  }
  return "*"
}
