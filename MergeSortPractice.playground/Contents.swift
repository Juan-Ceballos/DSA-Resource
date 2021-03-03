import UIKit

// merge sort
// worst best case nlogn
// use divide and conquer
// splits arr using middle index
// use recursion base case of count 1
// merges individual arrs back together while sorting

func mergeSort(_ arr: [Int]) -> [Int] {
    // count 1 base case
    guard arr.count > 1 else {return arr}
    
    let middleIndex = arr.count / 2
    
    // beginning up to but not including middle index, until base case reached
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return merge(leftArr: leftArray, rightArr: rightArray)
}

// combine two sorted arrays

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArr = [Int]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        // compare
        if leftElement < rightElement {
            resultsArr.append(leftElement)
            leftIndex += 1
        } else if rightElement < leftElement {
            resultsArr.append(rightElement)
            rightIndex += 1
        } else {
            resultsArr.append(leftElement)
            resultsArr.append(rightElement)
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    // append remaining elements in left and right array
    if leftIndex < leftArr.count {
        resultsArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultsArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultsArr
}

let list = [12, 8, 29, -100, 234]
let sortedList = mergeSort(list)
print(sortedList)

