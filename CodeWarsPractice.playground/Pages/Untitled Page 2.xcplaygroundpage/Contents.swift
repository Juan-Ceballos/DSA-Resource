//: [Previous](@previous)

import Foundation
func getLines(_ num:Int?) -> String {
  /*
  the sequence: 1, 11, 21, 1211
  11, 1 the count of a number, 1 what that number is
  if 0 return -1, have to start with 1, something to look at
  the pattern of the sequence, and where in the sequence, need the sequence up to n
  1) count all of the same element left to right
  2) to count we will need the string of the sequence starting from 1
  3) create start string to look at
  4) count characters of the string function
      - keep count of prev char count iterate when char changes reset count replace current char
  5) append to string, append what that char is
  */
  //print(splitStrByNumbers(str: "112"))
  guard let num = num, num > 0 else {
    return "-1"
  }
  if num == 1 {
    return "1"
  }
  var seq = "1"
  var seqArr = ["1"]
  var seqPart = ""
  for i in 1..<num {
    let curr = seqArr[i - 1]
    let sayArray = countNum(str: curr)
    for say in sayArray {
      seqPart += say
    }
    //let seqPart = countNum(str: curr) //+ "1" // say the number you counted
    seq += "," + seqPart
    seqArr.append(seqPart)
    seqPart = ""
  }
  return seq
}
func splitStrByNumbers(str: String) -> [String] {
  let arr = Array(str)
  var result = [String]()
  var currStr = ""
  var curr = arr[0]
  for i in 0..<arr.count {
    if curr == arr[i] {
      currStr += String(arr[i])
    } else {
      curr = arr[i]
      currStr += ",\(curr)"
    }
  }
  result = currStr.components(separatedBy: ",")
  return result
}
func countNum(str: String) -> [String] {
  let arrStr = splitStrByNumbers(str: str)
  var say = [String]()
  // [2, 1] -> at i = 1, count 1, arr[0] = 2
  for (index, element) in arrStr.enumerated() {
    let count = element.count
    let num = Array(arrStr[index])[0]
    say.append("\(count)\(num)")
  }
  print("say \(say)")
  //[112] -> [11, 2] -> [21, 12]
  return say
}
