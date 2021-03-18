//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArr = [Int]()
    
    while leftIndex < leftArr.count &&  rightIndex < rightArr.count {
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
    
    guard arr.count > 1 else {
        return arr
    }
    
    let middle = arr.count / 2
    
    let leftArr = mergeSort(arr: Array(arr[..<middle]))
    let rightArr = mergeSort(arr: Array(arr[middle...]))
    
    return merge(leftArr: leftArr, rightArr: rightArr)
}

let list = [3, 2, 4, 5, 1]
let sortedList = mergeSort(arr: list)
print(sortedList)
