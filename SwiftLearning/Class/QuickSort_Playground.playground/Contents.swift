//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    // base case
    if firstIdx >= lastIdx {return}
    
        // partition
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}

func quickSort(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    // set pivotValue to firstElement
    var pivotValue = arr[firstIdx]
    // set leftMark
    var leftMark = firstIdx+1 //arr.indexOf(pivotValue)!+1
    // set rightMark
    var rightMark = lastIdx
    
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    
    
    while leftMark <= rightMark {
        while arr[leftMark] < pivotValue && leftMark <= rightMark{
            leftMark += 1
        }
        while arr[rightMark] > pivotValue && leftMark <= rightMark{
            rightMark -= 1
        }
        if leftMark < rightMark {
        swap(&arr[leftMark], &arr[rightMark])
        }
    }
    if firstIdx != rightMark{
        swap(&arr[firstIdx], &arr[rightMark])
    }
    
    // set the correct value at the splitPoint
    return rightMark  // return the splitPoint
}



var myArray = [22,59,38,93,95,0,34,58,72,15]

quickSort(&myArray)


//Exercises

//Implement quicksort with the median pivot selection technique.
//write median pivot selection function
//swap with first element
//run quicksort!

func insertionSort(inout numberList:[Int]){
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


func findMedian(inout arr:[Int]) -> Int {
    let first : Int = arr.first!
    let last : Int = arr.last!
    let midIdx = arr.count/2
    let mid : Int = arr[midIdx]
    
    var unsortedArray:[Int] = [first, mid, last]

    insertionSort(&unsortedArray)
    
    return unsortedArray[1]
}

var arr = [19, 233, 53, 78, 90, 2, 4, 5]

findMedian(&arr)


struct Stack<T> {
    var items:[T]
    //push
    
    mutating func push(element:T){
        items.append(element)
    }
    
    //pop
    mutating func pop() -> T?{
        if items.count == 0 {
            return nil
        }
        return items.removeLast()
    }
    
    //peek
    func peek() -> T?{
        return items.last
    }
    
    //size
    func size() -> Int{
        return items.count
    }
}

struct Queue<T> {
    var items:[T]
    //enqueue
    
    mutating func enqueue(element:T){
        items.append(element)
    }
    
    mutating func dequeue() -> T?{
        if items.count == 0 {return nil}
        
        return items.removeLast()
    }
    func size() -> Int{
        return items.count
    }
}




