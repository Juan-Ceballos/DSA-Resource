//: [Previous](@previous)

import Foundation

func travel(_ r: String, zipcode: String) -> String {
  /*
  r string of addresses separated by ,
  zipcode, zipcode to group return string by
  
  separate into array of addresses
  filter address based on zipcode
  break up house number based on whitesplace
  for loop {
    setup string format using zipcode and
    arr[1...count - 1]
  }
  */
  let addresses = r.split(separator: ",")
  let travelingAreas = addresses.filter{$0.contains(zipcode)}
  var res = "\(zipcode):"
  var homes = [String]()
  print(travelingAreas)
  for (index, element) in travelingAreas.enumerated() {
    let arr = element.split(separator: " ").map{String($0)}
    let checkZip = arr[arr.count - 2] + " " + arr[arr.count - 1]
    if checkZip != zipcode {return res + "/"}
    if index != travelingAreas.count - 1 {
      res += "\(Array(arr[1..<arr.count - 2]).joined(separator: " ")),"
    } else {
        res += "\(Array(arr[1..<arr.count - 2]).joined(separator: " "))"
    }
    homes.append(arr[0])
  }
  res += "/"
  for (index, home) in homes.enumerated() {
    if index != homes.count - 1 {
      res += "\(home),"
    } else {
      res += home
    }
  }
  return res
}
