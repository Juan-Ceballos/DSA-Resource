import UIKit

// merge sort
// worst, best, average case runtime is O(n log n)
// uses divide and conquer
// splits the array in two using the middle index
// uses recursion until a vase case count is greater than 1
// then merges individual arrays back together while sorting

func mergeSort(_ arr: [Int]) -> [Int]   {
    // base case count is greater than 1
    
    guard arr.count > 1 else {return arr}
    
    let middleIndex = arr.count / 2
    
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return merge(leftArray, rightArray)
}

// combilne two sorted arrays
func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int]    {
    
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [Int]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count  {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        // compare
        if leftElement < rightElement   {
            resultsArray.append(leftElement)
            leftIndex += 1
        }
        else if leftElement > rightElement  {
            resultsArray.append(rightElement)
            rightIndex += 1
        }
        else    {
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    // out here append elements remaining in left and right arrays
    if leftIndex < leftArray.count  {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    
    if rightIndex < rightArray.count    {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    
    return resultsArray
}

let list = [12,8,29,-100,0,234]

let sortedList = mergeSort(list)
print(sortedList)


func mergeSort2<T: Comparable>(_ arr: [T]) -> [T]   {
    // base case count is greater than 1
    
    guard arr.count > 1 else {return arr}
    
    let middleIndex = arr.count / 2
    
    let leftArray = mergeSort2(Array(arr[..<middleIndex]))
    let rightArray = mergeSort2(Array(arr[middleIndex...]))
    
    return merge2(leftArray, rightArray)
}

// combilne two sorted arrays
func merge2<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T]    {
    
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [T]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count  {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        // compare
        if leftElement < rightElement   {
            resultsArray.append(leftElement)
            leftIndex += 1
        }
        else if leftElement > rightElement  {
            resultsArray.append(rightElement)
            rightIndex += 1
        }
        else    {
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    // out here append elements remaining in left and right arrays
    if leftIndex < leftArray.count  {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    
    if rightIndex < rightArray.count    {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    
    return resultsArray
}

let list2 = [12,8,29,-100,0,234]

let sortedList2 = mergeSort2(list2)
print(sortedList2)



