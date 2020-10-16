//: [Previous](@previous)

import Foundation

func organize() {
    var arr = ["a", "b", "b", "c", "c", "c", "d", "e", "e"]
    var freqDict = [String: Int]()
    
    for element in arr {
        if let seen = freqDict[element] {
            freqDict[element] = seen + 1
        } else {
            freqDict[element] = 1
        }
    }
    print(freqDict)
}

organize()
