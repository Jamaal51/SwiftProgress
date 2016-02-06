//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// A ---> B "B is adjacent to A" 

//Vertex, Edge, Graph

enum State{
    case Undiscovered
    case Discovered
    case Finished
    
}

class Vertex {
    var name:String
    var state: State
    
    init (name: String){
        self.name = name
        self.state = .Undiscovered
    }
}

class Edge {
    var vertices: (Vertex,Vertex)
    init (vertex1: Vertex, vertex2: Vertex){
        self.vertices = (vertex1, vertex2)
    }
}

class Graph {
    var vertices: [Vertex]
    var edges: [Edge]
    
    init(vertices: [Vertex], edges: [Edge]){
        self.vertices = vertices
        self.edges = edges
    }
    
}

var A = Vertex(name: "A")
var B = Vertex(name: "B")
var C = Vertex(name: "C")
var D = Vertex(name: "D")
var E = Vertex(name: "E")

var A_B = Edge(vertex1: A, vertex2: B)
var A_D = Edge(vertex1: A, vertex2: D)
var A_E = Edge(vertex1: A, vertex2: E)
var E_C = Edge(vertex1: E, vertex2: C)
var D_C = Edge(vertex1: D, vertex2: C)

var verticeList = [A,B,C,D,E]
var edgeList = [A_B, A_D,A_E,E_C,D_C]

var graph = Graph(vertices: verticeList, edges: edgeList)

//BFS
// 1. enqueue starting point
// 2. mark starting point as discovered
// 3. enqueue all adjacent vertices that are undiscovered
// 4. mark enqueued nodes as discovered
// 5. dequeue and mark node as finished
// 6. go to next item in queue if queue not empty











