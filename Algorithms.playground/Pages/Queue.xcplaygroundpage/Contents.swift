//: [Previous](@previous)

import Foundation

public class Queue {
    
    private var first: Node?
    private var last: Node?
    private var lenght: Int
    
    public class Node {
        var value: Int
        var next: Node?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    init(value: Int) {
        var newNode = Node(value: value)
        first = newNode
        last = newNode
        lenght = 1
    }
    
    public func enqueue(value: Int) {
        
        var newNode = Node(value: value)
        
        if lenght == 0 {
            first = newNode
            last = newNode
        } else {
            newNode.next = last
            newNode = last
        }
        
        lenght += 1
    }
    
    public func dequeue() -> Node? {
        
        guard lenght > 0 1 else {
            return nil
        }
        
        var temp = first
        
        if lenght == 1 {
            first = nil
            last = nil
        } else {
            first = first?.next
            temp?.next = nil
        }
        
        lenght -= 1
        
        return temp
    }
}

//: [Next](@next)
