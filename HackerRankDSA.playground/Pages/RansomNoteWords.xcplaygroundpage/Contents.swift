//: [Previous](@previous)

import Foundation

func checkMagazine(magazine: [String], note: [String]) -> Void {
    var magDict = [String: Int]()
    var noteDict = [String: Int]()
    var count = 0
    for word in magazine {
        if let count = magDict[word] {
            magDict[word] = count + 1
        } else {
            magDict[word] = 1
        }
    }
    for word in note {
        if let count = noteDict[word] {
            noteDict[word] = count + 1
        } else {
            noteDict[word] = 1
        }
    }
    for (key, value) in noteDict {
        if let countOfWordInMag = magDict[key] {
            if countOfWordInMag >= value {
                count += 1
                continue
            } else {
                break
            }
        } else {
            break
        }
    }
    if count == noteDict.count {
        print("Yes")
    } else {
        print("No")
    }
}

checkMagazine(magazine: ["Give money tonight"], note: ["Give money"])
