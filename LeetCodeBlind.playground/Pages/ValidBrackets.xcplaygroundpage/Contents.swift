//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    let bDict = ["(":")", "{":"}", "[":"]"]
    var res = [String]()
    
    for char in s {
        if let bracket = bDict[String(char)] {
            res.append(String(char))
        } else {
            if res.isEmpty {return false}
            let top = res[res.count - 1]
            let closed = bDict[top]
            if String(char) == closed {
                res.removeLast()
            } else {return false}
        }
    }
    
    return res.isEmpty
}
