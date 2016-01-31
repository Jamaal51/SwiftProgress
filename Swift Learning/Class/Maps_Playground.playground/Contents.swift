//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MAPS

//map protocol

protocol MapProtocol {
    typealias KeyType
    typealias ValueType
    subscript(k: KeyType) -> ValueType? {get set}
    mutating func remove(k: KeyType)
}