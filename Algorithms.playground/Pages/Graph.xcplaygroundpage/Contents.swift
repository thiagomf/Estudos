//: [Previous](@previous)

import Foundation

public class Graph {
    
    var adjList: [String: [String]] = [:]
    
    public func addVertex(vertex: String) -> Bool {
        
        if adjList[vertex] == nil {
            
            adjList[vertex] = []
            return true
        }
        
        return false
    }
    
    public func printGraph() {
        print(adjList)
    }
    
    public func addEdge(vertex1: String, vertex2: String) -> Bool {
        
        if adjList[vertex1] != nil && adjList[vertex2] != nil {
            adjList[vertex1]?.append(vertex2)
            adjList[vertex2]?.append(vertex1)
            
            return true
        }
        
        return false
    }
    
    public func removeEdge(vertex1: String, vertex2: String) -> Bool {
       
        if adjList[vertex1] != nil && adjList[vertex2] != nil {
            adjList[vertex1]?.removeAll { $0 == vertex2 }
            adjList[vertex2]?.removeAll { $0 == vertex1 }
            return true
        }
        
        return false
        
    }
    
    public func removeVertex(vertex1: String) -> Bool {
        
        if adjList[vertex1] == nil {
            return false
        }
        
        let elements = adjList[vertex1] ?? []
        
        for vertex2 in elements {
            adjList[vertex2]?.removeAll { $0 == vertex1 }
        }
        
        adjList.removeValue(forKey: vertex1)
        
        return true
    }
}


var graph = Graph()

graph.addVertex(vertex: "A")
graph.addVertex(vertex: "B")
graph.addVertex(vertex: "C")
graph.addEdge(vertex1: "A", vertex2: "B")
graph.addEdge(vertex1: "A", vertex2: "C")
graph.addEdge(vertex1: "B", vertex2: "C")
//graph.removeEdge(vertex1: "A", vertex2: "B")
graph.removeVertex(vertex1: "C")
graph.printGraph()
//: [Next](@next)
