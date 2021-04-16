//: [Previous](@previous)

import Foundation

func sherlockAndAnagrams(s: String) -> Int {
    // characters = array of characters composed of each character in input string s
    let characters = Array(s)
        // counter = mutable empty key = string, value = Int dictionary
        var counter: [String: Int] = [:]
        // result = mutable int assigned 0
        var result = 0
        // for 0 to the index before last in array of character ie 0...4 if arr count = 6
        for length in 0 ... characters.count - 2
        {
            // reset counter dictionary
            counter.removeAll()
            // for 0 to count of character array - current count of outer loop
            // will traverse one less element each iteration down to first element
            for index in 0 ..< characters.count - length
            {
                // text = array from current index to outer iteration count plus i
                // sorted
                let text = characters[index ... index + length].sorted()
                // set key of substring to if exist 0 if not add one to current count
                counter[String(text)] = (counter[String(text)] ?? 0) + 1
            }
            // for each item in dictionary where value is greater than one meaning
            // at least one pair
            for item in counter where item.value > 1
            {
                // number of pairs between n strings is N(N-1)
                // since every pair is counted twice you have to divide N(N-1) by two
                result += (item.value * (item.value - 1)) / 2
            }
        }
        return result
}

print(sherlockAndAnagrams(s: "abba"))
