//: [Previous](@previous)

import Foundation

func minimumSwaps(arr: [Int]) -> Int {
    var items = arr
    var numberOfSwaps = 0
    var itemsPositions: [Int:Int] = [:]
    // grab each number in array and set as key, and it's index as value
    for (index, item) in items.enumerated() {
        itemsPositions[item] = index
    }
    var index = 0
    // traverse array
    while index < items.count {
        // current item
        // example items[0] = 1 in [1, 3, 5, 2, 4, 6, 7]
        let item = items[index]
        // index 1 + 1 = 2
        // in index 1 of a sorted array the item should be 2
        // the item of each index should be index + 1
        let shouldBeItem = index + 1
        // if it's not the right item in the current spot of array
        if item != shouldBeItem {
            // put the number that belongs there the calculated shouldBeItem
            // which is current index + 1
            items[index] = shouldBeItem
            //[1, 2, 5, 2, 4, 6, 7]
            // since you have a reference in the dictionary of every value
            // and initial index in the array
            // [1:0, 3:1, 5:2, 2:3 ...]
            // items[iP[2] = 3] = items[3] = 3
            // put the item that was not in it's proper place where ever the
            // right one was to complete the swap
            items[itemsPositions[shouldBeItem]!] = item
            // item still has store 3 for when you took the current item
            // in the index where on in whill loop
            // iP[3] = 1 change it to that item position that should be there
            // ip[3] = iP[2] = 3
            // this updates in the dictionary where you have moved the item
            // in the array for future if necessary swaps
            itemsPositions[item] = itemsPositions[shouldBeItem]
            // the item moved to it's proper place
            // is now given the right value position
            itemsPositions[shouldBeItem] = index
            // this has been one swap update counter, continue sorting
            numberOfSwaps += 1
        }
        // go to next index
        index += 1
    }
    // when all done return number of swaps
    return numberOfSwaps
}

minimumSwaps(arr: [1, 3, 4, 2, 5])
