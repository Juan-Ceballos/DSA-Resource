//: [Previous](@previous)

import Foundation

func twoStrings(s1: String, s2: String) -> String {

let setS1 = Set(s1)
let setS2 = Set(s2)
let countOfBothStrings = setS1.count + setS2.count
let combinedSets = setS1.union(setS2)
let combinedSetsCount = combinedSets.count
if combinedSetsCount == countOfBothStrings {
    return "NO"
}
return "YES"

}

twoStrings(s1: "cat", s2: "apple")
