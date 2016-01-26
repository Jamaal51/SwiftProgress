//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var arr = [4, 3, 1, 6, 9, 2, 11, 100, 55]
var sortedArr = [Int]()

//func bubbleSort (arr:[Int]) -> [Int]{
//    
//for i in 0..<arr.count {
//    var place = Int()
//    if (arr[i] > arr[i+1]){
//        place = arr[i]
//        arr[i] = arr[i + 1]
//    }
//    sortedArr.append(i)
//}
//
//    return [Int]()
//
//}

func bubbleSortTwo(var arr:[Int]) -> [Int]{ //inout -- pass by reference
    
    var swapped = true
    var temp: Int
    
    while(swapped){
        swapped = false
        
        for i in 0..<arr.count-1 {
            
            if arr[i] > arr[i+1]{
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                swapped = true
            }
            
        }
        
    }
    return arr
}
print(bubbleSortTwo(arr))  //&arr

// cocktail sort

var arrTwo = [1,4,8,5,3,2,50,35]

func cocktailSort(arr:[Int]) -> [Int]{
    
    var swapped = true
    var temp2: Int
    
    while(swapped){
        swapped = false
        for i in 0..<arrTwo.count-1{
            if arrTwo[i] > arrTwo[i+1]{
                temp2 = arr[i]
                arrTwo[i] = arr[i+1]
                arrTwo[i+1] = temp2
            for i in arrTwo.count-1...0{
                if arrTwo[i-1] > arrTwo[i]{
                    temp2 = arr[i-1]
                    arrTwo[i-1] = arr[i]
                    arrTwo[i] = temp2
                    swapped = true
                }
                
                }
            }
        }
    }
    return arrTwo
}
//cocktailSort(arrTwo)

/*Spiral Problem

input: [1   2  3 4]
       [12 13 14 5]
       [11 16 15 6]
       [10  9  8 7]

output: [1, 2, 3, ... 16]

*/

//func swap (arr:[Int])->[Int]{
//
//    var temp: [Int]
//    
//    for i in 0..<arr.count-1{
//    if arr[i] > arr[i+1]{
//        temp = arr[i]
//        arr[i] = arr[i+1]
//        arr[i+1] = temp
//        }
//    
//}
//


    let array1 = [[1,2,3,4], [12, 13, 15, 5], [11, 16, 15, 6], [10, 9, 8, 7]]
    var tempArray: [Int]
    var sorted = true

//func sortArrays (array1:[Int]) -> [Int]{
//    sorted = false
//    
//    while (sorted){
//        
//    for i in 0...array1.count{
//            bubbleSortTwo(array1[i])
//        }
//    }
//    return array1
//}



/*
3. You are given an array of 0s and 1s in random order. Segregate 0s on left side and 1s on right side of the array. Traverse array only once.
Input array   =  [0, 1, 0, 1, 0, 0, 1, 1, 1, 0]
Output array =  [0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
Followup question: how much space does your algorithm use (do not count the space taken up by the input array a)? Can you revise your algorithm to use O(1) space?
*/


// SORTING (w/ Caleb)

//inserting into sorted list

func insert(x: Int, var intoSortedList xs: [Int])->[Int]{
    var didInsertX = false
    for i in 0..<xs.count{
        
        if (x < xs[i]){
            xs.insert(x, atIndex:i)
            didInsertX = true
            break
        }
    }
    if !didInsertX{
        xs.append(x)
    }
    return xs
}

insert(6, intoSortedList: [1,2,4,5])
insert(2, intoSortedList: [1,2,4,5])

insert(3, intoSortedList: [1,2,3,4])


// insertion sort

func insertion_sort(xs:[Int])->[Int]{
    var sortedSoFar = [Int]()
    for x in xs {
       sortedSoFar = insert(x, intoSortedList: sortedSoFar)
    }
    return sortedSoFar
}

insertion_sort([0,0,0,0,1,0,0])


//Selection Sort

func select(xs: [Int], startingAt k: Int) -> Int{
    var minIndex = k
    for i in (k + 1)..<xs.count{
        if xs[i] < xs[minIndex]{
            //we find new minimum
            minIndex = i
        }
    }
    return minIndex
}

select([0,1,2,3,9,5,4,6], startingAt: 4)
select([8,6,7,5,3,0,9], startingAt: 0)
select([0,1,2,6,3,5,4], startingAt: 3)


func selection_sort(inout xs:[Int]) -> [Int]{
    for sortedSoFar in 0..<xs.count{
        let minIndex = select(xs, startingAt: sortedSoFar)
    (xs[sortedSoFar], xs[minIndex])=(xs[minIndex], xs[sortedSoFar])
    }
    return xs
}

var xs = [8,6,7,5,3,0,9]
selection_sort(&xs)

// Bucket Sort
