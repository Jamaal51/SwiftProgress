//: Playground - noun: a place where people can play

import UIKit


//data structure: an intentional arrangement of data

let string: String = "Dark and Stormy night"

let bookPrice: Double = 12.95

let bookPublished: Bool = true

struct Book {
    var title: String
    var price: Double
    var isPublished: Bool
    var isHardback: Bool
}

let book1 = Book(title: "Die Today", price: 17.95, isPublished: true, isHardback: true)

book1.isPublished

//structs are great for data 

//Arrays

// zero-based index, fixed size (immutable), specific data type 

// Five requirements of any data structure: Access, Insert, Delete, Find, Sort