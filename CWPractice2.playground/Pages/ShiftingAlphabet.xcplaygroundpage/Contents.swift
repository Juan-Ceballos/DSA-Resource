//: [Previous](@previous)

import Foundation

func playPass(_ s: String, _ n: Int) -> String {
  print(n)
  print(s)
  let shifted = shift(s, n)
  let comp = complement(shifted)
  let dU = downUp(comp)
  return String(dU.reversed())
}

func shift(_ s: String, _ n: Int) -> String {
  if n == 0 {return s}
  let alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  let arr = alphabet.split(separator: ",").map{String($0)}
  let arr2 = arr.map{$0.uppercased()}
  var temp = Array(s).map{String($0)}

  for (index, char) in temp.enumerated() {
    if let place = arr.firstIndex(of: char) {
      if place + n <= 25 {temp[index] = arr[place + n]}
      else {temp[index] = arr[(place + n + 24) % n]}
//         25
//         n = 3
//         alph = 3
//         out = g, 6
//         25 + 3 + 3 = 31, 31 % 25 = 6
//         25 + 3 + 25 = 53, 53 % 25 = 3
//         25 + 1 + 25 = 51, 51 % 25 = 1
      // 24 + 1 + 25 = 50
      }
    if let place2 = arr2.firstIndex(of: char) {
      if place2 + n <= 25 {temp[index] = arr2[place2 + n]}
      else {temp[index] = arr2[(place2 + n + 24) % 25]}
    }
  }
  
  return temp.joined()
}

func complement(_ s: String) -> String {
  var temp = Array(s).map{String($0)}
  for (index, char) in temp.enumerated() {
    if let digit = Int(String(char)) {
      temp[index] = String((9 - digit))
    }
  }
  
  return temp.joined()
}

func downUp(_ s: String) -> String {
  let alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  let arr = alphabet.split(separator: ",").map{String($0)}
  let arr2 = arr.map{$0.uppercased()}
  
  var temp = Array(s).map{String($0)}
  for (index, char) in temp.enumerated() {
    if arr.contains(String(char)) || arr2.contains(String(char)) {
      if index % 2 == 0 {
        temp[index] = String(char).uppercased()
      } else {
        temp[index] = String(char).lowercased()
      }
    }
  }
  
    return temp.joined()
}
