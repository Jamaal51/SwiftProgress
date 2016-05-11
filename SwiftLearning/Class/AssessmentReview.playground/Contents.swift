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

//func printSpiral(twoDArray:[[Int]]){
//    if twoDArray.count == 0{
//        return
//    }
//    //intitalize indexes top, bottom, left, right
//    var top = 0
//    var bottom = twoDArray.count
//    var left = 0
//    var right = twoDArray.count
//    
//    print(right)
//}

//printSpiral(TwoDimensionalArray)



//Write a function that will check whether or not a fully filled sudoku board is a valid solution.

func checkSudokuBoard(sudokuBoard:[[Int]]) -> Bool {
    
    return true
}

//Big O

// O(1) < O(log(n)) < O(n) < O(n log(n)) < O (n^2) < O (2^n) < O(n!)

// Data Structures

/*
Arrays
Access - O(1), Search/Delete/Insert - O(n)

Lists
Access/Search - O(n), Insert/Delete - O(1)

Stacks
LIFO
Access/Search - O(n), Insert/Delete - O(1)

Queues
FIFO

Sets 
use cases: spellcheck, blacklists
add - O(1), O(n)*, remove - O(n), check- O(n), union- O(n)/O(nm)*, intersect - O(nm), difference- O(nm) subset- O(nm)
*with dupe checking

Hashmaps
rule 1: x==y, h(x)==h(y) ALWAYS, if not Invalid, ie use of NSDate
rule 2: x!=y, h(x)!=h(y), Usually, some values have same hash - collision
bucketing - creating a linked list at each index
open addressing - adding to an empty index

get hash value <- foo.hashValue % capacity(array.length)
add/remove/contains - O(n) , union/intersect/difference/subset- O(nm)

Trees
methods - O(log(n))

Graphs

SORTING ALGORITHMS

Quicksort - Average O(n log(n)), Worst O(n^2)

Merge - Worst O(n log(n))

Bubble - Worst O(n^2)

Insertion - Worst O(n^2)

Selection - Worst O(n^2)
*/

//Bubble Sort Implementation

func BubbleSort(inout unsortedArray:[Int]) {
    //var temp: Int;
    var sorted = false
    
    while (!sorted){
    sorted = true
    for i in 0..<unsortedArray.count-1{
        if unsortedArray[i+1] < unsortedArray[i]{
            let temp = unsortedArray[i+1]
            unsortedArray[i+1] = unsortedArray[i]
            unsortedArray[i] = temp
            sorted = false
            }
        }
        if sorted{
            break
        }
    }
}

var array:[Int] = [5,9,12,44,1,0,4,2,100,45]

BubbleSort(&array)


// Insertion Sort implementation

func InsertionSort(inout numberList:[Int]){
    var x, y, key : Int
    for (x = 0; x < numberList.count; x++) {
        key = numberList[x]
        for (y = x; y > -1; y--) {
            if (key < numberList[y]) {
                numberList.removeAtIndex(y + 1)
                numberList.insert(key, atIndex: y)
            }
        }
    }
}

InsertionSort(&array)

func InsertionSortTwo(inout numberList:[Int]){
    var y, key: Int // create variables
    for x in 0..<numberList.count{
        key = numberList[x]
        for (y=x; y >= 0; y--){
            if (key < numberList[y]){
                numberList.removeAtIndex(y+1)
                numberList.insert(key, atIndex: y)
            }
        }
    }
}

InsertionSortTwo(&array)














