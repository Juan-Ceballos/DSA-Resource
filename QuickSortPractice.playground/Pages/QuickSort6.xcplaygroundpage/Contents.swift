//: [Previous](@previous)

import Foundation

func lomutoPartition(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivot = arr[high]
    
    for j in low..<high {
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    return i
}

func quickSortLomuto(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
        quickSortLomuto(arr: &arr, low: low, high: pivot - 1)
        quickSortLomuto(arr: &arr, low: pivot + 1, high: high)
    }
}

var list = [1, 0, 3, 2, 5]
quickSortLomuto(arr: &list, low: 0, high: list.count - 1)
print(list)

let someSet = Set<Int>([1, 3, 2])
let otherSet: Set = [1, 2, 3]
print(someSet)
print(otherSet)

let sampleArr = [1, 2, 2, 3, 3, 3]
var freqDict = [Int: Int]()

for num in sampleArr {
    if let count = freqDict[num] {
        freqDict[num] = count + 1
    } else {
        freqDict[num] = 1
    }
}

print(freqDict)

list.remove(at: 0)
print(list)
