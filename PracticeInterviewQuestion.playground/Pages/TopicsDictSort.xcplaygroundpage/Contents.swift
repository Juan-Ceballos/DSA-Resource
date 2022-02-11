import Foundation

let topicPins = [["apple": ["p1", "p2", "p3"]], ["sports": ["p2", "p3"]], ["magic": ["p2", "p4"]]]

func sortPins(pins: [[String: [String]]]) -> [String: String] {
    var result = [String: String]()
    var pinKeys = [String]()
    var topics = [String]()
    for pin in pins {
        for (key, value) in pin {
            for val in value {
                if !pinKeys.contains(val) {
                    pinKeys.append(val)
                }
            }
            topics.append(key)
        }
    }
    
    for (index, pin) in pinKeys.enumerated() {
        if index < topics.count {
            result[topics[index]] = pin
        }
    }
    
    return result
}

print(sortPins(pins: topicPins))
// returns: ["sports": "p2", "magic": "p3", "apple": "p1"]
