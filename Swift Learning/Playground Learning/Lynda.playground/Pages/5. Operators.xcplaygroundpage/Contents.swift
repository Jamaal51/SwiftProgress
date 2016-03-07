//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//Ternary Conditional 

let name = "Charlotte"

let salutation = name.isEmpty ? "Hello" : "Hi \(name)!"

name.isEmpty ? print("No name given") : print("Name is \(name)")


let birthYear = 2005

// nil coalescing  ??

let defaultSize = "M"

var selectedSize: String?

let orderSize = selectedSize ?? defaultSize  //if selectedSize returns nil ?? returns defaultSize

//using range operators

let rangeA = 0..<10

let rangeB = 0...10

var palindrome = "A man a plan a canal Panama"

//palindrome.isPalindrome()

let startIndex = palindrome.startIndex.advancedBy(13)

let endIndex = palindrome.endIndex.advancedBy(-8)

let replacement = "a cat a ham a yak a yam a hat a canal"

let range = startIndex...endIndex

palindrome.replaceRange(range, with: replacement)

var fibonacciNumbers = [1,3,6,10,15,21]

let rangeToReplace = fibonacciNumbers.startIndex.successor() ..< fibonacciNumbers.endIndex.predecessor()

let range2 = 1..<5

let replacement2 = [1,2,3,5,8,13]

//fibonacciNumbers.replaceRange(rangeToReplace, with: <#T##CollectionType#>

fibonacciNumbers.replaceRange(range2, with: replacement2)

//using type checking & casting operators

class ClassA {
    var classAProperty = 867_5309
}

class ClassB: ClassA {
    var classBProperty = "Stay class San Diego"
}

let a = ClassA()
let b = ClassB()

let arrayOfClassInstances = [a,b]

let item1 = arrayOfClassInstances[0]
item1.classAProperty

let item2 = arrayOfClassInstances[1]
item2 is ClassB

let classBInstance = item2 as! ClassB
classBInstance.classBProperty
classBInstance.classAProperty





//: [Next](@next)
