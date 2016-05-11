//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//func sum (xs: [Int]) -> Int{  // (adds up all the numbers in xs)
//    var sum = 0
//    for x in 0..<xs.count{
//    sum += x
//    }
//    return sum
//}

func sum (xs: [Int]) -> Int{  // (adds up all the numbers in xs)
    
    if let head = xs.first{
        let tail = Array(xs.dropFirst())
        return head + sum(tail)
    } else {
        return 0
    }

}

let myNUmbers = [1,2,3,4,5,6]
sum(myNUmbers)


func contains(xs: [Int], y: Int) -> Bool{ //(true if y is in the (unsorted) array xs)

    if xs.contains(y){
        return true
    } else {
       return false
    }
}

let numbers = [1,2,3,4,5, 6]
contains(numbers, y: 6)

func factorial(x: Int) -> Int {
    if (x-1 != 0){
    var product = x * (x-1)
 }
    return factorial(x-1)
}

factorial