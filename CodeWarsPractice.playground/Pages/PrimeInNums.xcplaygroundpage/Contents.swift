//: [Previous](@previous)

import Foundation

func factors(_ number: Int) -> String {
  /*
  divide by prime numbers until reach 1
  p = prime number
  n = number of times to divide by till need bigger prime number
  1) loop through numbers from 2 to max int and if number is greater than 1
  2) check if both numbers are when divided by prime are prime
  3) if second numbers is not prime check if number is divisible by current iteration number
  4) if so increase count of current iterations
  helper function to check if a number is prime
  dictionary to store prime number and freq of division
  function to continuously divide number by current prime and add to dictionary
    - if result of division is not prime check mod == 0 with current prime
  iterate through dictionary to adjust to string format
  */
  var primeDict = [Int:Int]()
  var primeArr = [(Int, Int)]()
  var primeStr = ""
  var temp = number
  for num in 2...Int.max {
    if temp.isPrime {
      primeDict[temp] = 1
      break
    }
    if num.isPrime {
      while temp % num == 0 {
        if let count = primeDict[num] {
          primeDict[num] = count + 1
        } else {
          primeDict[num] = 1
        }
        temp /= num
      }
      continue
    }
  }
  for (key, value) in primeDict {
    primeArr.append((key, value))
  }
  let sortedPrimeArr = primeArr.sorted {$0.0 < $1.0}
  print(sortedPrimeArr)
  for primeTup in sortedPrimeArr {
    if primeTup.1 == 1 {
      primeStr += "(\(primeTup.0))"
    } else {
      primeStr += "(\(primeTup.0)**\(primeTup.1))"
    }
  }
  return primeStr
}
func divByPrime(p: Int, num: Int) -> Int {
  var temp = num
  temp = num / p
  return temp
}
extension Int {
  var isPrime: Bool {
    if self == 1 || self == 2 {
      return true
    }
    if self < 1 {
      return false
    }
    for num in (2...self - 1) {
      if self % num == 0 {
        return false
      }
    }
    return true
  }
}









