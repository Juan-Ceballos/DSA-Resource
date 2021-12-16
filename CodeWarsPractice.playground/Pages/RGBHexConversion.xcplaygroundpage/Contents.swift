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

// also check String(format:) and clamped
func rgb2(_ r: Int, _ g: Int, _ b: Int) -> String {
    var charAry:[Character] = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
    var rtnStr = ""
    var rgbAry:[Int] = [r, g, b]
    for i in 0..<rgbAry.count{
        if rgbAry[i] >= 255
        {
            rgbAry[i] = 255
        }
        else if rgbAry[i] <= 0
        {
            rgbAry[i] = 0
        }
        rtnStr.append(charAry[rgbAry[i]/16])
        rtnStr.append(charAry[rgbAry[i]%16])
    }
    //print(rtnStr)
    return rtnStr
}

func rgb3(_ r: Int, _ g: Int, _ b: Int) -> String {
    func norm(_ n: Int) -> Int {
      return min(255, max(0, n))
    }
    return String(format: "%02X%02X%02X", norm(r), norm(g), norm(b))
}

//---------

func rgb4(_ r: Int, _ g: Int, _ b: Int) -> String {
    return String(format:"%02X%02X%02X", r.roundToRGB(), g.roundToRGB(), b.roundToRGB())
}

extension Int {
    func roundToRGB() -> Int {
        return self > 255 ? 255 : (self < 0 ? 0 : self )
    }
}

//-----------
extension Int {
  /// Returns hex code value of the number in range [00, FF].
  ///
  /// Discussion: Each value is treated as UInt8, making each
  ///  negative value resulting in `"00"` and each value higher
  ///  than 255 resulting in `"FF"`.
  public var hexCode: String {
    guard self > 0 else { return "00" }
    guard self < 255 else { return "FF" }
    return String(format:"%02X", self)
  }
}

func rgb5(_ r: Int, _ g: Int, _ b: Int) -> String {
  return "\(r.hexCode)\(g.hexCode)\(b.hexCode)"
}

//---------
extension Strideable where Stride: SignedInteger {
    func clamped(to limits: CountableClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

func rgb6(_ r: Int, _ g: Int, _ b: Int) -> String {
    var cr = r.clamped(to: 0...255)
    var cg = g.clamped(to: 0...255)
    var cb = b.clamped(to: 0...255)
    var hr = String(format:"%02X", cr)
    var hg = String(format:"%02X", cg)
    var hb = String(format:"%02X", cb)
    return hr + hg + hb
}
