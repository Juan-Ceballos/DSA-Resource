//: [Previous](@previous)

import Foundation

func bubbleSort(arr: [Int]) -> [Int] {
    var sortedArr = arr
    
    for i in 0..<arr.count {
        for j in 1..<arr.count {
            if sortedArr[j] < sortedArr[j - 1] {
                let temp = sortedArr[j - 1]
                sortedArr[j - 1] = sortedArr[j]
                sortedArr[j] = temp
            }
        }
    }
    
    return sortedArr
}

print(bubbleSort(arr: [5, 7, 2, 9, 3, 4]))
