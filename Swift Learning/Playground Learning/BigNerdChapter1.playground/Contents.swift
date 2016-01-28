//Big Nerd Ranch Part I & II the basics

import UIKit

var str = "Hello, playground"
str += "!"
//print(str)

var lastName = "Sedayao"
//print(lastName)

//VARIABLES

var numberOfStoplights: Int = 2
numberOfStoplights += 2
print(numberOfStoplights)

var population: Int
population = 900

let townName = "Bumville"
var townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights"
//print(townDescription)

var numberOfBaseballTeams: Int
numberOfBaseballTeams = 3

townDescription += " and \(numberOfBaseballTeams) baseball teams."
//print(townDescription)


//CONDITIONALS

population = 11000
var message: String

if population < 1000 {
    message = "\(population) people is a small town"
} else if population >= 1000 && population < 5000 {
        message = "\(population) people is a medium town"
} else if population >= 5000 && population < 10000 {
        message = "\(population) people is a big town"
} else {
    message = "TOWN IS LEGIT!"
}
print(message)

var hasPostOffice = true

if !hasPostOffice {
    print("Where do I buy stamps?")
}

//Ternary Operator

// a ? b : c       "if a is true, then do b. Otherwise do c."

//message = population < 1000 ? "\(population) is a small town" : "\(population) is a big town"
//print(message)

//TUPLES

let http404Error = (errCode:404, errValue:"Not found")
print(http404Error)

//accessing - using index notation

http404Error.0
http404Error.1

//accessing - using name method

http404Error.errCode
http404Error.errValue

var marks = (physics: 87, chemistry: 90, math: 93)
marks.chemistry
marks.physics
marks.math

let (myErrCode, myErrValue) = http404Error
myErrCode
myErrValue

let (otherErrCode, _) = http404Error  //use underscore - decompose
otherErrCode

func minMax(arrayInput: [Int]) -> (min: Int, max: Int){ //takes in array and returns a tuple
    var currentMin = arrayInput[0] //set currentMin to first value in array
    var currentMax = arrayInput[0] //alse set current max
    for value in arrayInput[1..<arrayInput.count]{ // walk through array starting at index 1
        if value < currentMin {
            currentMin = value     //if value is less than currentMin make that currentMin
        } else if value > currentMax {
            currentMax = value    //if value is greater than currentMax make that currentMax
        }
    }
    return (currentMin, currentMax)
}

let myNumbers = [45, 23, 1, 89, 1000]
let (myMin, myMax) = minMax(myNumbers)  //let(tuple) = (tuple)

myMin
myMax

let myTuple = minMax(myNumbers)
myTuple.min
myTuple.max

//tuples not used for persistance. better to use class or struct
