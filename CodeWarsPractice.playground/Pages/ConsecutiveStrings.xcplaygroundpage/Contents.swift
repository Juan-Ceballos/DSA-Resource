//: [Previous](@previous)

import Foundation

func longestConsec(_ strarr: [String], _ k: Int) -> String {
/* find longest consecutive string based on k
  find strarr count, check if 0 or less than k to return empty,
  if str = 1, return only element, k = 1 return largest string
  calculate possible index based on arr size and k
  for num in 0 to k -> while num + k < arr.size  - [(num, num + k)]
  for element in collection index strarr add count, keep track of highest
  
    - keep grabbing subarrays of i to i + k
    - add the counts, and store the subarray
    - return largest
    -
*/
  
  let arrSize = strarr.count
  if arrSize == 0 || k > arrSize || k <= 0 {
    return ""
  }
  
  if arrSize == 1 {
    return strarr[0]
  }
  
//   if k == 1 {
//     // return first largest
//     return ""
//   }
  
  var largestSub = [String]()
  var count = 0
  
  for i in 0..<arrSize {
    if i + k <= arrSize {
      let currArr = Array(strarr[i..<(i + k)])
      print(currArr)
      let currCount = currArr.joined(separator: "").count
      if currCount > count {
        count = currCount
        largestSub = currArr
      }
    }
  }
  
  return largestSub.joined(separator: "")
}
