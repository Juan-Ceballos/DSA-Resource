//: [Previous](@previous)

import Foundation

func lomutoPartition(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivot = arr[high]
    
    // iterate j over low to high of current arr part
    // doing low..< j is index
    for j in low..<high {
        // compare j to pivot
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quickSort(arr: inout [Int], low: Int, high: Int) {
    if low < high {
        
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
        
        
        quickSort(arr: &arr, low: low, high: pivot - 1)
        quickSort(arr: &arr, low: pivot + 1, high: high)
    }
}

var list = [0, 3, 2, -1, 4]
quickSort(arr: &list, low: 0, high: list.count - 1)
print(list)
