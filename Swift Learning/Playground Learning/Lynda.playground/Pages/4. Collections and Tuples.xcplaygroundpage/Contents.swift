//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

var threeStooges = ["Moe","Larry", "Curly"] //array type infered by type of content

var inningScores: [Int] = []

//also to initialize 
var inningScores2: [Int]
inningScores2 = []

var testScores = [Double]()

var quizScores: Array<Double> = []
var quarterlyScores = Array<Double>()

var turnstileCounts = Array(count: 20, repeatedValue: 0) //initializes as an array of 20 all equal to 0

var snowboardScores = [Double](count: 4, repeatedValue: 10.0)

//arrays of multiple types - forfeits type safety and expressive intent

var arrayOfAny: [Any] = [1, 2.0, "three"]

var someString = "Some string"
var nilString: String? = nil     //optional

let arrayOfStrings = [nilString, someString]

var optionalArrayOfStrings: [String]?

var optionalArrayOfOptionalValues: [String?]?

//: [Next](@next)
