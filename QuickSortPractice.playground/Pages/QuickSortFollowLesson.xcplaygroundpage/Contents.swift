//: [Previous](@previous)

import Foundation

// break array into 3 parts including the pivot, pivot partitions array
// before and after pivot, and pivot, divide and conquer

// alex notes
// Quick sort implementation using lomuto partitioning algorightm
// quick sort uses a pivot in our example we use last element as the pivot
// using this pivot we split arr into left and right of the pivot
// qs uses divide and conquer approach to solve the sorting algo divide and conquer is splitting the problem in half on every iteration (recurse call)
// o n log n

// implemnt lomuto partitioning

// returns new index which we will use as the pivot to partition the arr int left and right side arr
func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    // using last element in arr
    let pivot = arr[high]
    var i = low
    
    // iterate through the arr using j var as our marker
    for j in low..<high {
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    return i
}

func quickSortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    
    // if im still looking at an array of multiple elements keep going
    if low < high {
        // get a new pivot
        // smaller every time
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        // pivot - 1, the pivot comes from lomuto partition returns i which is new pivot
        // take before pivot and low for left, after pivot and high for right
        // recursive calls
        // left arr
        // will take arr and qs the left side of where lomuto found current pivot, then that index returned go right before it in arr
        quickSortLomuto(&arr, low: low, high: pivot - 1)
        // right arr
        quickSortLomuto(&arr, low: pivot + 1, high: high)
        
    }
}

var list = [80, 10, -9, 0, -11, 13]
quickSortLomuto(&list, low: 0, high: list.count - 1)
print(list)

