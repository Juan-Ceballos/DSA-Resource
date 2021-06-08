//: [Previous](@previous)

import Foundation

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var result = [Int]()
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftValue = leftArr[leftIndex]
        let rightValue = rightArr[rightIndex]
        if leftValue % 2 == 0 {
            result.append(leftValue)
            leftIndex += 1
        } else {
            result.append(rightValue)
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
func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    let middle = arr.count / 2
    let leftArr = mergeSort(Array(arr[..<middle]))
    let rightArr = mergeSort(Array(arr[middle...]))
    return merge(leftArr: leftArr, rightArr: rightArr)
}
func sortArrayByParity(_ nums: [Int]) -> [Int] {
    mergeSort(nums)
}

print(sortArrayByParity([3, 2, 1, 4]))
