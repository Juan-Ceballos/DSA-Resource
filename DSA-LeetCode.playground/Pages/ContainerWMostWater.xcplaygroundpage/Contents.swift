//: [Previous](@previous)

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var max = 0
    var area = 0
    for x in 0..<height.count - 1 {
        for nextHeight in x + 1...height.count - 1 {
            if height[x] == 0 || height[nextHeight] == 0 {
                area = 0
            } else {area = min(height[x], height[nextHeight]) * (nextHeight - x)}
            if area > max {
                max = area
            }
        }
    }
    return max
}

// O(n^2) solution, brute force

func maxAreaOptimal(_ height: [Int]) -> Int {
    
    var max = 0
    var front = 0
    var back = height.count - 1
    while front < back {
        let y = min(height[front], height[back])
        let x = back - front
        let area = x * y
        if area > max {
            max = area
        }
        if height[front] < height[back] {
            front += 1
        } else {
            back -= 1
        }
    }
    return max
}

// O(n)
// explanation
//https://docs.google.com/document/d/1nXt1mVjVioHPDQzr1qmRVbYTFN3Tc5O5qPBDSQPTGsk/edit
