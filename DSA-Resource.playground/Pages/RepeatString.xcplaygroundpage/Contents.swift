//: [Previous](@previous)

import Foundation

func repeatStr(_ n: Int, _ string: String) -> String {
    var result = ""
    
    if( n == 0 ) {
        return result
    }
    
    for _ in 1...n {
        result += string
    }
    
    return result
}
