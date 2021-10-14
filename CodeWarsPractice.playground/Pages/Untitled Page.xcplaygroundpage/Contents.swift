//: [Previous](@previous)

import Foundation

func sumMix(_ arr: [Any]) -> Int {
    return arr.reduce(0) { $0 + (Int("\($1)") ?? 0) }
}

/*
 func sumMix(_ arr: [Any]) -> Int {
   return arr
           .compactMap { Int("\($0)") }
           .reduce(0,+)
 }
 */
