import UIKit

/*
 1) base case, smallest piece of the problem trying to solve and what is the answer to that problem
 2) How can I progress towards my base case, or else crash
 3) Does my function returns a value, if so likely use return value
*/

// factorial

func factorial(input: Int) -> Int {
    
    // what is my base case, 1 factorial know the answer to
    // base case: factorial 1
    //
    // keep state, how close towards base case, using paramaters or return values
    // traveler variable - paramaters or return values
    
    // 5 * 4 * ... 1
    
    // base case
    // input in which we know the answer to
    if input <= 1 {
        return 1
    }
    
    return input * factorial(input: input - 1)
    
}

print(factorial(input: 5))


/*
 Stack Tracing
 input: 5
 is 5 <= 1,No
 return = 5 * factorial(4), 5 - 1 Activation Frame
 So what is factorial(4)
 
 input: 4
 is 4 <= 1, No
 return = 4 * factorial(3), 4 - 1
 
 input: 3
 is 3 <= 1, No
 return = 3 * factorial(2), 3 - 1
 
 input: 2
 is 2 <= 1, No
 return = 2 * factorial(1), 2 - 1
 
 input: 1
 is 1 <= 1, Yes
 return = 1
 
 5 * f(4)
 factorial(4) as 4 * factorial(3),
 5 * 4 * 3 * 2 * factorial(1) = 1
 
 example 3
 3 * factorial(3 - 1)
 factorail(2) = 2 * factorial(2 - 1)
 fatorial(1) = 1
 
 */

func isPowerOfThree(_ n: Int) -> Bool {
    // 3 ^ 1 = 3
    // 3 ^ 0 = 1
    // what is the simplest input?
    // the input itself
    // how can I progress towards my goal?
    // goal: if I keep multiplying by 3 do I reach input% == 0
    // 9 / 3 = 3, 3/3 = 1
    
    // base case
    if n == 1 {
        return true
    }
    
    if n % 3 == 0 && n != 0 {
        return isPowerOfThree(n / 3)
    } else {return false}
}

print(isPowerOfThree(18))
