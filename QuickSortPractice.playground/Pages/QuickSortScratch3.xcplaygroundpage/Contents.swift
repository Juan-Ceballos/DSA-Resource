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
    
    // have to create a pivot, qs left qs right, base case  1 element in arr
    // arr count doesnt change stay within same array low and high are moved left right
    if low < high {
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
        
        quickSortLomuto(arr: &arr, low: low, high: pivot - 1)
        quickSortLomuto(arr: &arr, low: pivot + 1, high: high)
    }
}

var list = [3, 10, 2, 4, -9]
quickSortLomuto(arr: &list, low: 0, high: list.count - 1)
print(list)
