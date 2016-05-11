//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

enum State{
    case Undiscovered
    case Discovered
    case Finished
    
}

class Vertex {
    var name:String
    var state: State
    
    var preVertex: Vertex?
    var currentDistance: Int
    
    init (name: String){
        self.name = name
        self.state = .Undiscovered
        self.currentDistance = 0
    }
}

class Edge {
    var vertices: (Vertex,Vertex)
    
    init (vertex1: Vertex, vertex2: Vertex){
        self.vertices = (vertex1, vertex2)
    }
    
    func contains(vertex: Vertex) -> Bool {
        return vertices.0 == vertex || vertices.1 == vertex
    }
    
    func getVertexPairFor(vertex vertex: Vertex) -> Vertex? {
        if vertex == vertices.0 {
            return vertices.1
        }
        if vertex == vertices.1 {
            return vertices.0
        }
        return nil
    }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.name == rhs.name
}

class Graph {
    var vertices: [Vertex]
    var edges: [Edge]
    
    init(vertices: [Vertex], edges: [Edge]){
        self.vertices = vertices
        self.edges = edges
    }
    
}

func BFS_find_path_from(g: Graph, startingVertex: Vertex, endingVertex: Vertex) {
    var queue = [Vertex]()
    queue.append(startingVertex)
    startingVertex.state = .Discovered
    
    while(!queue.isEmpty) {
        let v = queue.removeFirst()
        if v == endingVertex {
            break
        }
        for edge in g.edges {
            if edge.contains(v) {
                let neighborV = edge.getVertexPairFor(vertex: v)!
                if neighborV.state == .Undiscovered {
                    queue.append(neighborV)
                    neighborV.preVertex = v
                    neighborV.state = .Discovered
                }
            }
        }
        v.state = .Finished
    }
    //print path after finding
    print_reverse_path_from(endingVertex)
}
func print_reverse_path_from(v:Vertex) {
//    var v = v
//    print(v.name)
//    while(v.prevVertex != nil) {
//        print(v.prevVertex!.name)
//        v = v.prevVertex!
//    }
    
//base
    
    
//recurse
//print
    
    
}
​
BFS_find_path_from(graph, startingVertex: A, endingVertex: C)




//: [Next](@next)
