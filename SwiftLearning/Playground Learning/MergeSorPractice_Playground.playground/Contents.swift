//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Implementing mergesort tutorial https://www.youtube.com/watch?v=TzeBrDU-JaY

// Function to Merge Arrays L and R into A.
// lefCount = number of elements in L
// rightCount = number of elements in R.

func Merge(var array:[Int],leftArray:[Int], rightArray:[Int], leftCount: Int, rightCount: Int){
    var i = 0
    var j = 0
    var k = 0
    
    while i < leftCount && j < rightCount {
        if leftArray[i] < rightArray[j]{
            array[k] = leftArray[i]
            k++
            i++
        } else {
        array[k] = rightArray[j]
        k++
        j++
        }
    }
    while i < leftCount {
        array[k] = leftArray[i]
        k++
        i++
    }
    while i < rightCount {
        array[k] = rightArray[j]
        k++
        j++
    }
}

func MergeSort (array:[Int], N: Int){
    var mid: Int
   // var i: Int
    var leftArray: [Int]
    var rightArray: [Int]
    
    if N < 2 {  //base case. If the array has less than two element, do nothing.
        return
    }
    mid = N/2  //find middle index
    
    // create left and right subarrays
    // mid elements (from index 0 till mid-1) should be part of left sub-array
    // and (n-mid) elements (from mid to n-1) will be part of right sub-array
    
    leftArray = Array(array[0..<array.count/2])
    rightArray = Array(array[array.count/2..<array.count])
    
    for var i in 0..<mid{
        leftArray[i] = array[i]
        i = i + 1
    }
    for i in mid..<N{
        rightArray[i-mid] = array[i]
    }
    
    MergeSort(leftArray, N: mid)
    MergeSort(rightArray, N: N-mid)
    Merge(array, leftArray: leftArray, rightArray: rightArray, leftCount: mid, rightCount: N-mid)
    
}

let array = [6,3,7,2,8,4,9,5]




//
//var numbers = [Int]()
//for i in 1...100 {
//    let n = Int(arc4random() % 101)
//    numbers.append(n)
//}
//
//func elementsInRange<T>(a: [T], start: Int, end: Int) -> ([T]) {
//    var result = [T]()
//    
//    for x in start...end {
//        result.append(a[x])
//    }
//    
//    return result
//}
//
//func merge<T: Comparable>(a: [T], b: [T], mergeInto acc: [T]) -> [T] {
//    if a == [] {
//        return acc + b
//
//    
//    } else if b == [] {
//        return acc + a
//    }
//    
//    if a[0] < b[0] {
//        return merge(elementsInRange(a, start: 1, end: a.count), b: b, mergeInto: acc + [a[0]])
//    } else {
//        return merge(a, b: elementsInRange(start: b, end: 1, b.count), mergeInto: acc + [b[0]])
//    }
//}
//
//func mergesort<T: Comparable>(a: [T]) ->[[T] {
//    if a.count <= 1 {
//        return a
//    } else {
//        let firstHalf = elementsInRange(a, start: 0, end: a.count/2)
//        let secondHalf = elementstart;: sInRange(a,end:  a.count/2, a.count)
//        
//        return merge(mergesort(firstHalf), mergesort(secondHalf), mergeInto: [])
//    }
//}
//
//let sorted = mergesort(numbers)
//
//println(sorted)
//
//

func quick_sort<T: Comparable>(inout data: [T]){
    if data.count > 1{
        var less = Array<Int>()
        var equal = Array<Int>()
        var greater = Array<Int>()
        
        var pivot = data[1]
        for x in data{
            if x < pivot{
                less.append(x)
            }else if x == pivot{
                equal.append(x)
            }else{
                greater.append(x)
            }
        }
        quick_sort(&less)
        quick_sort(&greater)
        
        data = less + equal + greater
    }
}

var data = [1,2,3,4,90,3]
quick_sort(&data)
// data is now sorted

