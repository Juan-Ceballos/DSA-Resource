//: [Previous](@previous)

import Foundation

var topics = ["Animals", "Fashion", "Sports", "Music"]

func formatTopics(_ topics: [String]) -> String {
    var count = 0
    var result = ""
    if topics.count == 1 {return topics[0]}
    while count < topics.count - 1 {
        result += "\(topics[count]), "
        count += 1
    }
    result += "and \(topics[topics.count - 1])"
    return result
}

print(formatTopics(topics))

func formatTopics2(_ topics: [String], _ limit: Int) -> String {
    let remainder = topics.count - limit
    var count = 0
    var result = ""
    if remainder == topics.count || remainder < 1 {
        return formatTopics(topics)
    } else {
        while count < limit {
            result += "\(topics[count]), "
            count += 1
        }
        result += "and \(remainder) more"
        return result
    }
}

print()
print(formatTopics2(topics, 2))
print(formatTopics2(topics, 0))
print(formatTopics2(topics, 4))
print(formatTopics2(topics, 8))

func formatTopics3(_ topics: [String], maxChar: Int) -> Int {
    /*
     start with one string keep forming the format topics string
     count the characters if remainder of max char increase string by one topic
     keep topic count, return count
     */
    var currTopicArr = [String]()
    var count = 0
    for topic in topics {
        currTopicArr.append(topic)
        let currString = formatTopics(currTopicArr)
        if currString.count <= maxChar {count += 1}
        else {break}
    }
    return count
}
print()
print(formatTopics3(topics, maxChar: 20))

extension String {
  var withoutPunctuations: String {
    return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: " ")
  }
}
var sampleStr = "Alphand_St."
print(sampleStr.withoutPunctuations)

func adjustStr(_ str: String) -> String {
  let illegalChars = ["!", "@", "#", "$", "%", "^", "*", "-", "_", ","]
  var strArr = Array(str).map{String($0)}
  for (index, char) in strArr.enumerated() {
    if illegalChars.contains(char) {
      strArr[index] = " "
    }
  }
  return strArr.joined(separator: "")
}

print(adjustStr(sampleStr))
