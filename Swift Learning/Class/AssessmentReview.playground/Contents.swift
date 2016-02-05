//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//And print out all the elements starting with the first row and ending with the last row.
//How would the code be different if:

// You started with the first column and ended with the last column?

let TwoDimensionalArray:[[Int]] = [[0,1,2,3],
                                   [4,5,6,7],
                                   [8,9,10,11],
                                   [12,13,14,15]]

for x in 0..<TwoDimensionalArray.count{
    for y in 0..<TwoDimensionalArray.count{
        //print(TwoDimensionalArray[x][y])
    }
}

// You excluded the first row and excluded the last column?

for x in 1..<TwoDimensionalArray.count-1{
    for y in 0..<TwoDimensionalArray.count{
        //print(TwoDimensionalArray[x][y])
    }
}

// You print only the diagonal? How about exclude the diagonal?

for var x in 0..<TwoDimensionalArray.count{
    for var y in 0..<TwoDimensionalArray.count{
        //print(TwoDimensionalArray[x][y])
        x++
        y++
    }
}

//Exclude the diagonal

for var x in 0..<TwoDimensionalArray.count{
    for var y in 0..<TwoDimensionalArray.count{
        if x != y {
        //print(TwoDimensionalArray[x][y])
        }
    }
}

// You print only the items on the border?
//for x in 0..<1{
//    for y in 0..<TwoDimensionalArray.count{
//        print(TwoDimensionalArray[x][y])
// }
//}
//for x in 1..<TwoDimensionalArray.count{
//    for y in TwoDimensionalArray.count-1..<TwoDimensionalArray.count{
//        print(TwoDimensionalArray[x][y])
//    }
//}
//for x in TwoDimensionalArray.count-1..<TwoDimensionalArray.count{
//    for y in (0..<TwoDimensionalArray.count-1).reverse(){
//        print(TwoDimensionalArray[x][y])
//    }
//}
//for x in (1..<TwoDimensionalArray.count-1).reverse() {
//    for y in 0..<1{
//        print(TwoDimensionalArray[x][y])
//    }
//}


//Print out all the elements in a spiral.

func printSpiral(twoDArray:[[Int]]){
    if twoDArray.count == 0{
        return
    }
    //intitalize indexes top, bottom, left, right
    var top = 0
    var bottom = twoDArray.count
    var left = 0
    var right = twoDArray.count
    
    print(right)
}

printSpiral(TwoDimensionalArray)



//Write a function that will check whether or not a fully filled sudoku board is a valid solution.

func checkSudokuBoard(sudokuBoard:[[Int]]) -> Bool {
    
    return true
}



