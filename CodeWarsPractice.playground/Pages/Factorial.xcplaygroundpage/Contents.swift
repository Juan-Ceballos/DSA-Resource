//: [Previous](@previous)

import Foundation

func factorial(n: Int) -> Int {
    
    if n <= 1 {
        return 1
    }
    
    return n * factorial(n: n - 1)
    
}

factorial(n: 5)

/*
 Java Script
 
const factorial = n => {
  if (n <= 1) {
    return 1
  }
  return n * factorial(n - 1);
};
*/
