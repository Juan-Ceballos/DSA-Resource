//: [Previous](@previous)

import Foundation

func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    /*
      see if the string in a1 substring of one in a2
      1) iterate through a1, compare to each string in a2
  EDGES:
  - not prefix or suffix in the middle
  - when checking word against the start of the first letter on second word,
  the word can have just enough, more, or less letters, if less doesnt have full word
  - word can have multiple instances of starting letter
    */
  //arp harp
  //count = 3
  print("a1: \(a1), a2: \(a2)")
  var result = [String]()
  for str1 in a1 {
    for str2 in a2 {
      let arr1 = Array(str1)
      let arr2 = Array(str2)
      for (index, letter) in arr2.enumerated() {
        if letter == arr1[0] {
          let lI = index
          if arr2[lI...].count < arr1.count {
            continue
          }
          let arr2Sub = Array(arr2[lI..<(lI + (arr1.count))])
          print(arr1)
          print(arr2Sub)
          if arr1 == arr2Sub {
            result.append(str1)
            break
          }
        }
      }
    }
  }
  print(result)
  return Array(Set(result)).sorted{$0 < $1}
}
