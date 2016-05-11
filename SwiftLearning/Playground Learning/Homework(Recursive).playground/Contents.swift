//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. Write an iterative (not recursive) fibonacci function that calculates the nth fibonacci number. How does its performance compare with the non-memoized recursive one (see Appendix A below), based on the number of iterations that Swift says it takes in the right margin?


//func fib(n: Int) -> Int {
//    print("X")
//    if (n == 0 || n == 1) {
//        return 1
//    }
//    return fib(n - 1) + fib(n - 2)
//}
//
//func fibIterative(n: Int) -> Int {
//    var a = 1
//    var b = 1
//    for _ in 0..<n{
//        let t = a
//        a = b
//        b = t + b
//    }
//    return b
//}
//fibIterative(5)


//func findFile(name: String, atPath: String) -> String {
//    let fileManager = NSFileManager.defaultManager()
//    let contents =
//    try! fileManager.contentsOfDirectoryAtPath(atPath)
//    for fileOrDir in contents {
//        var isDir = ObjCBool(false);
//        let fullPath = atPath + "/" + fileOrDir
//        let exists = fileManager.fileExistsAtPath(fullPath, isDirectory: &isDir)
//        if exists && Bool(isDir) {
//            // YOUR CODE HERE
//            let result = findFile(name, atPath: fullPath)
//            if result != "NOT FOUND"{
//                return result
//            }
//            print("DIR: " + fileOrDir)
//        } else if exists {
//            // YOUR CODE HERE
//            if fileOrDir == name{
//                return fullPath
//            }
//            print("FILE: " + fileOrDir)
//        } else {
//            print("NEITHER: " + fileOrDir)
//        }
//    }
//    return "NOT FOUND"
//}

// MERGE SORT

func mergeSort(values: [Int])->[Int]{
    let n = values.count
    //check length of values, return values if count is less than 2
    if n < 2{
        return values
    }
    //split values into left and right (roughly equal size)
    
    var left = Array(values[0..<n / 2])
    var right = Array(values[n / 2..<n])
    
    //sort the left half
    left = mergeSort(left)
   
    //sort the right hald
    right = mergeSort(right)
    
    //merge the two halves together
    // return the result
    return merge(withLeft: left, andRightArray: right)
}

func merge(withLeft left:[Int], andRightArray right:[Int])->[Int]{
    //take the minimum of the two and add it to the result
    
    //iterate over both left and right at the same time
    var result: [Int] = []
    
    var i = 0
    var j = 0
    
    //compare pairs of values in left and right
    while i < left.count || j < right.count {
        if j >= right.count || left[i] < right[j] {
            //take left[i]
            result.append(left[i])
            i+=1
        } else if j < right.count {
            result.append(right[j])
            j+=1
        }
        
    }
    return result
}

mergeSort([2,5,1,65])




