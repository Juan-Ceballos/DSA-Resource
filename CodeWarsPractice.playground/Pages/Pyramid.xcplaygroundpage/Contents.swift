//: [Previous](@previous)

import Foundation

func pyramid(_ balls: Int) -> Int{
  var currLevel = 0
  var ballsLeft = balls
  
  repeat {
    currLevel += 1
    ballsLeft -= currLevel
  } while ballsLeft >= 0
  
  return currLevel - 1
}

/*
 func pyramid(_ balls: Int) -> Int{
   var levels = 1
   var tempBalls = balls
   if balls == 1 {return 1}
   while(tempBalls - levels) >= 0 {
     tempBalls -= levels
     levels += 1
   }
   
   return levels - 1
 }
 */
