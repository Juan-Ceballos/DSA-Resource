//: [Previous](@previous)

import Foundation

// Write a recursive function that determines whether or not an input String contains the letter 'a'.
/*
questions:
input: String
output: Bool
if empty return false

algo:
mechanism that stops from continuing the recursion

"a", int
bca .first
ca -> .first
-> .first == nil or a return .first == a

1) check .first for a or nil
2) recursive call, function of new string - .first

"bbc"
"bac"
""
"a"
"abc"
"bda"
*/

func findA(_ str: String) -> Bool {
  if str.first == nil {
    return false
  }
  else if str.first == "a" {
      return true
  }

  let strArr = Array(str)
  let strNew = Array(strArr[1...])
  let temp = String(strNew)

  return findA(temp)
}

print(findA("abc")) // true
print(findA("bbc")) // false
print(findA("")) // false
print(findA("a")) // true
print(findA("abc")) // true
print(findA("bda")) // true
// uppercase or lowercase
// ran with hits
// articulated thought process

// improvement areas:
// keep it in the string format
//
