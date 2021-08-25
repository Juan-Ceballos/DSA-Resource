//: [Previous](@previous)

import Foundation

func append(_ listA:Node?, _ listB:Node?) -> Node? {
  if listA == nil && listB == nil {
    return nil
  } else if listA == nil {
    return listB
  } else if listB == nil {
    return listA
  }
  
  var temp = listA
  
  while let current = temp {
    if current.next == nil {
      temp?.next = listB
      break
    } else {
      temp = temp?.next
    }
  }
  
  return listA
}
