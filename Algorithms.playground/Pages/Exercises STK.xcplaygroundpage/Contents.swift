//: [Previous](@previous)

import Foundation

public class GenericStack<T> {
    
    private var stackList: [T] = []
    
    public func getStackList() -> [T] {
        return stackList
    }
    
    public func printStack() {
        print(stackList)
    }
    
    public func isEmpty() -> Bool {
        return stackList.isEmpty
    }
    
    public func peek() -> T? {
        if isEmpty() {
            return nil
        } else {
            return stackList[stackList.count - 1]
        }
    }
    
    public func size() -> Int {
        return stackList.count
    }
    
    public func push(value: T) {
        stackList.append(value)
    }
    
    public func pop() -> T? {
        return stackList.popLast()
    }
    
    public func reverse() -> [T] {
        var reversed: [T] = []
        
        while !isEmpty() {
            reversed.append(stackList.popLast() ?? "" as! T)
        }
        
        stackList = reversed
        return stackList
    }
    
    public func balance() -> Bool {
        
        var elements: [String] = []
        
        for value in stackList {
            if (value as! String == ")") {
                if elements.last == "(" {
                    elements.popLast()
                }
            } else {
                elements.append(value as! String)
            }
        }
        
        return elements.isEmpty
    }
    
    public func sortStack() {
        
        guard !stackList.isEmpty else {
            return
        }
        
        var sortedStack: [Int] = []
        
        while(!stackList.isEmpty) {
            
            var temp = pop() as! Int
            
            while !sortedStack.isEmpty, 
                    sortedStack[sortedStack.count - 1] < temp {
                push(value: sortedStack.popLast() as! T)
            }
            
            sortedStack.append(temp)
        }
        
        while(!sortedStack.isEmpty) {
            push(value: sortedStack.popLast() as! T)
        }
    }
}

var value = GenericStack<Int>()
value.push(value: 0)
value.push(value: 2)
value.push(value: 3)
value.push(value: 1)

value.sortStack()

value.printStack()

//: [Next](@next)
