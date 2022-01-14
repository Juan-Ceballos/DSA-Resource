import UIKit

var firstPartStr = "Hello"
let secondPartStr = "Juan"
let firstAndSecondConcat = firstPartStr + secondPartStr
print(firstPartStr + secondPartStr)
print(firstAndSecondConcat)

let firstAndSecondPlusEquals = firstPartStr += secondPartStr
print(firstPartStr)
// or print(firstPartStr += secondPartStr)

var strToAddChar = "Goo"
let charToAdd: Character = "d"
strToAddChar.append(charToAdd)
print(strToAddChar)
