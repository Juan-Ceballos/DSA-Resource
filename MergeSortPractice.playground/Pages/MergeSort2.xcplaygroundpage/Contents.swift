//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    
    // set up variables for merging
    var leftIndex = 0
    var rightIndex = 0
    var resultsArr = [Int]()
    
    // compare left and right using while
    // iterate through both arrays to compare
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftValue = leftArr[leftIndex]
        let rightValue = rightArr[rightIndex]
        
        if leftValue < rightValue {
            resultsArr.append(leftValue)
            leftIndex += 1
        } else if rightValue < leftValue {
            resultsArr.append(rightValue)
            rightIndex += 1
        } else {
            resultsArr.append(leftValue)
            resultsArr.append(rightValue)
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArr.count {
        resultsArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultsArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultsArr
}

func mergeSort(arr: [Int]) -> [Int] {
    
    // split arr into left and right
    // we use recursion of mergeSort to return sorted array
    
    // start with our base case
    // if not greater than one meaning at least 2 elements
    guard arr.count > 1 else {
        return arr
    }
    
    // grab middle index to split array
    
    let middle = arr.count / 2
    
    // make left and right array recursively split
    let leftArray = mergeSort(arr: Array(arr[..<middle]))
    let rightArray = mergeSort(arr: Array(arr[middle...]))
    
    // merge left and right using helper
    return merge(leftArr: leftArray, rightArr: rightArray)
}

let list = [22, 1, 100, 14, -2]
let sortedList = mergeSort(arr: list)
print(sortedList)
