import UIKit

func phone(_ strng: String, _ num: String) -> String {
    /*
      each phone address separated by new line
      separate each address to work on using the /n
      get the desired format and add them all together into result str
      separate name from current string using <>
      separate po in strng
      Phone => num, Name => <name>, address =>
      for address filter out str to only address elements and combine
      we're looking for one string in phonebook that matches given strn and num param
      1) check for error if not save line that we're formatting and returning
          - turn into array of strings using components and \n as separator
          - iterate and find string that contains num store string
          - keep count of string with that num if count > 1 return erro
          - if count = 0 return other error
      2) format the found string
          - separate string by spaces, and put together address string
    */
  let strArr = strng.split(separator: "\n")
  var count = 0
  var line = ""
  let notFound = "Error => Not found: \(num)"
  let tooMany = "Error => Too many people: \(num)"
  for str in strArr {
    if str.contains(num) {
      count += 1
      line = String(str)
    }
    if count > 1 {return tooMany}
  }
  if count == 0 {
    return notFound
  }
  let lineArr = line.split(separator: " ")
  //print(lineArr)
  var addressParts = lineArr.filter{!$0.contains("+") && !$0.contains("<") && !$0.contains(">")}.map{String($0)}
  print(addressParts)
  let nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  for num in 0..<addressParts.count {
    addressParts[num] = addressParts[num].trimmingCharacters(in: .whitespaces)
    if addressParts[num].contains("-") {
      let arr = addressParts[num].split(separator: "-")
      if arr.count == 2 {
        if (Int(arr[0]) != nil || Int(arr[1]) != nil) {
          continue
        }
      }
    }
    addressParts[num] = adjustStr(addressParts[num])
    addressParts[num] = addressParts[num].trimmingCharacters(in: .whitespaces)
  }
  print(addressParts)
  let nameParts = lineArr.filter{$0.contains("<") || $0.contains(">")}.map{String($0)}
  var name = nameParts.joined(separator: " ")
  //print(name)
  let fi = name.startIndex
  let li = name.index(name.endIndex, offsetBy: -1)
  name.remove(at: li)
  name.remove(at: fi)
  //print(name)
  let fullAddress = addressParts.joined(separator: " ")
  //print(fullAddress)
  // clean up string ***
  let phoneBookLine = "Phone => \(num), Name => \(name), Address => \(fullAddress)"
  //print(num)
  return phoneBookLine
}

func adjustStr(_ str: String) -> String {
  let illegalChars = ["!", "@", "#", "$", "%", "^", "*", "-", "_", ",", "/", ";"]
  var strArr = Array(str).map{String($0)}
  for (index, char) in strArr.enumerated() {
    if illegalChars.contains(char) {
      strArr[index] = " "
    }
  }
  return strArr.joined(separator: "")
}
