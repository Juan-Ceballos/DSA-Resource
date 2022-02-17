//: [Previous](@previous)

import Foundation

/*
questions:
2 input arrays of ints
return array of elements appear in both input arrays
empty -> []

algo:
Set Method
1) convert both arrays into a set
2) set intersection -> ()[]
3) convert set back to array and return
----------------
1) remove all duplicates
2) iterate through the shorter array
3) while iterating we check if the other array .contains()
*/

let firstArr = [Int]()
let secondArr = [2,2]

func sharedElements(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
  var res = [Int]()
  let tempArr1 = Array(Set(arr1))
  let tempArr2 = Array(Set(arr2))

  for element in tempArr1 {
    if tempArr2.contains(element) {
      res.append(element)
    }
  }

  return res
}

print(sharedElements([1,2,2,1], [2,2])) // [2]
print(sharedElements(firstArr, [2,2])) // []
print(sharedElements([1,2,3], [4, 5, 6])) // []

