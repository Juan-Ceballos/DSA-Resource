//: [Previous](@previous)

import Foundation

func findNb(_ number: Int) -> Int {
  
  /*
  given total volume find the number of cubes you build
  volumeTopCube = 1 ^ 3
  m = n^3 + (n - 1) ^ 3 ... 1 ^ 3
  
  m = 1
  return 1 ^ 3 = 1
  
  take number subtract (1...n) ^ 3 while
  
  */
  
  var temp = number
  var num = 1
  while temp > 0 {
    temp -= (num * num * num)
    num += 1
  }
  
  if temp == 0 {
    return num - 1
  }
  
  return -1
}
