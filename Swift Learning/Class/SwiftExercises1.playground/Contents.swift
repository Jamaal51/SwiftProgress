//: Playground - noun: a place where people can play

import UIKit

class BagelShop{
    //var customers : [Customer]? // optional: either of type Customer or nil
    var numberOfBagels: Int
    var sumTotalOrders: Double
    
    init(numberOfBagels: Int){
        self.numberOfBagels = numberOfBagels
        self.sumTotalOrders = 0
    }
    
    convenience init(){ // always has to call self.init
        self.init(numberOfBagels: 5)
    }
    
    func isClosed() -> Bool {
        return numberOfBagels == 0 ? true : false
    }
    
    func processOrder(order: Order){
        
        if !isClosed() && !order.isCompleted && order.numberOfBagels <= self.numberOfBagels{
            self.numberOfBagels = self.numberOfBagels - order.numberOfBagels
            order.isCompleted = true
            self.sumTotalOrders += order.totalPrice
        }
    }
}

class Customer {
    var order: Order
    
    init(order : Order){
        self.order = order
    }
}

class Order {

    var numberOfBagels: Int
    var isCompleted: Bool
    var totalPrice: Double
    var bagels : [Bagel]
    
    init(bagels : [Bagel]){
        self.bagels = bagels
        self.numberOfBagels = self.bagels.count
        self.isCompleted = false
        self.totalPrice = Double(self.numberOfBagels) * 1.5
    }
    
//    convenience init (customerName: String){
//        let defaultNumberOfBagels = 1
//        self.init( numberOfBagels: defaultNumberOfBagels)
//    }
}

//create a bagel model
//orders should have multiple bagels
//price of each bagel is $1.50
//have a totalPrice for order
//print out sum of total money after the bagel shop is closed

class Bagel {
    var price: Double
    var bagelType: String
    
    init(bagelType: String){
        self.bagelType = bagelType
        self.price = 1.5
    }
}

let bagelShop = BagelShop()
let plainBagel = Bagel(bagelType: "Plain")
let poppyBagel = Bagel(bagelType: "Poppy")
let sesameBagel = Bagel(bagelType: "Sesame")
let everythingBagel = Bagel(bagelType: "Everything")
let order1 = Order(bagels: [plainBagel, poppyBagel, plainBagel])
let order2 = Order(bagels: [sesameBagel, everythingBagel])
let customer1 = Customer(order: order1)
let customer2 = Customer(order: order2)


bagelShop.processOrder(customer1.order)
bagelShop.processOrder(customer1.order)
bagelShop.processOrder(customer2.order)
print(bagelShop.numberOfBagels)
print(bagelShop.sumTotalOrders)


func isPalindrome(word: String) -> Bool {
    
    let wordLength = word.characters.count
    
    for i in 0...wordLength/2{
        if(Array(word.characters)[i] != Array(word.characters)[wordLength - i - 1]){
            return false
        }
    }
    
    
    return true
}

isPalindrome("racecar")
isPalindrome("boob")

func isAlsoPalindrome(word:String)->Bool{
    return String(word.characters.reverse()) == word
}

isAlsoPalindrome("bob")

struct Stack<T> {       //declare AnyObject
    var items:[T]
    
    mutating func push(element: T){
        items.append(element)
    }
    mutating func pop()->T{
        return items.removeLast()
    }
    
    func count() -> Int{
        return items.count
    }
}

func isPalindromeThree(word: String)->Bool{
    var stack = Stack<Character>(items: Array(word.characters))
    var reverseStack = Stack<Character>(items: Array(word.characters).reverse())
    
    for _ in 0..<stack.count(){
        
        if stack.pop() != reverseStack.pop(){
    }

    }
    return true
}

isPalindromeThree("dad")

func findMissingNumber(N: Int, list: [Int]) -> Int{
    
    return 0
}


//Given a list of size N containing numbers 1-N, return true if there are duplicates and false if not

func hasDuplicates(arr:[Int]) -> Bool{
    let set = Set(arr)
    
    if set.count == arr.count{
    return false //no duplicates
    } else{
        return true //there are duplicates
    }
}

hasDuplicates([5,5,6,7,8])
hasDuplicates([1,2,3,4])
hasDuplicates([1,1,2,3,4])
hasDuplicates([100,200,300])








