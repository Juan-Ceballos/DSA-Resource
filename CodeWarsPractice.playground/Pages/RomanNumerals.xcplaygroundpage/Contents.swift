//: [Previous](@previous)

import Foundation

var romanLetters = [
  1000: "M",
  900: "CM",
  500: "D",
  400: "CD",
  100: "C",
  90: "XC",
  50: "L",
  40: "XL",
  10: "X",
  9: "IX",
  5: "V",
  4: "IV",
  1: "I"
]

func solution(_ number: Int) -> String {
  var n = number
  var result = ""
 
  while(n > 0) {
    for roman in romanLetters.sorted( by: { $0.0 > $1.0 }) {
      if n >= roman.key {
        n -= roman.key
        result += roman.value
        break
      }
    }
  }
  
  return result
}


func solution2(_ number:Int) -> String {
    let arabik = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let Roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    var temp: Int = number
    var result = ""
    for i in 0...arabik.count - 1 {
                
            while temp/arabik[i] >= 1 {
                temp = temp - arabik[i]
                result += Roman[i]
             }
        }
    return result
}

func solution3(_ number:Int) -> String {
  let roman = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
  , arabic = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
  var number = number, r = ""
  while number > 0 {
    for (i,v) in arabic.enumerated(){
      if v <= number { r += roman[i]; number -= v; break }
    }
  }
  return r
}

func solution4(_ number:Int) -> String {
    var n = number
    var result = ""
    let romanNumerals = [( 1000,    "M"),
                         (  900,   "CM"),
                         (  500,    "D"),
                         (  400,   "CD"),
                         (  100,    "C"),
                         (   90,   "XC"),
                         (   50,    "L"),
                         (   40,   "XL"),
                         (   10,    "X"),
                         (    9,   "IX"),
                         (    5,    "V"),
                         (    4,   "IV"),
                         (    1,    "I")]
    
    for (v, l) in romanNumerals {
        while n >= v {
            result += l
            n -= v
        }
    }
    
    return result
}
