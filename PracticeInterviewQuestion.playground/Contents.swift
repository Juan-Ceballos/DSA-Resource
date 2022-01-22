import UIKit

var topics = ["Animals", "Fashion", "Sports", "Music"]

func formatTopics(_ topics: [String]) -> String {
    var count = 0
    var result = ""
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
    return 0
}
