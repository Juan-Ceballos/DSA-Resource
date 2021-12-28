//: [Previous](@previous)

import Foundation
// too slow for bigger numbers
func nextBigger(num: Int) -> Int? {
  /*
  1) from num + 1 to num * 10 - 1 for loop
  2) compare numbers sorted
  123, 124, 125,
  
  store all nums from step 1
  123 - 132 -
     finding the first number with the same digits as input starting from (input + 1)
  */
  let arrNum = Array(String(num)).sorted {$0 < $1}
  print(arrNum)
  for n in num + 1..<num * 10 {
    let nS = Array(String(n)).sorted {$0 < $1}
    if nS == arrNum {
      return n
    }
  }
  
  return nil
}

// my convoluted solution with notes
func nextBigger2(num: Int) -> Int? {
  /*
  1) from num + 1 to num * 10 - 1 for loop
  2) compare numbers sorted
  123, 124, 125,
  
  --------------------
  123 - 132 -
  
  find all combinations of number
  sort them
  find first number grater than input
  ---------------------
  
  find next number bigger than first digit
  1, 23
  102
  120
  if number bigger than first number exist
  sort the rest
  return
  ----------
  1 -> nil
  23 -> 32 (swap)
  234 -> 2, 34 - > 243
  210 -> 2, 10 -> nil
  251 -> 2, 51 -> 5, 21 -> 512
  2432 -> 24, 32 23 -> 2 432 -> 2432 3
  251 -> 2 51, -> 25 1 -> 521 -> 5, 21
  go to last two numbers
  see if can swap for bigger number, if cant swap and move up to compare from second num
  rinse repeat
  */
  print(num)
  if num < 10 {
    return nil
  }
  
  var arrNum = Array(String(num))
  let setNum = Set(arrNum)
  if setNum.count == 1 {
    return nil
  }
  
  for (index, num) in arrNum.enumerated().reversed() {
    if index - 1 >= 0 {
    let lastDigit = num
    let secondLastDigit = arrNum[index - 1]
    if lastDigit > secondLastDigit {
      var rest = Array(arrNum[index...]).sorted {$0 < $1}
      //print(rest)
      for (index, val) in rest.enumerated() {
        if val > secondLastDigit {
          rest.swapAt(index, 0)
          break
        }
      }
      //print(rest)
      
      var i = index
      for element in rest {
        arrNum[i] = element
        i += 1
      }
      arrNum.swapAt(index, index - 1)
      var restB = Array(arrNum[index...]).sorted {$0 < $1}
      print(restB)
      let restBSorted = restB.sorted {$0 < $1}
      i = index
      for element in restB {
        arrNum[i] = element
        i += 1
      }
      //print(arrNum)
      return Int(String(arrNum))
    }
    }
    
      // 251 -> 25, 1 -> 521
      // 251 -> 251 -> 25, 1 -> 521
    // if theres a swap sort everything before?
    //251 -> 215 -> 251 521 ->
  }
//   if arrNum.count == 2 {
//     arrNum.swapAt(0, 1)
//     let res = String(arrNum)
//     return Int(res)
//   }
  return nil
}

func nextBigger2Clean(num: Int) -> Int? {
    if num < 10 {
        return nil
    }
    
    var arrNum = Array(String(num))
    let setNum = Set(arrNum)
    if setNum.count == 1 {
        return nil
    }
    
    for (index, num) in arrNum.enumerated().reversed() {
        if index - 1 >= 0 {
            let lastDigit = num
            let secondLastDigit = arrNum[index - 1]
            if lastDigit > secondLastDigit {
                var rest = Array(arrNum[index...]).sorted {$0 < $1}
                for (index, val) in rest.enumerated() {
                    if val > secondLastDigit {
                        rest.swapAt(index, 0)
                        break
                    }
                }
                
                var i = index
                for element in rest {
                    arrNum[i] = element
                    i += 1
                }
                arrNum.swapAt(index, index - 1)
                var restB = Array(arrNum[index...]).sorted {$0 < $1}
                print(restB)
                let restBSorted = restB.sorted {$0 < $1}
                i = index
                for element in restB {
                    arrNum[i] = element
                    i += 1
                }
                return Int(String(arrNum))
            }
        }
    }
    return nil
}

// didnt use this
func permutations(_ n:Int, _ a: inout Array<Character>) {
    if n == 1 {print(a); return}
    for i in 0..<n-1 {
        permutations(n-1,&a)
        a.swapAt(n-1, (n%2 == 1) ? 0 : i)
    }
    permutations(n-1,&a)
}


//---------------from solutions------------------------------------
func nextBigger3(num: Int) -> Int? {
    var digits = String(num).compactMap { $0.wholeNumberValue }
    var i = digits.count - 1
    
    while i > 0 && digits[i - 1] >= digits[i] {
        i -= 1
    }
    
    guard i > 0 else { return nil }
    
    var j = digits.count - 1
    while digits[j] <= digits[i - 1] {
        j -= 1
    }
    
    digits.swapAt(i - 1, j)
    
    j = digits.count - 1
    while i < j {
        digits.swapAt(i, j)
        i += 1
        j -= 1
    }
    
    return Int(digits.reduce("", { $0 + String($1) }))
}

//------
func nextBigger4(num: Int) -> Int? {
  
  var digits = String(num).compactMap{$0.wholeNumberValue!}
    
  // Return if all digits are same or smaller than previous ones.
  guard digits != digits.sorted().reversed() else { return nil }
    
  let enumeratedDigits = Array(digits.enumerated())
     
  // Get the last digit that has at least one bigger digit after.
  let a = enumeratedDigits.last(where: { d in
    Array(digits[d.offset..<digits.count]).contains(where: { $0 > d.element })
  })!
    
  // Get the smallest next digit with bigger value than a
  let b = Array(enumeratedDigits[a.offset+1..<digits.count]
        .filter({$0.element > a.element}))
        .min(by: {$0.element < $1.element})!
    
  // Exchange digits
  digits[a.offset] = b.element
  digits[b.offset] = a.element
    
  // Sort digits after a.offset, so we garanty it's the smallest one
  var digitsResults = digits[0...a.offset]
  digitsResults.append(contentsOf: digits[a.offset+1...digits.count-1].sorted())

  // Convert to Int
  let result = Int(digitsResults.map(String.init).joined())
  return result
}

//--------
func nextBigger5(num: Int) -> Int? {
    guard let chars = nextBiggerString(Array(String(num))) else { return nil }
    return Int(String(chars))
}

func nextBiggerString(_ chars: [Character]) -> [Character]? {
    guard chars.count > 1 else { return nil }
    if let newChars = nextBiggerString(Array(chars[1...chars.count - 1])) {
        return chars[0...0] + newChars
    }else {
        var sorted = chars.sorted()
        let index = sorted.lastIndex(of: chars[0])!
        guard index < sorted.count - 1 else { return nil }
        sorted.insert(sorted.remove(at: index + 1), at: 0)
        return sorted
    }
}

//-------------

func nextBigger6(num: Int) -> Int? {
    let maxNumber = Int(String(num).sorted { $0 > $1 }.map { String($0) }.joined())!

    let range = (num...maxNumber)
    let numSorted = String(num).sorted()

    for i in range {
        let iSorted = String(i).sorted()
        if numSorted == iSorted, i != num { return i }
    }
    return nil
}
