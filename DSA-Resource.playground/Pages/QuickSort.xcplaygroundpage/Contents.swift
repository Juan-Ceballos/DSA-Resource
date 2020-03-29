import UIKit

// Quick Sort implementation using Lomuto's Partitioning algorithm
// Quick Sort uses a pivot in our example we use the last element as the pivot
// Using this pivot we split the array to the left of the pivot and to the right of the pivot
// example 10, -9, 0, -11, (pivot is 13), 80
// Quick sort uses divide and conquer to approach to solve the sorting algorithm, divide and conquer is splitting the prolbelm in half on every iteration (or recursive call)
// runtime: O(n log n)

// implement Lomoto's partitioning

// return new index which we will use as the pivot to partition
// the array into a left and right side array
func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int  {
    let pivot = arr[high] // using last element in array
    var i = low
    
    // iterate through the array using j variable as our marker
    for j in low ..< high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quickSortLomuto(_ arr: inout [Int], low: Int, high: Int)  {
    if low < high   {
        // get new pivot
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        // recursive calls
        // left array
        quickSortLomuto(&arr, low: low, high: pivot - 1)
        
        // right array
        quickSortLomuto(&arr, low: pivot + 1, high: high)
    }
}

var list = [80, 10, -9, 0, -11, 13, 33, 45, 66, 2, -11, 122, 4, 9, 16, 17, 12, 3, 45, 100, 101]
quickSortLomuto(&list, low: 0, high: list.count - 1)
print(list)

func bubbleSort(_ arr: inout [Int])   {
    for _ in 0 ..< arr.count    {
        for j in 1 ..< arr.count  {
            if arr[j] < arr[j - 1]  {
                arr.swapAt(j, j - 1)
            }
        }
    }
}

var bubbleList = [980, 10, -9, 0, -11, 13, 33, 45, 66, 2, -11, 122, 4, 9, 16, 17, 12, 3, 45, 100, 101]
bubbleSort(&bubbleList)
print(bubbleList)
