//: [Previous](@previous)

import Foundation // allows usage of arc4random_uniform

//Control Flow

// for loop

for var i = 1; i <= 1024; i*=2{
   // print(i)
}

// for-in

for i in 0..<10{
   // print(i)
}
for var i in 1...3{
    i *= 2
}
for i in (1...3).reverse(){
   // print(i)
}
for _ in 0..<3{          // use underscore when not accessing variable, saves runtime
    //print("I will not waste chalk")
}

//stride

for i in 3.stride(to: 30, by: 3){ //increments of 3
   // print(i)
}

for i in 10.stride(through: 1, by: -1){
   // print(i, terminator:" ")
}
//print("Lift off!")

for (i,c) in "SWIFT".characters.enumerate(){
    for j in 0..<i {
        print("\t", terminator:"") // prints a tab
    }
    //print("\(c)\n", terminator:"") //prints character and skips line
}

let phrases = ["A couple","A few or some", "Several or many"]

for t in phrases.enumerate(){
    //print("For \(t.0+2) you can say \"\(t.1).\"")
}

while arc4random_uniform(6) + 1 != 1 || arc4random_uniform(6) + 1 != 1{
   // print(".", terminator: "")
}
//print("Snake Eyes!")

repeat {
    //print(".", terminator: "")
} while arc4random_uniform(6) + 1 != 1 || arc4random_uniform(6) + 1 != 1

//print("Snake Eyes!")

let testScore = arc4random_uniform(50) + 50

if testScore >= 70{
    print("Passed")
} else {
    print("Study more")
}
//print("Your grade:\(testScore) ", terminator:"")

if #available(iOS 9, *){
    //Use applicable API from iOS 9
} else {
    //Use earlier API
}

//OPTIONAL BINDING

var firstName: String? = "Betty"

if let firstName = firstName{      //if firstName is not nil print
    print("Hello, \(firstName)")
} else {
    print("Welcome, guest")
}

var lastName: String? = "Gardner"

if let firstName = firstName, lastName = lastName{
    print("Hello, my name is \n\(firstName) \(lastName)")
} else {
    print("Hello, I am a guest")
}

if var firstName = firstName, let lastName = lastName{   //firstName local is variable, but lastName local is constant
    firstName = firstName.uppercaseString
    //lastName = lastName.uppercaseString
    print("Hello, my name is \n\(firstName) \(lastName)")
} else {
    print("Hello, I am a guest")
}

// Using Guard

let twentyOneBirthday = NSDate().dateByAddingTimeInterval(-31_536_000 * 21)
let joeysBirthday = NSDate().dateByAddingTimeInterval(-33_200_000 * 21)
let brendasBirthday = NSDate().dateByAddingTimeInterval(-29_536_000 * 21)
let chrisBirthday = NSDate().dateByAddingTimeInterval(-19_536_000 * 21)
let oliversBirthday = NSDate().dateByAddingTimeInterval(-45_536_000 * 21)

let peopleInLine = ["Joey":joeysBirthday, "Brenda":brendasBirthday, "Chris":chrisBirthday, "Oliver":oliversBirthday]

for (name, birthday) in peopleInLine {
    guard birthday.earlierDate(twentyOneBirthday) == birthday
            else {
        print("\(name) is not old enough")
        continue
    }
    print("\(name) can enter")
}

func updateSignForLifegaurdOnDuty(lifeguardOnDuty: String?){
    
    guard let lifeguardName = lifeguardOnDuty else {
        print("No lifegaurd on duty. Swim at your own risk")
        return
    }
    print("Lifeguard on duty: \(lifeguardName)")
}

updateSignForLifegaurdOnDuty("Billy Bob")

//using switch  - go back an learn switch

let die1 = [1, 2, 3, 4, 5, 6]

// Using Labels

var i = 0
let hello = "Hello, sir"

start: do {
    i++
    
    do {
        print(hello)
        
        if i < 3 {
            continue start
        }
    }
}


//: [Next](@next)
