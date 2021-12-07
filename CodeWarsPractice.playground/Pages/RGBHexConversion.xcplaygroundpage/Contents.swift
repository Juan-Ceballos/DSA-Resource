//: [Previous](@previous)

import Foundation

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
  /*
  RGB = 0 - 255, rounded to closest valid value
  should return 6 count string for hexadecimal
  
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
  a = 10, b, c, d, e, f = 16
  
  digit to hexa conversion
  23 = 16 0 = 1, 16 1 = 16, 16 2 = 256
  - create a string: Int dictionary for hex values
  - create current string array
  while num > 0
    do steps
    update num by / 16
  - store mod 16 value
  - enter mod value in dictionary to add to current string array
  - divide num by 16 (repeat)
  - return string add 0 for missing
  - join and reverse array
  */
  print("\(r), \(g), \(b)")
  let hexDict = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9",
                 10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]
  var hexStr = [String]()
  let nums = [r, g, b]
  var curr = -1
  
  for num in nums {
    curr = num > 255 ? 255: num < 0 ? 0 : num
    /*
    12 % 16 = 4
    "4"
    148 / 16 = something
     % 16 = 9
    0 % 16 = 0
    */
    if curr == 0 {
      hexStr.append("0")
      hexStr.append("0")
    }
    
    if let value = hexDict[curr], curr != 0 {
        hexStr.append(value)
        hexStr.append("0")
        continue
    }
    
    while curr > 0 {
      let str = hexDict[curr % 16] ?? "x"
      hexStr.append(str)
      curr /= 16
    }
  }
  print(hexStr)
  hexStr.swapAt(0, 1)
  hexStr.swapAt(2, 3)
  hexStr.swapAt(4, 5)

  return hexStr.joined(separator: "")
  
}
