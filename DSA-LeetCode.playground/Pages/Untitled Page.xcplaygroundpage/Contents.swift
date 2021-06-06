//: [Previous](@previous)

import Foundation

/*

Given a m * n matrix mat of ones (representing soldiers) and zeros (representing civilians), return the indexes of the k weakest rows in the matrix ordered from the weakest to the strongest.

A row i is weaker than row j, if the number of soldiers in row i is less than the number of soldiers in row j, or they have the same number of soldiers but i is less than j. Soldiers are always stand in the frontier of a row, that is, always ones may appear first and then zeros.

*/


/*

Example input:

let matrix = [[1,1,0,0,0],
              [1,1,1,1,0],
              [1,0,0,0,0],
              [1,1,0,0,0],
              [1,1,1,1,1]]
let k = 3

Example output:

let correctOutput = [2,0,3]

*/

/*

Questions:
At least k rows
none empty

weakest rows
less soldiers = less 1s in array
if tied, more zeros

each row is the same size

Algo:
create empty [(Int, Int)]
iterate throught the matrix
store index
count the number of ones: firstindex(of), count iteration
iterate through result array of tuple
grab index value until k

*/

func weakestSoldiers(matrix: [[Int]], k: Int) -> [Int] {
  var rowStrengths = [(Int, Int)]()
  var resultsArr = [Int]()

  for (index, row) in matrix.enumerated() {
    let count = row.count - 1
    let lastSoldier = row.lastIndex(of: 1) ?? 0 + 1
    let strength = lastSoldier + 1
    let tuple = (strength, index)

    rowStrengths.append(tuple)


  }

  print(rowStrengths)

  for row in rowStrengths {
    row
  }

  return resultsArr
}

weakestSoldiers(matrix: [[1,1,0,0,0],
              [1,1,1,1,0],
              [1,0,0,0,0],
              [1,1,0,0,0],
              [1,1,1,1,1]], k: 3)
