//: [Previous](@previous)

import Foundation

func lomutoPartition(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivotValue = arr[high]
    
    for j in low..<high {
        if arr[j] <= pivotValue {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    
    return i
}

func quickSortLomuto(arr: inout [Int], low: Int, high: Int) {
    // create a pivot qs lefr right
    // conditional if for base case recursion
    if low < high {
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
        
        quickSortLomuto(arr: &arr, low: low, high: pivot - 1)
        quickSortLomuto(arr: &arr, low: pivot + 1, high: high)
    }
    
}

var list = [4, 3, -4, 29, 1]
quickSortLomuto(arr: &list, low: 0, high: list.count - 1)
print(list)
