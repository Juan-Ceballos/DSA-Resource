//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    var result = [Int]()
    
    while leftArr.count > leftIndex && rightArr.count > rightIndex {
        let leftValue = leftArr[leftIndex]
        let rightValue = rightArr[rightIndex]
        
        if leftValue < rightValue {
            result.append(leftValue)
            leftIndex += 1
        } else if rightValue < leftValue {
            result.append(rightValue)
            rightIndex += 1
        } else {
            result.append(leftValue)
            result.append(rightValue)
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArr.count {
        result.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        result.append(contentsOf: rightArr[rightIndex...])
    }
    
    return result
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

var badArr = [2, 1, 0, 3]
print(mergeSort(arr: badArr))

