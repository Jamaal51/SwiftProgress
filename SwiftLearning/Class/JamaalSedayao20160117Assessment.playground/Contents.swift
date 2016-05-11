//: Jamaal Sedayao Assesment

import UIKit

var str = "Hello, playground"

/*
1. You are working on a new NYC subway app for the MTA. For each of the following features, name the primary data structure (or structures) you would use in your implementation and provide one sentence explaining why it is a good choice:
a. Allow users to quickly search for a particular subway station by name.
answer: a sorted array would work because it would use binary search
b. Display all the stations in alphabetical order in a table view.
answer: hashtable. each entry can be accessed by a hash-key
c. Calculate the most direct route between two subway stations.
Graph. It can calculate the route between various points and find out the fastest
d. Show a live feed of alerts about delays and other important information (items can be inserted into/removed from anywhere in the feed).
Linked-list. A linked-list allows quick insertion and removal


2. Which data structure best models the possible outcomes of a series of coin tosses? Please provide an example. Which structure best models each observed outcome of a series of coin tosses? Please provide an example.
A tree would model the outcomes of a coin toss the best. With a tree you can split the branches to two points at each toss, heads or tails. You can use the array for the observed outcome of coin tosses ie heads, tails, tails, heads, heads etc...

Big O

1. Rank these from best to worst in terms of time complexity
O(n), O(n3), O(1), O(n2), O(2n) O(log(n)), O(n!)

answer: 1. O(1) 2. O(log(n)) 3. O(n) 4. 0(2n) 5. O(n2) 6. O(n3) 7. O(n!)

2.
What is the big O in terms of n for these execution times?
a. 2n + 3 milliseconds
   answer: O(n)

b. 3n * (4n * (n + 3)) nanoseconds answer: O(n^3)
c. n2 + log(n) + n! + 23 nanoseconds answer: O(n!)
d. 1 billion years O(1)

3. Find the big O in terms of n, the length of xs, of these code snippets or descriptions of code, assuming foo(xs) is O(n) and bar(xs) is O(log(n)).

a.
for i in 0..<xs.count {
for x in xs {
xs[i] = x + foo(xs)
}
}
answer: O(n^2)

b.
for x in xs {
if x == 3 {
foo(xs);
} else {
bar(xs);
}
}
answer: O(n) is worst case scenario

c.
A function that checks every possible ordering of the elements of xs to see if that ordering is an encryption key to a file (assume trying the key takes O(1)).
answer: O(n)


Discrete Math + Logic

1. You are trying to create the perfect fruit smoothie recipe using bananas, oranges, raspberries, blueberries, peaches, mangoes, and papayas. If each smoothie must consist of at least two and at most four different kinds of fruit, how many smoothies do you need to make in order to try every possible recipe?
answer: C(7,2) + C(7,3) + C(7,4) = 91

2. While experimenting with recipes, you discover three candidates for the perfect smoothie and seven others you really like. You decide to take your hobby to the next level by opening your very own smoothie shop, Jumbo Juice. You decide to create a menu with items arranged according to the following rules:
All ten of your smoothie options must be on the menu—no more, no less.
One of the three perfect smoothie candidates must be the first item on the menu.
How many possible menus can you make?

    answer: C(3,1) * 9! = 1,088,640

3. Your first Jumbo Juice customer only wants a smoothie that has both mangoes and peaches. Out of the ten smoothies on your menu, if four contain mangoes, three contain peaches, and five contain neither mangoes nor peaches, how many options does your customer have?
answer: using a pie chart customer has 2 opions for both mangos and peaches



List + Sorts

You are given an array of CD structs.
struct CD {
var playTime:Double
var price: Double
}

a. Using your knowledge of sorts (feel free to use bubble sort, insertion sort, or selection sort), alter it to sort the array by price from least to greatest. If two CDs have the same price, those CDs should be sorted by playTime, from shortest to longest.

Sample input:
[ {playTime: 4.5, price: 2},
{playTime: 3, price: 2},
{playTime: 5, price:1} ]
Output:
[ {playTime: 5, price:1},
{playTime: 3, price: 2},
{playTime: 4.5, price: 2} ]

*/
struct CD {
    var playTime:Double
    var price: Double
}

var playtimeArray = [{playtime:4.5, price:2},{playtime: 3, price: 2}, {playtime: 5, price:1}]

