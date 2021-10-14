import UIKit

/*
lemondade stand
lemonade cost $5
starts at $0

- how much we currently have in drawer
- take into account what the current bill handed
- based on bill and drawer amount

if the first person hands > 5 then return false
dictionary to keep track of what we have so far
arr[i] = 5, 10 or 20
1) empty dictionary that has key for each bill amount
2) if first > 5 return false
3) storing 5
4) if 5 just add to the drawer
5) if 10, check for 5s
6) if 20, 3. 5s, or one 10 and a 5
7) if not return false
8) if were done iterating condition at the end return true
* within loop we're checking if we should return false
in: [5, 5, 5, 10, 20] order of cu
  : [] true
  : [5, 20, 5, 10] => false
  one cu true or false
out: true or false if can make change
*/

// [5,5,5,10,20] => true
// [5,20,5,10] => false

func lemonadeChange(arr: [Int]) -> Bool {
  var drawer = [5: 0, 10: 0, 20: 0]

  var fives = 0
  var tens = 0
  var twenties = 0

  if arr.isEmpty {return true}
  if arr[0] != 5 {return false}

  for bill in arr {
    if bill == 5 {
      if let count = drawer[5] {
        drawer[5] = count + 1
      }
    } else if bill == 10 {
      if let count = drawer[5], let count10 = drawer[10], count >= 1 {
        drawer[5] = count - 1
        drawer[10] = count10 + 1
      } else {
        return false
      }
    } else {
       if let count5 = drawer[5], let count10 = drawer[10], let count20 = drawer[20], count5 >= 1 && count10 >= 1 {
        drawer[5] = count5 - 1
        drawer[10] = count10 - 1
        drawer[20] = count20 + 1
      } else if let count = drawer[5], let count20 = drawer[20], count >= 3 {
        drawer[5] = count - 3
        drawer[20] = count20 + 1
      } else {
        return false
      }
    }
  }

  return true
}

print(lemonadeChange(arr: [5, 5, 5, 10, 20])) // true
print(lemonadeChange(arr: [])) // true
print(lemonadeChange(arr: [5, 20, 5, 10])) // false
print(lemonadeChange(arr: [5])) // true
print(lemonadeChange(arr: [10])) // false
print(lemonadeChange(arr: [5,10,5,5,5,20,10])) // true
