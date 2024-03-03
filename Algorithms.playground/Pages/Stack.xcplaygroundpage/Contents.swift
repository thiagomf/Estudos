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

public class MyQueue {
    
    var stack01: Stack? = nil
    var stack02: Stack? = nil
    
    init() {
    }
    
    public func myEnqueue(value: Int) {
        
        if stack01 == nil {
            stack01 = Stack(value: value)
        } else {
            stack02 = Stack(value: stack01?.pop()?.value ?? 0)
            while (stack01?.getHeight() != 0) {
                stack02?.push(value: stack01?.pop()?.value ?? 0)
            }
            
            stack01?.push(value: value)
            
            while(stack02?.getHeight() != 0) {
                stack01?.push(value: stack02?.pop()?.value ?? 0)
            }
        }
    }
    
    public func myDequeue() {
        if stack01 != nil {
            stack01?.pop()
        }
    }
}

var stack = Stack(value: 4)
stack.push(value: 5)
stack.push(value: 6)
stack.printStack()

print("---------------")

var myQueue = MyQueue()
myQueue.myEnqueue(value: 1)
myQueue.myEnqueue(value: 2)
myQueue.myEnqueue(value: 3)
myQueue.myDequeue()
myQueue.stack01?.printStack()
//: [Next](@next)
