//: [Previous](@previous)

import Foundation

// string interpolation high order functions
func sumMixHighOrder(_ arr: [Any]) -> Int {
  guard !arr.isEmpty else {return 0}
  return arr.compactMap{Int("\($0)")}.reduce(0,+)
}


// my solution downcast nil check
func sumMix(_ arr: [Any]) -> Int {
    var sum = 0
    for num in arr {
        if ((num as? Int) != nil) {
            sum += num as! Int
        } else {
            sum += Int(num as! String)!
        }
    }
    
    return sum
}

sumMix([1, "2", 3])

