import UIKit

// use divide and conquer
// O(nlogn)
// uses a pivot, used to partition the array, left and right of pivot
// Using Lomuto's Partition Algorithm = last element as pivot
// example 10, -9, 0, -11, pivot 13, 80
// qs uses divide and conquer, which is splitting the array in half on every integration(recursive call)

// implement lomutos partitioning

func lomutoPartition(arr: inout[Int], low: Int, high: Int) -> Int {
    // brings pivot to left smaller, right larger
    var i = low
    // for lomuto pivot starts at last element, need value since that what will be compared
    // in order to sort
    let pivot = arr[high]
    
    // j iterate through array
    for j in low..<high {
        // need value at (index j) to compare to pivot value
        // everything higher that pivot stays at right
        // i moves to the right as everything is smaller is moved to left,
        // once j has reached high i will be at the spot where pivot goes where i and everything after is higher than pivot
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    // high is pivot since lomuto
    // array has moved smaller elements to left of pivot
    // i should now be the right place for pivot, i at this point is the position in which everything after when swapped with pivot is greater
    // i is at leftmost high value, pivot at right after all values higher than, and all values after are going to be greater than since all smaller values have been moved to left of anythinhg before swap after i is greater than pivot, possibly unsorted but greater than pivot at least
    arr.swapAt(i, high)
    
    // i is new pivot at this point i has been sorted to its right place the index in which everything is before is lower, everything after is greater
    // in next function this pivot will be used to break apart again where on the left we do lomuto again and take last element of left side and create pivot for that high value, on the right take last element create pivot, this will recurse till base case where we have the sorted low high at same place smallest sorted split
    return i
}

func quickSort(arr: inout[Int], low: Int, high: Int) {
    if low < high {
        
        // bring pivot to position in which left of pivot is smaller right is larger
        let pivot = lomutoPartition(arr: &arr, low: low, high: high)
        // qs left
        quickSort(arr: &arr, low: low, high: pivot - 1)
        // qs right
        quickSort(arr: &arr, low: pivot + 1, high: high)
    }
    // base case reached all splits done and sorted
}

var list = [80, 10, -9, 0, -11, 13]
quickSort(arr: &list, low: 0, high: list.count - 1)
print(list)

