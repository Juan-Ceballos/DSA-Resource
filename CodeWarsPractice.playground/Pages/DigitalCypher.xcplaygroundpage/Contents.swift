//: [Previous](@previous)

import Foundation

//function encode(str,  n)
//{
//  let alphabet = "abcdefghijklmnopqrstuvwxyz"
//  let result = []
//  let keyArr = Array.from(n.toString()).map(Number);
//  for (let i = 0; i < str.length; i++) {
//    let indexOfCurrLetter = alphabet.indexOf(str[i])
//    let encodeLetter = (indexOfCurrLetter + 1) + keyArr[(i % keyArr.length)]
//    result.push(encodeLetter)
//  }
//  return result;
//}
//
//function encode(str, n) {
//  const key = String(n)
//  return Array.from(str, (c, i) => c.charCodeAt(0) - 96 + Number(key[i % key.length]))
//}
//
//function encode(str, num) {
//  var key = num.toString();
//  return str.split('').map(function(char, i) {
//    return char.charCodeAt(0) - 96 + +key[i % key.length];
//  });
//}
