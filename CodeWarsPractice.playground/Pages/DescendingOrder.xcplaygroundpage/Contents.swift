//: [Previous](@previous)

import Foundation

func descendingOrder(of number: Int) -> Int {
  let strNum = String(number)
  let digits = strNum.compactMap{$0.wholeNumberValue}
  let bigNum = digits.sorted{$0 > $1}
  let strResult = bigNum.reduce (0, {($0*10) + $1})
  return strResult
}
