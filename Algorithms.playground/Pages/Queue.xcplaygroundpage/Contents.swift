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
            last?.next = newNode
            last = newNode
        }
        
        lenght += 1
    }
    
    public func dequeue() -> Node? {
        
        guard lenght > 0 else {
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
    
    public func printQueue() {
        
        var temp = first
        
        while temp != nil {
            print(temp?.value ?? 0)
            temp = temp?.next
        }
    }
    
    public func getFirst() {
        print("The first value is \(first?.value ?? 0)")
    }
    
    public func getLast() {
        print("The last value is \(last?.value ?? 0)")
    }
}

var exemple = Queue(value: 1)
exemple.enqueue(value: 2)
exemple.enqueue(value: 3)
exemple.printQueue()

//: [Next](@next)
