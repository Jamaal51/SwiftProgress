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
    for var i in mid..<N{
        rightArray[i-mid] = array[i]
    }
    
    MergeSort(leftArray, N: mid)
    MergeSort(rightArray, N: N-mid)
    Merge(array, leftArray: leftArray, rightArray: rightArray, leftCount: mid, rightCount: N-mid)
    
}

MergeSort([3,5,1,2,7,6], N: 6)










