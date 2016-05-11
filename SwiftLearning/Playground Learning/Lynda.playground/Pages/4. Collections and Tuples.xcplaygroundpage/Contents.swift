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

var  optionalArrayOfOptionalValues: [String?]?

threeStooges.count
threeStooges.isEmpty
threeStooges.contains("Moe")

let larry = threeStooges[1]

let twoStooges = threeStooges[0..<2].sort(>)       //slicing an array
                                                // .sort(<) ascending (>) descending
let moe = threeStooges.first! //force unwrap

let curly = threeStooges.last!

turnstileCounts[2] = 5

turnstileCounts[0] += 10

var fourStooges = threeStooges

fourStooges.append("Shemp")

let shemp = fourStooges.removeLast()

fourStooges.insert(shemp, atIndex: 0)

var allStooges = fourStooges + ["Ted", "Emil"]

allStooges += ["Joe Besser", "Joe DeRita"]

allStooges.removeRange(4...5)

allStooges.sortInPlace()

//Nesting Arrays

var famousGroupsOfThree = [
    threeStooges,
    ["Huey","Dewey","Louie"],
    ["Athos","Porthos","Aramis"],
    ["Jack","Chrissy","Jane"]
]

let threeMusketeers = famousGroupsOfThree[2]
let jack = famousGroupsOfThree[3][0]

famousGroupsOfThree[3][2] = "Janet"

//print(famousGroupsOfThree.flatMap({ $0 })) //flatmap returns array of concatenated results, {$0} represents all of values


//Defining Dictionaries

var stockPrices = ["AAPL": 110.37, "GOOG": 606.25, "MSFT": 43.5]

var birthYears: [String: Int] = [:]

var raceResults = Dictionary<Int, String>()

let tourDeFranceResults: [Int: String]
tourDeFranceResults = [
    1: "Chris Froome",
    2: "Nairo Quintana",
    3: "Alejandro Valverde"
]
//dictionary keys must not be optional and must conform to the hashable protocol
//each key must be a unique value ie. can't use a Bool to represent a key or dictionary will have only two values
//dictionary values should not be optional

var ages = Dictionary<String, Int>()

stockPrices.count

ages.isEmpty

Array(stockPrices.keys)
Array(stockPrices.values)

let appleStockPrice = stockPrices["AAPL"]!

//modify dictionaries

//add
stockPrices["AMZN"] = 504.72

//edit
stockPrices["AAPL"] = 114.45

//remove from dict just set equal to nil
stockPrices["AMZN"] = nil

//print(stockPrices)

stockPrices.removeAll()

stockPrices["DMI"] = 17.25

let dunderMifflinStockPrice = stockPrices.removeValueForKey("DMI")

// removeValueForKey returns an optional since key might not have a value

//Nesting Dictionaries

var bostonMarathonResults: [Int : [String:String]] = [
    1:[
        "name": "Desisa",
        "country": "ETH",
        "finishingTime": "2:09:17"
    ],
    2:[
        "name": "Kris",
        "country": "BOL",
        "finishingTime": "2:09:50"
    ]
]

let firstPlaceName = bostonMarathonResults[1]?["name"]  //Optional Chaining

//Defining Sets

var teachers = Set<String>()

var students: Set = ["Charlotte","Laura","Kayleigh","Kayla","Boz","Jake","Charlotte"]

//set type can be infered. Duplicates will be removed

var staff: Set<String> = []

//perform set operations

let campAttendees: Set = ["Charlotte", "Laura", "Lilli", "Carlee", "Nathan"]

//print(students.intersect(campAttendees)) // contained in both sets
//print(students.exclusiveOr(campAttendees)) //not contained in both sets
//print(students.union(campAttendees)) //contains both with duplicates removed
//print(students.subtract(campAttendees))

students.insert("Bob")

let indexOfBob = students.indexOf("Bob")

students.removeAtIndex(indexOfBob!)

students.unionInPlace(campAttendees)

//print(students)

//Nesting Sets

let stringSet1: Set = ["a", "b", "c"]
let stringSet2: Set = ["d", "e", "f"]
let integerSet: Set = [1, 2, 3]
let setOfStringSets: Set = [stringSet1, stringSet2] //cannot nest sets of different types ie integerSet

//Defining Tuples

let httpStatus200 = (200, "ok")

var numbers: (Int, Float, Double) = (1, 2.3, 3.4)

var httpStatus: (Int, String?)?

var playerScores: ([Int], firstName: String, lastName:String?) //array of ints, string, string

playerScores = ([134_000, 128_500, 156_250], "Scott", "Gardner")

let highScore = playerScores.0.maxElement()!

print("\(playerScores.firstName) acheived a high score of \(highScore).")

let (scores, firstName, lastName) = playerScores

let averageScore = scores.reduce(0, combine: +)/scores.count

print("\(firstName) achieved an average score of \(averageScore)")

let (httpStatusCode, _) = httpStatus200 //how to write a tuple decomposed for values that arent needed

//nested tuples

var anotherScore = (100, (firstName: "Scott", lastName: "Gardner"))

let (theScore, name) = anotherScore

name.firstName //can access firstName from the name assigned from anotherScore variable

anotherScore.0 = 98

anotherScore.1.firstName = "Brett"



//: [Next](@next)
 
