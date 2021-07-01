//: [Previous](@previous)

import Foundation

// ————————————————————————————————————————————————

// At a lemonade stand, each lemonade costs $5.

// Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).

// Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.

// Return true if and only if you can provide every customer with correct change.

// EXAMPLES

// [5, 5, 5, 10, 20] -> true
// From the first 3 customers, we collect three $5 bills in order.
// From the fourth customer, we collect a $10 bill and give back a $5.
// From the fifth customer, we give a $10 bill and a $5 bill.
// Since all customers got correct change, we output true.

// [5, 5, 10] -> true
// We collect two $5 bills from the first two customers and give one back as change to the last customer.

// [10, 10] -> false
// The first customer needs $5 back in change, but we don't have any five dollar bills.

// [5, 5, 10, 10, 20] -> false
// From the first two customers in order, we collect two $5 bills.
// For the next two customers in order, we collect a $10 bill and give back a $5 bill.
// For the last customer, we can't give change of $15 back because we only have two $10 bills.
// Since not every customer received correct change, the answer is false.

/*
var change = 0
[5, 5, 10]

price = 5
change
break

for each element in array {
  element
  if element == 5 {
    change += 5
  } else {
    change -=
    >0
  }
}

1) setup a freqDict, [Int: Int]()
2) iterate through customer array
3) check if element == 5
4) adding to freqDict else return false
5) keep iterating compare freqDict

*/

func lemonadeChange(bills: [Int]) -> Bool {
  // your code here
  var changeDict = [5: 0, 10: 0, 20: 0]
  var fives = 0
  var tens = 0

  for bill in bills {
    if bill == 5 {
      if let count = changeDict[5] {
        changeDict[5] = count + 1
      }
    } else if bill == 10 {
      if let count = changeDict[5] {
        if count > 0 {
          changeDict[5] = count - 1
          if let newTen = changeDict[10] {
            changeDict[10] = newTen + 1
          }
        } else {
          return false
        }
      }
    } else if bill == 20 {
      let count10 = changeDict[10]
      let count5 = changeDict[5]
      
      if count10 >= 1 && count5 >= 1 {
        changeDict[10] = count10 - 1
        changeDict[5] = count5 - 1
        changeDict[20] = changeDict[20] + 1
      } else if count5 >= 3 {
        changeDict[5] = count5 - 3
        changeDict[20] = changeDict[20] + 1
      } else {
        return false
      }

    }
  }

  print(changeDict)
  return true
}

func isCorrect(attempt: Bool, answer: Bool) {
  let result = attempt == answer ? "correct" : "wrong"
  print("\(attempt) is \(result)")
}

isCorrect(attempt: lemonadeChange(bills: [5, 5, 5, 10, 20]), answer: true)
isCorrect(attempt: lemonadeChange(bills: [5, 5, 10]), answer: true)
isCorrect(attempt: lemonadeChange(bills: [10, 10]), answer: false)
isCorrect(attempt: lemonadeChange(bills: [5, 5, 10, 10, 20]), answer: false)
