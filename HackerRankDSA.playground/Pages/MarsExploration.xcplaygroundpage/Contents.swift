//: [Previous](@previous)

import Foundation

func marsExploration(s: String) -> Int {

    var count = 0
    let arrS = Array(s)
    
    for (index, element) in arrS.enumerated() {
        if index % 3 == 0 {
            if element == "S" {
                continue
            } else {
                count += 1
            }
        } else if index % 3 == 1 {
            if element == "O" {
                continue
            } else {
                count += 1
            }
        }
        else if index % 3 == 2 {
            if element == "S" {
                continue
            } else {
                count += 1
            }
        }
    }

    return count
}

marsExploration(s: "SOSORS")
