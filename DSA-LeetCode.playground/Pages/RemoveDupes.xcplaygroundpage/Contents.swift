//: [Previous](@previous)

import Foundation

func removeDupes(str: String) -> String {
    var placeHolder: Character = "*"
    let arr = Array(str)
    var result = [Character]()
    if str.count < 2 {
        return str
    }
    for letter in arr {
        if letter != placeHolder {
            result.append(letter)
            placeHolder = letter
            print("1: \(result)")
        } else {
            result.remove(at: result.count - 1)
            if result.count == 0 {
                placeHolder = "*"
                print("2: \(result)")
            }
            else {
                placeHolder = result[result.count - 1]
                print("3: \(result)")
            }
        }
    }
    print(result)
    return String(result)
}
// pl = *, a, a, pl = a
// pl = a, b, ab, pl = b
// pl = b, b, a, pl = a
// pl = a, a, "", pl = *
// pl = *, c, c, pl = c
//
removeDupes(str: "abbaca")
