//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    
    // set up variables for comparison
    var left = 0
    var right = 0
    var resultsArr = [Int]()
    
    while left < leftArr.count && right < rightArr.count {
        let leftValue = leftArr[left]
        let rightValue = rightArr[right]
        
        if leftValue < rightValue {
            resultsArr.append(leftValue)
            left += 1
        } else if rightValue < leftValue {
            resultsArr.append(rightValue)
            right += 1
        } else if rightValue == leftValue {
            resultsArr.append(leftValue)
            resultsArr.append(rightValue)
            left += 1
            right += 1
        }
    }
    
    if left < leftArr.count {
        resultsArr.append(contentsOf: leftArr[left...])
    }
    
    if right < rightArr.count {
        resultsArr.append(contentsOf: rightArr[right...])
    }
    
    return resultsArr
}

func mergeSort(arr: [Int]) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    let middleIndex = arr.count / 2
    
    let leftArr = mergeSort(arr: Array(arr[..<middleIndex]))
    let rightArr = mergeSort(arr: Array(arr[middleIndex...]))
    
    return merge(leftArr: leftArr, rightArr: rightArr)
}
