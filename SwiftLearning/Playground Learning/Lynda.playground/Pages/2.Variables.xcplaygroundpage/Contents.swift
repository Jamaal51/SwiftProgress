//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let aCharacter: Character = "a"

let bCharacter = "b" as Character

let uWithUmlaut: Character = "\u{75}\u{308}"

// unicode-table.com

let unsignedInt: UInt = 1_234_567_890

var maybeAString: Optional<String>

print(maybeAString)

//nil string is not the same as empty string

maybeAString = ""  //empty string

maybeAString?.isEmpty
maybeAString == nil

maybeAString = "I am a string!"

//unwrap an optional we know has a value
print(maybeAString!)

//working with string

var quote: String = "In the end, we only regret the chances we didn't take."

quote.hasPrefix("In the end")
quote.hasSuffix("Abraham Lincoln")
quote.uppercaseString
quote.lowercaseString
quote.characters.count
quote.startIndex
quote.endIndex

let firstCharacter = quote[quote.startIndex]

let secondCharacter = quote[quote.startIndex.successor()]

let eigthIndex = quote.startIndex.advancedBy(7)

let eigthCharacter = quote[eigthIndex]

let lastCharacter = quote[quote.endIndex.predecessor()]

quote.insert("!", atIndex: quote.endIndex.predecessor())
quote.removeAtIndex(quote.endIndex.predecessor())
print(quote)

let replacementString = "it's not the years in your life that count. It's the life in your years. --Abraham Lincoln"

let aRange = 0..<3
let startIndex = quote.endIndex.advancedBy(-42)
let range = startIndex..<quote.endIndex

quote.replaceRange(range, with: replacementString)





