//: [Previous](@previous)

import Foundation

func spinWords(in sentence: String) -> String {
    let sentenceArr = sentence.split(separator: " ")
    var result = [String]()
    sentenceArr.map {if $0.count > 4 {result.append(String($0.reversed())) } else {result.append(String($0))}}
    return result.joined(separator: " ")
}

