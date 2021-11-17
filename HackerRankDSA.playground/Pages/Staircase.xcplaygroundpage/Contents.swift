//: [Previous](@previous)

import Foundation

func staircase(n: Int) -> Void {
    
    /*
    size 1 = #
    size 2 =  #
             ##
    blank = n - count to N from i = 1
    fill rest with #
    */
    var i = 0
    for row in 1...n {
        while i < n {
            if n - row > i {
              print(" ", terminator: "")
              i += 1
            } else {
                print("#", terminator: "")
                i += 1
            }
        }
        i = 0
        print("\n", terminator: "")
    }
}
