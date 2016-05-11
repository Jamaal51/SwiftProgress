//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node<T: Comparable> {  //Type needs to conform to comparable protocol implements equals and < >
    let value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T){
        self.value = value
    }
}
extension Node {
    func bfs(value: T) -> Node? {
        //print ("Visited: \(self)")
        
        //check the current node (self's) value
        if self.value == value{
            // if it matches, return self
            return self
        }
        // check the node's child nodes
        for child in [left, right] {
            if child?.value == value {
                return child
            }
        }
        //repeat this whole process for each
        for child in [left, right]{
            if let result = child?.bfs(value){
                return result
            }
        }
        return nil
    }
    
}

let node = Node(value: 1)       //type inference in swidt

let stringNode = Node(value: "string")

let a = Node(value: 1)
let b = Node(value: 2)
let c = Node(value: 3)
let d = Node(value: 4)
let e = Node(value: 5)
let f = Node(value: 6)
let g = Node(value: 7)

d.left = b
b.left = a
b.right = c
d.right = f
f.left = e
f.right = g

/*
//Cameron's code

//    4
//  2   6
// 1 3 5 7


class Node<T: Comparable> {
    let value: T
    var left: Node<T>?
    var right: Node<T>?
    init(value: T) {
        self.value = value
    }
}

extension Node {
    func bfs(value: T) -> Node? {
        //print("Visited: \(self)"
        ​
        // Check the current node (self)'s value
        if self.value == value {
            // If it matches, return self
            return self
        }
        // Check each of this node's child nodes
        let children: [Node<T>?] = [left, right]
        for child in children {
            if child != nil {
                print("Visited: \(child!)")
            }
            if child?.value == value {
                return child
            }
        }
        // Repeat this whole process for each of the child nodes
        for child in [left, right] {
            if let result = child?.bfs(value) {
                return result
            }
        }
        return nil
    }
    func printInOrder(){




}
    ​
extension Node: CustomStringConvertible {
    var description: String {
        return "\(value)"
    }
}
​
let a = Node(value: 1)
let b = Node(value: 2)
let c = Node(value: 3)
let d = Node(value: 4)
let e = Node(value: 5)
let f = Node(value: 6)
let g = Node(value: 7)
​
d.left = b
b.left = a
b.right = c
d.right = f
f.left = e
f.right = g
​
d.bfs(5)

*/

func insertionSort<T: Comparable>(inout values: [T]){    //anything to the left part of array is sorted

    for i in 1..<values.count {
        var j = i
        
        while j>0 && values[j-1]>values[j]{
        
        if values[j] < values[j - 1]{
            swap(&values[j], &values[j-1])
        } else {
            break
        }
        j -= 1
        
        }
    }
}

var values = [4,2,5,3,1]
insertionSort(&values)

func quickSort<T: Comparable> (inout values: [T]){
    let pivot = values[values.endIndex-1]
    
    for i in 0..<(values.count - 1){
        
        
    }
    
    
}






