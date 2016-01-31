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

//Why use Sets? check for words - SpellCheck
// add or remove custom words

//Protocol

protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
    
}

struct ArraySet<T: Equatable>: SetProtocol {
    var elements = [T]()
    typealias ItemType = T
    mutating func add(item: T) {
        elements.append(item)
    }
    mutating func remove(item: T) {
        elements.removeAtIndex(elements.indexOf(item)!)
    }
    func contains(item: T) -> Bool {
    return elements.contains(item)
    }
    //CustomStringConvertible
    var description: String{
        return "{\(elements)}"
    }
}

var colors = ArraySet<String>()
colors.add("blue")
colors.add("green")
colors.add("orange")

colors.remove("blue")
colors.contains("blue")







