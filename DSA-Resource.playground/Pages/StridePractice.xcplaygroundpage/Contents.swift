//: [Previous](@previous)

import Foundation

func triangular(_ n: Int) -> Int{
    return stride(from: 1, through: n, by: 1).reduce(0, +)
}
