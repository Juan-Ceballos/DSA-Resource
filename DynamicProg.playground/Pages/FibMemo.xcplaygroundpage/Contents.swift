//: [Previous](@previous)

import Foundation

func fib(n: Int) -> Int {
    
    var fibs: [Int] = [1, 1]
    (2...n).forEach { (i) in
        fibs.append(fibs[i - 1] + fibs[i - 2])
    }
    return fibs.last!
}

print(fib(n: 4))
