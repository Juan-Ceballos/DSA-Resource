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
