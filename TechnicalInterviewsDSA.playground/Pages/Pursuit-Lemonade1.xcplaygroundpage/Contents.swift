//: [Previous](@previous)

import Foundation

/*
At a lemonade stand, each lemonade costs $5.

Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).

Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.

Return true if and only if you can provide every customer with correct change.

questions:
input: array of payments [Int]
output: bool

1) iterate through the array
2) will check if i can process change if not return false
----------
1) set up 3 variables to keep track of 5s, 10s, 20s
2) iterate through array via for loop, if first val arr > 5 return false
3) if 5 {5s +=}
4) if 10 {check for 1: 5, add to our 10s}
5) if 20 {check for  1: 10, 1: 5 or 3: 5, add 20}
6) return true if we're out for the for loop

feedback:
1) write out other examples ahead of time before coding
 - might be given edge case at end and have to rework code
 - considering them while coding out solution
 - having ready for testing
 - clearest way and understanding of problem are the same
  ie based on this input we get this output
2) talk about the type of solution while pseudo code ie runtime, and what can do about it. thinking about time complexity ahead of time

*/

let input = [5,5,5,10,20] // true

func lemonade(_ payments: [Int]) -> Bool {
  var five = 0
  var ten = 0
  var twenty = 0
  if payments.isEmpty {return true}
  if payments[0] > 5 {return false}

  for payment in payments {
    if payment == 5 {
      five += 1
    }
    else if payment == 10 {
      if five >= 1 {
        five -= 1
        ten += 1
      } else {return false}
    } else {
      if ten >= 1 && five >= 1 {
        ten -= 1
        five -= 1
        twenty += 1
      } else if five >= 3 {
        five -= 3
        twenty += 1
      } else {return false}
    }
  }
  return true
}
let emptyCase = [Int]()
print(lemonade(emptyCase)) // true
print(lemonade(input)) // true
print(lemonade([10,5,5,10,20])) // false
print(lemonade([5,5,20,10,20])) // false
print(lemonade([5,10,20,10,20])) // false
print(lemonade([5,10,10])) // false
