//: [Previous](@previous)

import Foundation

/*
 
 iterate through the array
 the first value
 m - arr[0]
 index 1 = 0
 index 2 = 0
 
 index1 = current index
 index2 = w/e == 0
 for each value {
 for each element subtract until m == 0
 }
 
 */
func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    // Write your code here
    
    var index1 = 0
    var index2 = 0
    var resultsArr = [Int]()
    
    for (index,price) in arr.enumerated() {
        index1 = index
        let remainingValue = m - price
        for num in index..<arr.count - 1 {
            if remainingValue - arr[num + 1] == 0 {
                index2 = num + 1
                resultsArr.append(index1 + 1)
                resultsArr.append(num + 2)
            }
        }
    }
    print(resultsArr)
    return resultsArr
}

icecreamParlor(m: 6, arr: [1, 3, 4, 5, 6])
