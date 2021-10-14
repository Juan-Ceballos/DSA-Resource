//: [Previous](@previous)

import Foundation

var arr: [Character] = ["a", "b", "c", "d"]

for element in arr {
    print(element)
}


for num in 0..<arr.count {
    let temp = arr[0] // a , a, b, c
    arr[0] = arr[num] // a, b, c,
    arr[num] = temp // a, a
    // abcd
    // bbcd -> bacd
    // bacd -> cacd -> cabd
    // dabc -> dabc
}

//[a, b, c]
//[bac]
//[cab]
//[acb]
//abcd
//3 + 2 + 1

// abcd
// cbcd, abcd

// dbcd, abcd

arr.swapAt(0, 1)

//print(arr)

// ----------------------

/*
*Find the 2nd largest and 2nd smallest number in two arrays of numbers combined
I.e. - [10,5,7,2,4,1,24] & [8,23,29,25,40,0,24] -> 2nd Largest : 29 , 2nd Smallest: 1 ----------**




In this program, we need to find the smallest and the largest word present in the string and the length of those words:
“Hardships often prepare ordinary people for an extraordinary destiny” -> "extraordinary":13, "an":2
-----------**



*Find the length of largest subarray with 0 sum
Input: arr[] = {15, -2, 2, -8, 1, 7, 10, 23};
Output: 5
Explanation: The longest sub-array with
elements summing up-to 0 is {-2, 2, -8, 1, 7}
*/

/*
 Questions:
 In/Out:
 Algo:
 1)
 */

func findSecond(arr1: [Int], arr2: [Int]) {
    let fullArr = (arr1 + arr2).sorted{$0 < $1}
    print("\(fullArr[1]), \(fullArr[fullArr.count - 2])")
}

findSecond(arr1: [1,2,3], arr2: [0, 9])

func findLongestWord(str: String) {
    let arrOfInput = str.split(separator: " ")
    var max = 0
    var resultStr = ""
    for word in arrOfInput {
        if word.count > max {
            max = word.count
            resultStr = String(word)
        }
    }
    print(resultStr)
    print(max)
}

findLongestWord(str: "Hardships often prepare ordinary people for an extraordinary destiny")

func findLargestSubArray(arr: [Int]) -> Int {
    var sum = 0
    var count = 0
    var max = 0
    
    for (index, element) in arr.enumerated() {
        for num in index..<arr.count - 1 {
            sum += arr[num]
            count += 1
            if sum == 0 && count > max {
                max = count
            }
        }
        count = 0
        sum = 0
    }
    
    if max == 0 && arr.contains(0) {
        max = 1
    }
    
    return max
}

print(findLargestSubArray(arr: [15, -2, -4, 4, 2, -8, 1, 7, 10, 23]))
print(findLargestSubArray(arr: [15, 0, 1]))

