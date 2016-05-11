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

let classBActingAsClassAInstance = classBInstance as ClassA   //upcast
//classBActingAsClassAInstance.classBProperty

class ClassC{
}

let arrayOfAnyObjects: [AnyObject] = [a, b, ClassC()]

let definitelyClassAInstance = arrayOfAnyObjects[0] as! ClassA

let maybeClassAInstance = arrayOfAnyObjects[0] as? ClassA
maybeClassAInstance?.classAProperty

(arrayOfClassInstances[1] as? ClassB)?.classAProperty


// BIT WISE OPERATORS

//binary notation - uses series of 0s and 1s 

// each column is a base of 2 power

//  32   16   8   4   2   1 = binary
// 2^5 2^4 2^3 2^2 2^1 2^0

//writing binary in swift prefix - 0b

let ten = 0b001010

let one = 0b1 //0001

let two = one << 1 //0010

let four =  one << 2 // 0100

let sixteen = one << 4 // 010000

let eight = sixteen >> 1 // 01000

let zero: UInt8 = 0b00000

~zero // 11111111

let A = 0b111100
let B = 0b001111

A & B //  001100   are the only common bits between A & B

A | B // 111111












//: [Next](@next)
