//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//MAPS

protocol MapProtocol {
    typealias KeyType
    typealias ValueType
    subscript(k: KeyType) -> ValueType? {get set}
    mutating func remove(k: KeyType)
}

// An array of elements where each element is
//    An array of elements where each element is
//        A tuple of K, V

struct HashMap<K: Hashable, V>: MapProtocol, CustomStringConvertible {
    var table: [[(K, V)]]
    init(capacity: Int = 8) {
        table = [[(K, V)]](count: capacity, repeatedValue: [])
    }
    // MapProtocol
    typealias KeyType = K
    typealias ValueType = V
    subscript(k: K) -> V? {
        get {
            let hashValue = abs(k.hashValue % table.count)
            for item in table[hashValue] {
                if (item.0 == k) {
                    return item.1
                }
            }
            //return table[hashValue].filter({$0.0 == k}).first?.1
            return nil
        }
        
        set(v) {
            let hashValue = abs(k.hashValue % table.count)
            table[hashValue].append((k, v!))
        }
    }
    
    mutating func remove(k: K) {
        let hashValue = abs(k.hashValue % table.count)
        if let idx = table[hashValue].indexOf({$0.0 == k}) {
            table[hashValue].removeAtIndex(idx)
        }
    }
    
    // CustomStringConvertible
    var description: String {
        var str = ""
        for entry in table {
            str += "\(entry)"
            str += "\n"
        }
        return str
    }
}

var nicknames = HashMap<String, String>()

nicknames["Michael"] = "Mike"
nicknames["Barbara"] = "Babs"
nicknames["Janet"] = "Jenny"
nicknames["Matthew"] = "Matt"
nicknames["Fredrick"] = "Fred"
print(nicknames)

nicknames["Michael"]

nicknames.remove("Michael")
nicknames["Michael"]



