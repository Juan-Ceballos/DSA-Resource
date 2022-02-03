//: [Previous](@previous)

import Foundation

func stat(_ strg: String) -> String {
  let statArr = strg.split(separator: ",").map{String($0)}
  var rawData = [[String]]()
  
  for st in statArr {
    let stParts = st.split(separator: "|").map{String($0)}
    rawData.append(stParts)
  }
  
  let rawDataSorted = rawData.sorted{(Int($0[0])!, Int($0[1])!, Int($0[2])!) <
                                     (Int($1[0])!, Int($1[1])!, Int($1[2])!)}
  let med = getMedian(rawDataSorted)
  let avg = getAverage(rawDataSorted)
  let r = getRange(rawDataSorted)
  
  return "Range: \(r[0])|\(r[1])|\(r[2]) Average: \(avg[0])|\(avg[1])|\(avg[2]) Median: \(med[0])|\(med[1])|\(med[2])"
}

func getRange(_ vals: [[String]]) -> [String] {
  let max = vals[vals.count - 1]
  let min = vals[0]
  
  let totalMax = (Int(max[0])! * 60 * 60) + (Int(max[1])! * 60) + Int(max[2])!
  let totalMin = (Int(min[0])! * 60 * 60) + (Int(min[1])! * 60) + Int(min[2])!
  let rangeSecs = totalMax - totalMin
  
  let hours = rangeSecs / 60 / 60
  let mins = (rangeSecs / 60) % 60
  let secs = rangeSecs % 60 % 60
  
  let secString = String(format: "%02d", hours)
  let minString = String(format: "%02d", mins)
  let hourString = String(format: "%02d", secs)

  return [secString, minString, hourString]
}

func getMedian(_ vals: [[String]]) -> [String] {
  let count = vals.count
  let middle = vals.count / 2
  var mids = [[String]]()
  
  if count % 2 == 0 {
    mids.append(vals[middle])
    mids.append(vals[middle - 1])
    return getAverage(mids)
  } else {
    return vals[middle]
  }
}

func getAverage(_ vals: [[String]]) -> [String] {
  var res = [String]()
  var h = 0
  var m = 0
  var s = 0
  
  for val in vals {
    h += Int(val[0])!
    m += Int(val[1])!
    s += Int(val[2])!
  }
  
  let total = ((h * 60 * 60) + (m * 60) + s) / vals.count
  let hours = total / 60 / 60
  let mins = (total / 60) % 60
  let secs = total % 60 % 60
  
  // total seconds to hours mins secs
  //let sConvert = (s / 60) / vals.count
  //let mConvert = (m / 60) + (s % 60) / vals.count
  //let hConvert = (h) + (m % 60) / vals.count
  
  let secString = String(format: "%02d", hours)
  let minString = String(format: "%02d", mins)
  let hourString = String(format: "%02d", secs)

  return [secString, minString, hourString]
}
/*
  break appart each runner start using ,
  for each calc 02\15\59 -> 02,15,59
  store each in array
  calc using arrays and helper
*/
