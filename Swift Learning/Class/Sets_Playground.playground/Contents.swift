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
        if !contains(item){
        elements.append(item)
        }
    }
    mutating func remove(item: T) {
        if let idx = elements.indexOf(item){
        elements.removeAtIndex(idx)
        }
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

colors.add("brown")
colors.add("brown")

//HASH TABLE

"Hello".nulTerminatedUTF8 //ascii - strings are basically array of numbers
"Hello".unicodeScalars.first!.value

func hash(x: String) -> Int{
    return Int(x.unicodeScalars.first!.value)
}
hash("hello")
hash("pop")

"Hello".hashValue
"Rock".hashValue
"R&B".hashValue

struct StringHashSet: SetProtocol {
    var elements = [String?](count: 128, repeatedValue: nil)
    
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
        elements[hash(item)] = item
        }
    mutating func remove(item: String) {
        }
    func contains(item: String) -> Bool{return false}
    //CustomStringConvertible
    
    var description
}

var genres = StringHashSet()

genres.add("Rock")
genres.add("Pop")
genres.add("Funk")

genres.contains("Rock")

print(genres.elements.filter{$0 != nil}) //Filters are a method on array

let items = ["Aardvark", "Adam", "Apple", "Bear", "Cat"]

func startsWithA(item: String) -> Bool{
    return item.characters.first! = Character("A")
}

items.filter(startsWithA)








