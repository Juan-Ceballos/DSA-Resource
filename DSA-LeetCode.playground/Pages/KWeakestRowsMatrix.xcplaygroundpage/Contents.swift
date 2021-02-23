//: [Previous](@previous)

import Foundation
    
    /*
    
    Questions:
    restate - return the k weakest given a matrix, weaker means less 1s if tied           smaller list still tied one then other or whichever, maybe first
    Algo:
    iterate through inner arrays
    calculate strength by binary search first instance of 0
    filter first k strengths into array, if tied count else first one or take tied         strength if space left
    Pseudo:
    
    */

    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
            var dict = [Int: (Int, Int)]()
            var result = [Int]()
            
            for (index, row) in mat.enumerated() {
                var low = 0
                var high = row.count - 1
                var strength = 0
                var size = 0
                
                while low <= high {
                    let middle = low + (high - low) / 2
                    
                    if row[middle] <= 0 {
                        high = middle - 1
                    } else {
                        low = middle + 1
                    }
                    
                }
                strength = low
                size = row.count
                
                let tempTuple = (strength, size)
                dict[index] = tempTuple
            }
            
            print(dict)
            var sortedDict = dict.sorted {$0.value < $1.value || ($0.value == $1.value && $0.key < $1.key)}
            print(sortedDict)
            var count = 0
            for (key, value) in sortedDict {
                result.append(key)
                count += 1
                if count == k {break}
            }
            
            return result
                
        }

kWeakestRows([[1,1,0,0,0],[1,1,1,1,0],[1,0,0,0,0],[1,1,0,0,0],[1,1,1,1,1]], 3
)
