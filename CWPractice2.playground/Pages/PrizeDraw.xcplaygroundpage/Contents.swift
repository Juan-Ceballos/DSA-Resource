//: [Previous](@previous)

import Foundation

func rank(_ st: String, _ we: [Int], _ n: Int) -> String {
  let noPart = "No participants"
  let notEnough = "Not enough participants"
  if st.isEmpty {return noPart}
  let names = st.split(separator: ",").map{String($0)}
  if n > names.count {return notEnough}
  var values = [(Int, String)]()
  
  for (index, name) in names.enumerated() {
    let value = name.count + letterVal(name)
    let weight = we[index]
    let total = value * weight
    let rankTuple = (total, name)
    values.append(rankTuple)
  }
  
  let sortedValues = values.sorted{($0.0, $1.1) > ($1.0, $0.1)}
  let winner = sortedValues[n - 1].1
  return winner
}

func letterVal(_ name: String) -> Int {
  let letters = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  let lettersArr = letters.split(separator: ",").map{String($0)}
  var sum = 0
  let offset = 1
  
  for char in name {
    let letter = String(char).lowercased()
    let alphabetVal = lettersArr.firstIndex(of: letter)! + offset
    sum += alphabetVal
  }
  
  return sum
}

/*
separate list of names into array
- str.split using coma
calculate value of each name
- name.count + index of alphabet arr for each letter * matching weight
sort the ranks
- .sort with conditional alphabetical
grab ranks[n]
*/


func rank2(_ st: String, _ we: [Int], _ n: Int) -> String {
    guard !st.isEmpty else { return "No participants"}
    guard we.count >= n else { return "Not enough participants"}
    let participants = st.components(separatedBy: ",")
    let winningNumbers = zip(we,
                             participants
                               .map { $0.uppercased()
                                        .utf8
                                        .map{ Int($0) - 64 }
                                        .reduce(0, +) + $0.count }
                            ).map(*)

    let listWinners = zip(participants, winningNumbers)
                        .sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }
    return listWinners[n-1].0
}
