//: [Previous](@previous)

import Foundation

func persistence(for num: Int) -> Int {
  // single digits are 0 - 9
  // num is already a single digit:
  var count = 0
//   if isSingle(num: num) == true {
//     return count
//   }
  print(num)
  
  // num is 2 digits, multiply each num to each other check if single
  var currentProduct = num//multiplyDigits(num: num)
  //print(result)
  while !isSingle(num: currentProduct) {
    currentProduct = multiplyDigits(num: currentProduct)
    count += 1
  }
  return count
  //return 99
}

func isSingle(num: Int) -> Bool {
  return num < 10 && num >= -9
}

func multiplyDigits(num: Int) -> Int {
  var temp = num
  var product = 1
  //var product = num %  10 * ((num / 10) % 10) * (num / 10 / 10 % 10) *
  //dividing by 10 til num == 0
  while temp != 0 {
    product *= temp % 10
    temp /= 10
  }
  //print(product)
  return product
}
//----------- Cleaned

func persistence2(for num: Int) -> Int {
  var count = 0
  var currentProduct = num
  while !isSingle(num: currentProduct) {
    currentProduct = multiplyDigits(num: currentProduct)
    count += 1
  }
  return count
}

func isSingle(num: Int) -> Bool {
  return num < 10 && num >= -9
}

func multiplyDigits(num: Int) -> Int {
  var temp = num
  var product = 1
  while temp != 0 {
    product *= temp % 10
    temp /= 10
  }
  return product
}

