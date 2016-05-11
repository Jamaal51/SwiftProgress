//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Cameron

//func rotate(matrix: [[Int]]) -> [[Int]]{
//    var results: [[Int]] = []
//    
//    for i in 0..<matrix[0].count{
//        results.append([])
//    }
    // m X n matrix
    // 0,0 -> 0, n-1
    // 0, n-1 -> m-1, n-1


let sudokuBoard: [[Int]] = [[5,0,8,0,7,3,1,9,0],
    [9,0,0,6,0,0,4,0,8],
    [0,0,0,9,0,8,0,3,5],
    [0,7,0,0,0,0,0,6,0],
    [0,0,2,0,0,0,9,0,0],
    [0,1,0,0,0,0,0,8,0],
    [1,9,0,3,0,6,0,0,0],
    [2,0,3,0,0,7,0,0,9],
    [0,8,7,1,9,0,3,0,4]
]

func getValidNumbers(sudokuBoard:[[Int]], row:Int, col:Int)->[Int]{
    
    var valid: Set<Int> = [1,2,3,4,5,6,7,8,9]
    
    for c in 0..<sudokuBoard[row].count{
        if c == col{
            continue
        }
        if let value = sudokuBoard[row][c]{
            valid.remove(value)
        }
        
        
    }
    
    
    
}