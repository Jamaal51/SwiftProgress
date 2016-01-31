//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
Clearly, a bad hash function can destroy our attempts at a constant running time. A lot of obvious hash function choices are bad. For example, if we're mapping names to phone numbers, then hashing each name to its length would be a very poor function, as would a hash function that used only the first name, or only the last name. We want our hash function to use all of the information in the key.


1. For each of these hash functions, say whether they are good, bad, or invalid. In this context, a “bad” hash function breaks the 2nd rule too often (has too many collisions); an “invalid” hash function breaks the first rule, which can never be broken
*/
//a.
func hash(s: String) -> Int {
    // Character code of first letter
    return Int(s.unicodeScalars.first!.value)
    //bad - a lot of collisions are possible
}

//b.
//func hash2<T>(obj: T) { return 123; }
    //bad but not invalid(works) - all objects will have the same hash value

//c.
func hash3(s: String) -> Int {
    // Sum of all character codes in s
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 + $1}))
    //kinda bad - different words would have different sums - collisions in anagrams
}

//d.
func hash4(s: String) -> Int {
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 &* 256 &+ $1}))
}

hash4("hello")
hash4("bob")
hash4("hella")
hash4("puma")
hash4("amup")


//e.
//func hash5(p:Person) -> Int {
//    return p.age
//    //bad - many people have similar ages
//}

//f.
func hash6(date: NSDate) -> Int {
  //  return date.timeIntervalSinceNow
    //invalid - check date again, invalid - breaks rule #1 always has to return the same value
    return 0
}

/*
2. Use our set implementation from in class to write a simple spellCheck function that returns true if the string has no spelling errors. Use a dictionary of 6 words, and test your method both with a string that passes and a string that fails
spellCheck("the quick brown fox jumps over fox brown jumps quick")
spellCheck("the quick brwon fox jumps over fox brown jumps quick")
*/

protocol DictProtocol {
    func spellCheck(item: String) -> Bool
}
//struct ArraySet<T: Equatable>: DictProtocol {
//    var elements = [T]()
//    let dict: Set<String> = ["the", "quick", "brown", "fox", "jumps", "over"]
//    
//    func check(item: String) -> Bool {
//        if (dict.contains(item)){
//            return true
//        } else  {
//        return false
//    }
//}
//}

let dict: Set<String> = ["the", "quick", "brown", "fox", "jumps", "over"]

func spellCheck(str: String) -> Bool {
   let dict: Set<String> = ["the", "quick", "brown", "fox", "jumps", "over"]
    if (dict.contains(str)){
        return true
    } else  {
        return false
    }
}

func spellCheck2(str:String) -> Bool{
    for word in str.componentsSeparatedByString(" "){
        if !dict.contains(word){
        }
           return false
    }
    return true
}


spellCheck("bobby fox")


var spellDict = Set<String>()

for word in ["the", "quick", "brown", "fox", "jumps", "over", "truck"] {
    spellDict.insert(word)
}

spellDict

func spellCheck3(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck("the quick brown truck jumps over fox brown jumps quick")
spellCheck("the quick brwon truck jumps over fox brown jumps quick")


//BUCKETING, OPEN ADDRESSING

//linear probing - if space is occupied, keep looking for gap and put it there


abs("asdf".hashValue % 32)














