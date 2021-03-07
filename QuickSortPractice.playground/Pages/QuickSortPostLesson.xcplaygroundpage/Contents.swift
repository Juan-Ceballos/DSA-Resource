import UIKit

// use divide and conquer
// O(nlogn)
// uses a pivot, used to partition the array, left and right of pivot
// Using Lomuto's Partition Algorithm = last element as pivot
// example 10, -9, 0, -11, pivot 13, 80
// qs uses divide and conquer, which is splitting the array in half on every integration(recursive call)

// implement lomutos partitioning

func lomutoPartition(arr: inout[Int], low: Int, high: Int) -> Int {
    var i = low
    // for lomuto pivot starts at last element, need value since that what will be compared
    // in order to sort
    let pivot = arr[high]
    
    // j iterate through array
    for j in low..<high {
        // need value at (index j) to compare to pivot value
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    // 
    arr.swapAt(i, high)
    
    return i
}

func quickSort(arr: inout[Int], low: Int, high: Int) {
    if low < high {
        
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
    
        quickSort(arr: &arr, low: low, high: pivot - 1)
        quickSort(arr: &arr, low: pivot + 1, high: high)
    }
}

var list = [80, 10, -9, 0, -11, 13]
quickSort(arr: &list, low: 0, high: list.count - 1)
print(list)

