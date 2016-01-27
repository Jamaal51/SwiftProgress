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

