//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    // comparing left and right right arr left arr
    var resultArr = [Int]()
    var left = 0
    var right = 0
    
    while left < leftArr.count && right < rightArr.count {
        let leftValue = leftArr[left]
        let rightValue = rightArr[right]
        
        if leftValue < rightValue {
            resultArr.append(leftValue)
            left += 1
            
        } else if rightValue < leftValue {
            resultArr.append(rightValue)
            right += 1
        } else {
            resultArr.append(leftValue)
            resultArr.append(rightValue)
            left += 1
            right += 1
        }
        
    }
    
    if left < leftArr.count {
        resultArr.append(contentsOf: leftArr[left...])
    }
    
    if right < rightArr.count {
        resultArr.append(contentsOf: rightArr[right...])
    }
    
    return resultArr
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
