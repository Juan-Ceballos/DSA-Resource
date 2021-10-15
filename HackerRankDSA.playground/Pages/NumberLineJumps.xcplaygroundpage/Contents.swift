//: [Previous](@previous)

import Foundation

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    if x1 == x2 {
        return "YES"
    }
    
    if v1 == v2 {
        return "NO"
    }
    
    let k1 = (x1, v1)
    let k2 = (x2, v2)
    var leading = k1.0 > k2.0 ? k1: k2
    var following = k1.0 < k2.0 ? k1: k2
    
    if leading.1 > following.1 {
        return "NO"
    }
    
    while true {
        following.0 += following.1
        leading.0 += leading.1
        
        if following.0 == leading.0 {
            return "YES"
        }
        if following.0 > leading.0 {
            return "NO"
        }
    }
}
