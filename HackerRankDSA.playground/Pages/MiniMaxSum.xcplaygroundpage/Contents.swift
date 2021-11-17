//: [Previous](@previous)

import Foundation

func miniMaxSum(arr: [Int]) -> Void {
    /*
    find min
    find max
    add min to other 3
    add max to other 3
    return
    
    sort array
    add[0] to [3]
    add[1] to [4]
    */
    var temp = arr.sorted {$0 < $1}
    let min = Array(temp[0...3]).reduce(0, +)
    let max = Array(temp[1...4]).reduce(0, +)
    
    print("\(min) \(max)")
}
