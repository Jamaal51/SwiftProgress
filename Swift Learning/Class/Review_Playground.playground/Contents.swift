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