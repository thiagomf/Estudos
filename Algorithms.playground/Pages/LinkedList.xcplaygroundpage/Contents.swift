//: [Previous](@previous)
import Foundation

public class LinkedList {
    
    private var head: Node?
    private var tail: Node?
    private var length: Int
    
    public class Node {
        var value: Int
        var next: Node?
        
        init(value: Int) {
            self.value = value
            self.next = nil
        }
    }
    
    init(value: Int) {
        var newNode = Node(value: value)
        head = newNode
        tail = newNode
        length = 1
    }
    
    public func getTail() {
        print("Tail: \(tail?.value ?? 0)")
    }
    
    public func getHead() {
        print("Head: \(head?.value ?? 0)")
    }
    
    public func getLength() {
        print("Length: \(length)")
    }
    
    public func printList() -> [Int] {
        var temp = head
        var resp = [Int]()
        while let currentNode = temp {
            resp.append(currentNode.value)
            temp = currentNode.next
        }
        print("\(resp)")
        return resp
    }
    
    public func get(index: Int) -> Node? {
        
        guard index >= 0 && index < length else {
            return nil
        }
        
        var temp = head
        for _ in 0..<index {
            temp = temp?.next
        }
        
        return temp
    }
    
    public func set(position: Int, value: Int) -> Bool {
        
        var temp = get(index: position)
        if let node = temp {
            node.value = value
            return true
        }
        
        return false
    }
    
    public func append(value: Int) -> Node? {
        
        var newNode = Node(value: value)
        
        if length == 0 {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        
        length += 1
        
        return tail
    }
    
    public func prepend(value: Int) -> Node? {
        
        var newNode = Node(value: value)
        
        if(length == 0) {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        
        length += 1
        
        return head
    }
    
    public func insert(position: Int, value: Int) -> Bool {
    
        guard position > 0 && position < length else {
            return false
        }
        
        if position == 0 {
            prepend(value: value)
            return true
        }
        
        if position == length {
            append(value: value)
            return true
        }
        
        var newNode = Node(value: value)
        var temp = get(index: position - 1)
        
        newNode.next = temp?.next
        temp?.next = newNode
        length += 1
        
        return true
        
    }
    
    public func removeFirst() -> Node? {
        
        guard length > 0 else {
            return nil
        }
        
        var temp = head
        head = head?.next
        temp?.next = nil
        length -= 1
        
        if (length == 0 ) {
            tail = nil
        }
        
        return temp
    }
    
    public func removeLast() -> Node? {
        
        guard length > 0 else {
            print("You don't have any itens in your linked list")
            return nil
        }
        
        var temp = head
        var pre = head
        
        while(temp?.next != nil) {
            pre = temp
            temp = temp?.next
        }
        
        tail = pre
        tail?.next = nil
        length -= 1
        
        if length == 0 {
            head = nil
            tail = nil
        }
        
        if let result = temp {
            print("Removed ==> \(result.value)")
        }
        
        return temp
    }
    
    public func remove(position: Int) -> Node? {
        
        if position < 0 || position >= length {
            return nil
        }
        if position == length-1 {
            return removeLast()
        }
        if position == 0 {
            return removeFirst()
        }
        
        var prev = get(index: position - 1)
        var temp = prev?.next
        
        prev?.next = temp?.next
        temp?.next = nil
        length -= 1
        
        return temp
    }
    
    public func reverse() {
        
        var temp = head
        head = tail
        tail = temp
        var after = temp?.next
        var before: Node? = nil
        
        for _ in 0..<length {
            after = temp?.next
            temp?.next = before
            before = temp
            temp = after
        }
        
    }
}


var linked1 = LinkedList(value: 1)
linked1.append(value: 2)
linked1.append(value: 3)
linked1.append(value: 4)
linked1.append(value: 5)

//linked1.printList()

linked1.removeLast()?.value
linked1.removeLast()?.value
linked1.removeLast()?.value
linked1.removeLast()?.value
linked1.removeLast()?.value
linked1.removeLast()?.value

linked1.append(value: 2)?.value
linked1.prepend(value: 1)?.value
linked1.append(value: 3)?.value
linked1.prepend(value: 0)?.value
linked1.printList()
linked1.removeFirst()?.value
linked1.printList()
linked1.get(index: -1)?.value
linked1.get(index: 0)?.value
linked1.get(index: 1)?.value
linked1.get(index: 2)?.value
linked1.get(index: 3)?.value
linked1.set(position: 0, value: 4)
linked1.get(index: 0)?.value
linked1.printList()

linked1.insert(position: 2, value: 10)
linked1.printList()

linked1.remove(position: 2)?.value

linked1.reverse()

linked1.printList()
//: [Next](@next)
