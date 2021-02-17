//: [Previous](@previous)

import Foundation

func countingValleys(steps: Int, path: String) -> Int {
    // Write your code here
    // any time a step is taking below sea level you enter a valley
    // a valley can be x units low and out of it when step into sea level
    // keep track of sea level 0
    // when enter a valley below sea level track when back in sea level to count valley         traversal
    var atSeaLevel = 0
    var valleyCount = 0
    var inValley = false
    for char in path {
        if char == "U" {
            atSeaLevel += 1
            if inValley == true && atSeaLevel == 0 {
                inValley = false
                valleyCount += 1
            }
        }
        if char == "D" {
            atSeaLevel -= 1
            if atSeaLevel < 0 {
                inValley = true
            }
        }
    }
    return valleyCount
}
