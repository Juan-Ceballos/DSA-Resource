//: [Previous](@previous)

import Foundation

func lomutoPartition(arr: inout [Int], low: Int, high: Int) -> Int {
    // lomuto starts from the end
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
