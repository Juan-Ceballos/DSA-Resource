//: [Previous](@previous)

import Foundation

/*
    Questions:
    restate - in a matrix return number of negative numbers each inner array is sorted decreasing order
    Algo:
    do it in one go through each
    binary search using < 0
    difference between index found and count
    sum all differences
    what if moving to next mid puts you at -3 and theres a -2
    keep moving to higher once greater move back up exhaust the mid high comparison
    Pseudo:
 */
    func countNegatives(_ grid: [[Int]]) -> Int {
        var count = 0
        for row in grid {
            var low = 0
            var high = row.count - 1
            while low <= high {
                var middle = low + (high - low) / 2
                if row[middle] < 0 {
                    high = middle - 1
                } else {
                    low = middle + 1
                }
            }
            print(low)
            count += row.count - low
        }
        return count
    }

countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])
