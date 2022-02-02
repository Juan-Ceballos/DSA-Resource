//: [Previous](@previous)

import Foundation

func movie(card: Double, ticket: Double, perc: Double) -> Int {
  var visits = 1
  let nf = NumberFormatter()
  nf.roundingMode = .ceiling
  
  while (Double(nf.string(for: (ticket * Double(visits)))!)!) <= Double(nf.string(for:(card + calcPerc(basePrice: ticket, multiplier: perc, n: visits)))!)! {
    visits += 1
  }
  
  return Int(visits)
}

func calcPerc(basePrice: Double, multiplier: Double, n: Int) -> Double {
  var sum = 0.0
  
  for num in 1...n {
    sum += basePrice * (pow(multiplier, Double(num)))
  }
    
  return sum
}

// -------------

// ceil(_ :) -> Returns the ceiling of each element in a vector.
import Foundation
func movie2(card: Double, ticket: Double, perc: Double) -> Int {
    var (A, B) = (0.0, card)
    var count = 0
    var cur_price = ticket * perc
    while (ceil(B) >= ceil(A)) {
        A += ticket
        B += cur_price
        cur_price = cur_price * perc
        count += 1
    }
    return count
}


func movie3(card: Double, ticket: Double, perc: Double) -> Int {
    var res = 0, a = 0.0, c = card, t = ticket
    while ceil(a) <= ceil(c) {
        a = a + ticket
        t = t * perc
        c += t
        res += 1
    }
    return res
}
