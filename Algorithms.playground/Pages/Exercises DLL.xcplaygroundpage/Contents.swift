//: [Previous](@previous)

import Foundation

public class DoublyLinkedList {
    
    var head: Node?
    var tail: Node?
    var lenght: Int = 0
    
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
    
    public func getHead() -> Node? {
        return head
    }
    
    public func append(value: Int) {
        let newNode = Node(value: value)
        
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
        
        let newNode = Node(value: value)
        
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
    
    public func removeFirst() {
        
        guard lenght > 0 else {
            return
        }
        
        if lenght == 1 {
            head = nil
            tail = nil
        } else {
            let temp = head
            head = head?.next
            head?.prev = nil
            temp?.next = nil
        }
        
        lenght -= 1
    }
    
    public func removeLast() {
        
        guard lenght == 0 else {
            return
        }

        if lenght == 1 {
            head = nil
            tail = nil
        } else {
            let temp = tail
            tail = tail?.prev
            tail?.next = nil
            temp?.prev = nil
        }
        
        lenght -= 1
    }
    
    func get(index: Int) -> Node? {
        
        guard index > 0, index < lenght else {
            return nil
        }
        
        var temp = head
        
        if index < lenght / 2 {
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
    
    func set(index: Int, value: Int) {
        
        guard index > 0 , index < lenght else {
            return
        }
        
        let temp = get(index: index)
        temp?.value = value
    }
    
    func insert(index: Int, value: Int) {
        
        guard index > 0, index < lenght else {
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
        
        let newNode = Node(value: value)
        let before = get(index: index - 1)
        let after = before?.next
        
        newNode.prev = before
        newNode.next = after
        before?.next = newNode
        after?.prev = newNode
        
        lenght += 1
    }
    
    func remove(index: Int) {
        
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
        
        let temp = get(index: index)
        temp?.prev?.next = temp?.next
        temp?.next?.prev = temp?.prev
        temp?.next = nil
        temp?.prev = nil
        
        lenght -= 1
    }
    
    func swapFirstLast() {
        
        guard lenght > 1 else {
            return
        }
        
        let tempTail = tail?.value
        tail?.value = head?.value ?? 0
        head?.value = tempTail ?? 0
    }
    
    func reverse() {
        
        guard lenght > 1 else {
            return
        }
        
        var tempHead = head
        var tempTail = tail
        
        for _ in 0..<lenght/2 {
            
            if let value = tempHead?.value {
                tempHead?.value = tempTail?.value ?? 0
                tempTail?.value = value
            }
            
            tempHead = tempHead?.next
            tempTail = tempTail?.prev
        }
    }
    
    public func isPalindrome() -> Bool? {
        
        guard lenght > 0 else {
            return nil
        }
        
        var tempHead = head
        var tempTail = tail
        
        for _ in 0..<lenght/2 {
            
            if let valueHead = tempHead?.value, 
                let valueTail = tempTail?.value,
                valueHead != valueTail {
                return false
            }
            
            tempHead = tempHead?.next
            tempTail = tempTail?.prev
        }
        
        return true
    }
    
    public func swapPairs() {
        
        guard lenght % 2 == 0 else {
            return
        }
        
        var dummyNode = Node(value: 0)
        dummyNode.next = head
        var previousNode = dummyNode
        
        while head != nil && head?.next != nil {
            let firstNode = head
            let secondNode = head?.next
            
            previousNode.next = secondNode
            firstNode?.next = secondNode?.next
            secondNode?.next = firstNode
            
            secondNode?.prev = previousNode
            firstNode?.prev = secondNode
            
            if firstNode?.next != nil {
                firstNode?.next?.prev = firstNode
            }
            
            head = firstNode?.next
            previousNode = firstNode!
        }
        
        head = dummyNode.next
        if (head != nil) {
            head?.prev = nil
        }
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
    
}

var double = DoublyLinkedList(value: 0)
double.append(value: 1)
double.append(value: 2)
double.append(value: 3)
double.isPalindrome()
//double.reverse()
double.swapPairs()
double.printList()

//: [Next](@next)
