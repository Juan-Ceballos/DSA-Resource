//: [Previous](@previous)

import Foundation

// too slow, seems like it worked altho test said (6, 100, 110) should be nil even tho 101,107
func gap(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
    /*
     first pair of prime numbers between m and n with a gap of g
     
     iterate between m and n including m and n
     if num is prime store as firstPrime, go to secondPrime
     if gap between two is equal return primes
     if gap is greater move firstPrime to secondPrime and continue from there
     if gap is less than stay on firstPrime and move secondPrime
     */
    
    var firstPrime = -1
    var secondPrime = -1
    
    for num in m...n {
        if num.isPrime {
            firstPrime = num
            for num2 in firstPrime + 1...n {
                if num2.isPrime {
                    secondPrime = num2
                    let gap = secondPrime - firstPrime
                    if gap == g {
                        return (firstPrime, secondPrime)
                    }
                    if gap < g {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    }
    return nil
}

/*
 // extesion int new one at bottom
 extension Int {
 var isPrime: Bool {
 if self == 1 {
 return true
 }
 if self < 1 {
 return false
 }
 for num in 2..<self {
 if self % num == 0 {
 return false
 }
 }
 return true
 }
 }
 */

// using combinatrix still too slow
func gap2(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
    /*
     first pair of prime numbers between m and n with a gap of g
     too slow
     iterate between m and n including m and n
     if num is prime store as firstPrime, go to secondPrime
     if gap between two is equal return primes
     if gap is greater move firstPrime to secondPrime and continue from there
     if gap is less than stay on firstPrime and move secondPrime
     ------------------------
     find all the primes
     put in array
     find all pair combos using combinatrix
     filter out combos with i[0] < 1
     sort from least to greatest
     find first with gap of g
     */
    var primes = [Int]()
    
    for num in m...n {
        if num.isPrime {
            primes.append(num)
        }
    }
    
    let combos = combinations(arr: primes)
    var pairPrimes = [[Int]]()
    for combo in combos {
        //print(combo)
        if combo.count == 2 {
            pairPrimes.append(combo.sorted {$0 < $1})
        }
    }
    let pairPrimesSorted = pairPrimes.sorted {$0[0] < $1[0]}
    for ppS in pairPrimesSorted {
        if ppS[1] - ppS[0] == g {
            return (ppS[0], ppS[1])
        }
    }
    //let sortedPairPrimes = pairPrimes.sorted {$0[0] < $1[1]}
    //print(sortedPairPrimes)
    
    return nil
}

func combinations(arr: [Int]) -> [[Int]] {
    if arr.isEmpty {
        return [[]]
    }
    
    let first = arr[0]
    let rest = Array(arr[1...])
    
    let combsWithoutFirst = combinations(arr: rest)
    var combsWithFirst = [[Int]]()
    
    for comb in combsWithoutFirst {
        let combWithFirst = comb + [first]
        combsWithFirst.append(combWithFirst)
    }
    
    return combsWithoutFirst + combsWithFirst
}

/*
 // same as prior but extra stuff for testing same 100-110 bug, and 300 to 400 declares
 // 337 347 as prime pair when i find 307, and 317 as first prime pair gap 10
 func gap(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
 /*
 first pair of prime numbers between m and n with a gap of g
 too slow
 iterate between m and n including m and n
 if num is prime store as firstPrime, go to secondPrime
 if gap between two is equal return primes
 if gap is greater move firstPrime to secondPrime and continue from there
 if gap is less than stay on firstPrime and move secondPrime
 ------------------------
 find all the primes
 put in array
 find all pair combos using combinatrix
 filter out combos with i[0] < 1
 sort from least to greatest
 find first with gap of g
 */
 var primes = [Int]()
 print(m)
 print(n)
 for num in m...n {
 if num.isPrime {
 primes.append(num)
 }
 }
 
 let combos = combinations(arr: primes)
 var pairPrimes = [[Int]]()
 for combo in combos {
 //print(combo)
 if combo.count == 2 {
 pairPrimes.append(combo.sorted {$0 < $1})
 }
 }
 let pairPrimesSorted = pairPrimes.sorted {($0[0], $0[1]) < ($1[0], $1[1])}
 //print(pairPrimesSorted)
 for ppS in pairPrimesSorted {
 if ppS[1] - ppS[0] == g {
 print(ppS[0])
 print(ppS[1])
 return (ppS[0], ppS[1])
 }
 }
 //let sortedPairPrimes = pairPrimes.sorted {$0[0] < $1[1]}
 //print(sortedPairPrimes)
 
 return nil
 }
 
 func combinations(arr: [Int]) -> [[Int]] {
 if arr.isEmpty {
 return [[]]
 }
 
 let first = arr[0]
 let rest = Array(arr[1...])
 
 let combsWithoutFirst = combinations(arr: rest)
 var combsWithFirst = [[Int]]()
 
 for comb in combsWithoutFirst {
 let combWithFirst = comb + [first]
 combsWithFirst.append(combWithFirst)
 }
 
 return combsWithoutFirst + combsWithFirst
 }
 
 extension Int {
 var isPrime: Bool {
 if self == 1 {
 return true
 }
 if self < 1 {
 return false
 }
 for num in 2..<self {
 if self % num == 0 {
 return false
 }
 }
 return true
 }
 }
 */

func gap3(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
    // hold lastPrime int optional
    var lastPrime:Int?
    
    // from m to n
    for number in (m...n)  {
        // if number not prime move on
        if !number.isPrime { continue }
        // if is prime and found a prime for lastPrime var, so number is looking at second prime
        // if number which is second prime, and minus lastPrime which you found (first one)
        // is equal to gap
        if lastPrime != nil, number - lastPrime! == g {
            // return the first primes with gap
            return (lastPrime!, number)
        }
        // this is if you haven't the first prime set lastPrime to it
        lastPrime = number
    }
    
    // if goes through n to m without returning return nil
    return nil
}

extension Int {
    var isPrime: Bool {
        guard self >= 2     else { return false }
        guard self != 2     else { return true  }
        guard self % 2 != 0 else { return false }
        return !Swift.stride(from: 3, through: Int(sqrt(Double(self))), by: 2).contains { self % $0 == 0 }
    }
}
