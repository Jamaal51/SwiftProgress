//: [Previous](@previous)

import Foundation

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
    print("\(c)\n", terminator:"") //prints character and skips line
}

let phrases = ["A couple","A few or some", "Several or many"]

for t in phrases.enumerate(){
    print("For \(t.0+2) you can say \"\(t.1).\"")
}




//: [Next](@next)
