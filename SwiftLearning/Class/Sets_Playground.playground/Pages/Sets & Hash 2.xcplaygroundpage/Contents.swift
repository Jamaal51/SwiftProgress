//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    private(set) var count = 0
    
    public init(capacity: Int)
        assert(capacity > 0)
    buckets = .init(count: capacity, repeatedValue: []))
}











//: [Next](@next)
