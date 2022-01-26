import UIKit

let sampleStr = "cat"

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch  {
            preconditionFailure("Illegal Regular Expression: \(pattern)")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

let regex = NSRegularExpression("[a-z]at")
print(regex.matches(sampleStr))

// operator overloading to make swift's contains operator ~= work with regex
extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}

print("rabbit" ~= "[a-z]it")
// [a-zA-Z] or .caseInsensitive
// [0-9], [A-Za-z0-9], ([A-Fa-f0-9] hex)
// list letters individually [csm]at
// part [b-x]

// quantification: how many times something ought to appear = *
let regex2 = NSRegularExpression("ca[a-z]*d")
// looks for ca, then zero or more characters from "a through z" *, then d
// it matches cad, card, camped, and (more)
// + one or more, ? zero or one

/*
 1) c[a-z]*d = cd or camped
 2) c[a-z]+d = camped
 3) c[a-z]?d = cd, cad
 
 color and colour = colou?r = colo then 0 or 1 u then r
 
 */
