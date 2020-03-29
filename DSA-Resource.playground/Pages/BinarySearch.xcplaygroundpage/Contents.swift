import UIKit

func binarySearch<T : Comparable>(_ arr: [T], searchKey: T, range: Range<Int>) -> Int? {
    
    // check to ensure that the upper bound is higher than the lower bound
    if range.lowerBound >= range.upperBound {
        return nil
    }
        
    else    {
        
        // calculate middle index
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // 3 checks
        // 1. is middle index value equal to search key (if it is we have found the search key)
        // 2. if the value at the middle index is grater than the search key we, we will now look at the left side of the middle index
        // 3. else look right
        
        // check 1
        if arr[middleIndex] == searchKey    {
            return middleIndex
        }
            
            // check 2
        else if arr[middleIndex] > searchKey    { // left side of middle index
            return binarySearch(arr, searchKey: searchKey, range: range.lowerBound ..< middleIndex)
        }
            
            // check 3
        else if arr[middleIndex] < searchKey   { // look at the right side of the middle index
            return binarySearch(arr, searchKey: searchKey, range: middleIndex + 1 ..< range.upperBound)
        }
            
        else    {
            return middleIndex
        }
    }
}

let sortedList = [2,5,6,7,8,9,10]

let index = binarySearch(sortedList, searchKey: 9, range: (0..<sortedList.count - 1))
print("found index \(index ?? -999)")

let characters = ["a","b","c", "y"]
let charIndex = binarySearch(characters, searchKey: "y", range: (0..<characters.count))
print("found char index: \(charIndex ?? -1)")
