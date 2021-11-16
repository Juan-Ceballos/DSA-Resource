//: [Previous](@previous)

import Foundation

func race(_ v1: Int, _ v2: Int, _ g: Int) -> [Int]? {
    if (v1 >= v2) {
        return nil
    }
    
    let seconds = g * 3600 / (v2-v1)
    
    return [seconds / 3600, (seconds % 3600) / 60, seconds % 60]
    
}

func race2(_ v1: Int, _ v2: Int, _ g: Int) -> [Int]? {
    guard v1 < v2 else { return nil }
    
    // two constants for the beginning
    let hrSecs = 3600
    let hrMins = 60
    
    // following the basic formulas around velocity in physics I used
    // formula for the distance travelled by the faster tortoise (B)
    // D = v2*T
    // where D is distance, V2 is speed of B and T is time of the travel
    // and then formula for the distance travelled by the slower tortoise (A)
    // D = g + v1*T
    // where D is distance, g is the initial distance of A and T is time  of the travel and v2 is of couse the slower speed
    // after comparing these two formular (to find a point, where they meet) and a number of
    // transformation, the final formula for computing time of the meetup (in seconds!) is:
    let t: Int = g * hrSecs / (v2 - v1)
    
    // now, to calculate the time units as a result:
    let hrs = t / hrSecs
    let mins = (t - (hrs * hrSecs)) / hrMins
    let secs = t % hrMins
    return [hrs, mins , secs]
}
