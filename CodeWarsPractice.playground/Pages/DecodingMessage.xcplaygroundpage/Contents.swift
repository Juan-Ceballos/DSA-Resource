//: [Previous](@previous)

import Foundation
//
//function decode(message){
//  let alphabet = "abcdefghijklmnopqrstuvwxyz"
//  let result = ""
//  for (let i = 0; i < message.length; i++) {
//    if (message[i] === " ") {
//      result += " "
//      continue
//    }
//    let j = 25 - alphabet.indexOf(message[i])
//    result += alphabet[j]
//  }
//  return result
//}
//var decode = m => [...m].map(x=>x==" " ? x : String.fromCharCode(219-x.charCodeAt())).join("");
//
//function decode(m){s=""; for (i=0;i<m.length;i++) s+=(a=m.charCodeAt(i))==32?' ':String.fromCharCode(219-a); return s}
