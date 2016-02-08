//: Playground - noun: a place where people can play

import UIKit

//Cracking the Coding Interview Chapter 1

//1.1 Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func isUnique (str:String) -> Bool {
    
    let strArray = Array(str.characters)
    let strSet = Set(strArray)
    
    if strArray.count == strSet.count {
        return true
    } else {
        return false
    }
    
}

isUnique("baseball")
isUnique("lane")

/*Method
1. take the string and turn its characters into an array
2. take the array of characters and turn that into a set
3. compare the count of set and count of array
4. sets remove duplicates so count of set and array of same word should be 
   different in size
*/

//1.2 Given two strings write a method to decide if one is a permutation of the other"

func arePermutations (str1: String, str2: String) -> Bool{
    
    let strArray1 = Array(str1.characters)
    let strArray2 = Array(str2.characters)
//    let strSet1 = Set(strArray1)
//    let strSet2 = Set(strArray2)
    
    
    if strArray1.count != strArray2.count {
        return false
    } else {
        return strArray1.sort(<) == strArray2.sort()
    }
}

arePermutations("cat", str2: "tac")
arePermutations("doog", str2: "god")
arePermutations("bhui", str2: "uhib")
arePermutations("taac", str2: "catt")

//1.3 Write a method to replace all the spaces in a string with %20

func swapSpaces (str:String) -> String{
    
    return str.stringByReplacingOccurrencesOfString(" ", withString: "%20")
    
}

swapSpaces("Bob Miller ")

// 1.4 Given a string, write a function to check if it is a premutation of a palindrome
//ie: input: "taco cat"
//   output: "cato tac"








