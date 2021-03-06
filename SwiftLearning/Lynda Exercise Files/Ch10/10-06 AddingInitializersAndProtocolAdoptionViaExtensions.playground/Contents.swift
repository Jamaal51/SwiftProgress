//: ## Extending Concrete Types

let quickBrownFox: String = "The quick brown fox jumped over the lazy dog"

quickBrownFox.characters.count

quickBrownFox.length

extension String {
  
  var length: Int {
    return characters.count
  }
  
}

extension Optional {
  
  var hasValue: Bool {
    switch self {
    case .None:
      return false
    case .Some(_):
      return true
    }
  }
  
}

var string: String? = "Extensions are cool!"
string.hasValue

var integer: Int?
integer.hasValue

extension String {
  
  func appendStrings(strings: String..., withPadding padding: String = " ") -> String {
    let stringsArray = [self] + strings
    return stringsArray.joinWithSeparator(padding)
  }
  
}

"a".appendStrings("b", "c", "d", withPadding: " - ")

struct Person {
  
  let firstName: String
  let middleName: String
  let lastName: String
  
}

extension Person {
  
  var fullName: String {
    return firstName.appendStrings(middleName, lastName)
  }
  
}

let alfred = Person(firstName: "Alfred", middleName: "E.", lastName: "Neuman")

alfred.fullName
