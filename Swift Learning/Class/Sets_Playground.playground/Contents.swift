//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Working with sets

var primaryColors: Set<String> = ["red","green"]
primaryColors.insert("blue")

var secondaryColors: Set<String> = ["yellow","cyan"]

var myFaveColors: Set<String> = ["red","yellow"]

primaryColors.union(secondaryColors)
primaryColors.union(myFaveColors)

primaryColors.intersect(myFaveColors)

let allColors = primaryColors.union(secondaryColors)

allColors.subtract(secondaryColors)

secondaryColors.isSubsetOf(myFaveColors)
allColors.isSubsetOf(myFaveColors)

secondaryColors.isDisjointWith(primaryColors)
secondaryColors.intersect(primaryColors).isEmpty
myFaveColors.isDisjointWith(primaryColors)