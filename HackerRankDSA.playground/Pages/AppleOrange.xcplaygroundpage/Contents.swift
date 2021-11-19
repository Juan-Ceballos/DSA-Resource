//: [Previous](@previous)

import Foundation

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    /*
    Apples and oranges have to land with in the range of s - t ie 7 - 10
    starting from a, the apple tree we move along the x axis going to b the orange trees
    to move between the range of s and t a has to be positive going, and t has to be         negative
    
    1) check each value in apples, and oranges (counter for both trees)
    2) combine the arrays - from 0 to count - 1, the rest
    3) in first part of array check if a + value is within s - t range, increase count1
    4) second part check if b - value is withing s - t range, increase count 2
    */

    var appleCounter = 0
    var orangeCounter = 0
    let applesOrangesArr = apples + oranges
    
    for (index, distance) in applesOrangesArr.enumerated() {
        if index >= 0 && index <= apples.count - 1 {
            let appleLoc = distance + a
            if (s...t).contains(appleLoc) {
                appleCounter += 1
            }
        } else {
            let orangeLoc = distance + b
            if (s...t).contains(orangeLoc) {
                orangeCounter += 1
            }
        }
    }
    //7 - 11
    print("\(appleCounter)")
    print("\(orangeCounter)")
}
