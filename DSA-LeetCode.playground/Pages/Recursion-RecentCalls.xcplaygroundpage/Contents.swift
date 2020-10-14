//: [Previous](@previous)

import Foundation

class RecentCounter {
    
    var request: [Int] = []
    
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
    
        // t param, time in milliseconds
        // -> number of request made in the past 3000 milliseconds
        // [t - 3000, t]
        
        // -2999, 1 = 3000ms back from 1ms
        // -> 1
        
        // t = 100
        // -2900, 100 = back from 100ms
        // return 2
        
        // t = 3001
        // 1, 3001 =
        // 1 for itself, 2 for 100, 3 for? 1
        
        // t = 3002
        // 2, 3002 =
        // [1, 100, 3001, 3002]
        // 1 for itself, 2 for 3001, 3 for 100
        // return 3
        
        // add request to array
        // determine range
        // return total instance of int requested in that range
        
        // what is the simplest input and solution?
        // goal
        // how can I progress towards goal?
        
        /*
            goal return all int within range
            simplest input is any input. range outside of 3000?
            ping() t - 3000 to t
        */
        
        request.append(t)
        print(request)
        
        return 1
        
    }
}

let rc = RecentCounter()
rc.ping(4)
