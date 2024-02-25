//: [Previous](@previous)

import Foundation

public class DoublyLinkedList {
    
    private var head: Node?
    private var tail: Node?
    private var lenght: Int = 0
    
    public class Node {
        var value: Int
        var next: Node?
        var prev: Node?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    init(value: Int) {
        let newNode = Node(value: value)
        head = newNode
        tail = newNode
        lenght = 1
    }
    
    public func printList() {
        var temp = head
        var result = [Int]()
        while temp != nil {
            result.append(temp?.value ?? 0)
            temp = temp?.next
        }
        
        print("List: \(result)")
    }
    
    public func getHead() -> Node? {
        return head
    }
    
    public func getTail() -> Node? {
        return tail
    }
    
    public func getLength() -> Int {
        return lenght
    }
    
    public func append(value: Int) {
        var newNode = Node(value: value)
        
        if lenght == 0 {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
        
        lenght += 1
    }
    
    public func prepend(value: Int) {
        
        var newNode = Node(value: value)
        
        if lenght == 0 {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        }
        
        lenght += 1
    }
    
    public func removeLast() {
        
        guard lenght > 0 else {
            return
        }
        
        if lenght == 1 {
            head = nil
            tail = nil
        } else {
            var temp = tail
            tail = tail?.prev
            tail?.next = nil
            temp?.prev = nil
        }

        lenght -= 1
    
    }
    
    public func removeFirst() {
        
        if lenght == 0 {
            return
        }
        
        let temp = head
        
        if lenght == 1 {
            head = nil
            tail = nil
        } else {
            head = head?.next
            head?.prev = nil
            temp?.next = nil
        }
        
        lenght -= 1
    }
    
    public func get(index: Int) -> Node? {
        
        guard index < lenght, index >= 0 else {
            return nil
        }
        
        let position = lenght / 2
        var temp = head
        
        if index <= position {
            
            for _ in 0..<index {
                temp = temp?.next
            }
            
        } else {
            
            temp = tail
            
            for _ in index..<lenght-1 {
                temp = temp?.prev
            }
        }
        
        return temp
    }
    
    public func set(index: Int, value: Int) {
        
        guard index > 0, index < lenght else {
            return
        }
        
        var node = get(index: index)
        
        if node != nil {
            node?.value = value
        }
    }
    
    public func insert(index: Int, value: Int) {
        
        guard index >= 0, index < lenght else {
            return
        }
        
        if index == 0 {
            prepend(value: value)
            return
        }
        
        if index == lenght - 1 {
            append(value: value)
            return
        }
        
        var newNode = Node(value: value)
        var before = get(index: index - 1)
        var after = before?.next
        
        newNode.prev = before
        newNode.next = after
        before?.next = newNode
        after?.prev = newNode
        
        lenght += 1
    }
    
    public func remove(index: Int) {
        
        guard index > 0, index < lenght else {
            return
        }
        
        if index == 0 {
            removeFirst()
            return
        }
        
        if index == lenght - 1 {
            removeLast()
            return
        }
        
        var temp = get(index: index)
        
        temp?.prev?.next = temp?.next
        temp?.next?.prev = temp?.prev
        
        temp?.next = nil
        temp?.prev = nil
        lenght -= 1
    }
}

var double = DoublyLinkedList(value: 0)
double.append(value: 1)
double.append(value: 2)
double.append(value: 3)
double.append(value: 4)
double.append(value: 5)
double.insert(index: 1, value: 7)
double.remove(index: 2)
double.printList()
double.remove(index: 2)
double.printList()
//: [Next](@next)
