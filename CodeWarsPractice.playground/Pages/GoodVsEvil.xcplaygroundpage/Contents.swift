//: [Previous](@previous)

import Foundation

func evaluate(good: String, vsEvil evil: String) -> String {
  let goodValues = [1, 2, 3, 3, 4, 10]
  let evilValues = [1, 2, 2, 2, 3, 5, 10]
  let goodArr = good.split(separator: " ")
  let evilArr = evil.split(separator: " " )
  var totalGood = 0
  var totalEvil = 0
  for (index, power) in goodArr.enumerated() {
    totalGood += Int(power)! * goodValues[index]
  }
  for(index, power) in evilArr.enumerated() {
    totalEvil += Int(power)! * evilValues[index]
  }
  return totalGood > totalEvil ? "Battle Result: Good triumphs over Evil" : totalGood == totalEvil ? "Battle Result: No victor on this battle field" : "Battle Result: Evil eradicates all trace of Good"
}
