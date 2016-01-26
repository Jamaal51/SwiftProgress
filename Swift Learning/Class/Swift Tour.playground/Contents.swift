//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let str2 = "Other hello, playground"

let implicitDouble = 70.0
let explicitDouble: Double = 70.0

"The number 70 is \(implicitDouble)"

let name = "Jamaal"
print("My name is \(name)")

let arr = ["one", "two", "three"]

var arr2: [String] = [String]()
arr2.append("four")
arr2.append("five")

arr2[0]

var dict = [String: String]()
dict["mike"] = "teacher"
dict["jamaal"] = "student"
dict["c4q"] = "school"

print(dict)

// Control Flow

let numbers = [4, 7, 2, 32, 86, 235, 5, 12]

for number in numbers {
    if number < 30{
        print("left")
    } else {
        print("right")
    }
}

var stuff = [String]()
stuff.append("mike")
stuff.append("poop")

print(stuff.first)

if let name = stuff.first {
    print(name)
}
if stuff.first != nil {
    print(stuff.first!)
}

func sayHello(greeting: String, name: String){
    print("Hello, \(name)")
}

sayHello("Hello", name: "Diana")
sayHello("Greetings", name: "Jason")

stuff.insert("hello", atIndex:0)

func appendButt(str: String) -> String{
    return "\(str)'s butt"
}
appendButt("JLo")

func appendKing(str:String) -> String{
    return "King \(str)"
}
appendKing("James")

func indexOfM(str: String) -> Int?{
    return Array(str.characters).indexOf("m")
}
print(indexOfM("mike"))

class Rectangle {
    
    var x: Float
    var y: Float
    var width: Float
    var height: Float
    
    init(x: Float, y: Float, width: Float, height: Float){
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    func area() -> Float{
        return width * height
    }
}
let r = Rectangle(x: 10, y: 30, width: 200, height: 40)

print(r.width)
print(r.x)
print(r.area())

struct RectangleA {
    
    var x: Float
    var y: Float
    var width: Float
    var height: Float

}

protocol ColorPickerDelegate {
    func didSelectColor(color:String)
}

class ColorPicker: ColorPickerDelegate{
    func didSelectColor(color: String) {
        //
    }
}

//enums used to define finite set of options

enum Direction {
    case Left
    case Right
    case Up
    case Down
}

enum TrainStatus{
    case OnTime
    case Late
}

class Train {
    var status: TrainStatus = TrainStatus.OnTime
    var direction: Direction?
}


class ListNode {
    var value: Int?
    var next: ListNode?
    
    init(value:Int, next: ListNode?){
        self.value = value
        self.next = next
    }
    
    func removeHead() -> ListNode?{
        let next = self.next
        self.next = nil
        return next
    }
}

var head = ListNode(value: 5, next: ListNode(value: 6, next: ListNode(value: 7, next: nil)))


head.value
head.next?.value
head.next?.next?.value

let v = head.value
head = head.removeHead()!

head.value

struct Stack<Element> {
    var array: [Element] = []
    
    var isEmpty: Bool{
        return array.isEmpty
    }

    func peek() -> Element? {
        return array.last
    }
    
    mutating func push (element: Element){
        array.append(element)
    }
    
    mutating func pop() -> Element{
        return array.removeLast()
    }
}

func isBalanced(parens:String) -> Bool{
    var s = Stack<Character>()
    for c in parens.characters{
        if c == "(" {
            s.push(c)
        } else if c == ")" {
            if s.isEmpty{
                return false
            }
            s.pop()
        }
    }
    return s.isEmpty
}

var s = Stack<String>()
s.push("Hello")
s.push("there")

s.array
s.pop()

isBalanced("())")

//Hash Table

func hash(key: String) -> Int {
    return key.characters.count - 1
}

hash ("aa")
hash ("xy")

"aa".hash
"xy".hash

let graph = [
    0 : [4],
    1 : [3,4],
    2 : [0, 1, 3],
    3 : [4],
    4 : []
]

let start = 2
let connectedNodes = graph[start]
let next = connectedNodes![0]
let nextConnectedNodes = graph[next]



