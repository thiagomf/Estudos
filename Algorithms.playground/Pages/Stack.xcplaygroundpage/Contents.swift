//: [Previous](@previous)

import Foundation
public class Stack {
    
    private var top: Node?
    private var height: Int = 0
    
    public class Node {
        
        var value: Int
        var next: Node?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    init(value: Int) {
        
        var newNode = Node(value: value)
        top = newNode
        height += 1
    }
    
    public func getTop() -> Node? {
        return top
    }
    
    public func getHeight() -> Int {
        return height
    }
    
    public func printStack() {
        var temp = top
        while temp != nil {
            print(temp?.value ?? "")
            temp = temp?.next
        }
    }
    
    public func push(value: Int) {
        var newNode = Node(value: value)
        
        if height == 0 {
            top = newNode
        } else {
            newNode.next = top
            top = newNode
        }
        
        height += 1
    }
    
    public func pop() -> Node? {
        
        guard height > 0 else {
            return top
        }
        
        var temp = top
        top = temp?.next
        temp?.next = nil
        height -= 1
        return temp
        
    }
    
}

//: [Next](@next)
