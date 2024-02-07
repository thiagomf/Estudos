import UIKit

public class LinkedList {
    // LL: Constructor
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
        let node = Node(value: value)
        head = node
        tail = node
        length = 1
    }
    
    public func getHead() -> Node? {
        return head
    }
    
    public func getTail() -> Node? {
        return tail
    }
    
    public func getLength() -> Int {
        return length
    }
    
    public func printList()  {
        
        var temp = head
        var result = [Int]()
        
        while let currentNode = temp {
            result.append(currentNode.value)
            temp = temp?.next
        }
        
        print("List is \(result)")
    }
    
    //LL: Append
    public func append(value: Int) {
        
        let newNode = Node(value: value)
        
        if length == 0 {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
        
        length += 1
        
    }
    
    public func removeLast() -> Node? {
        
        guard length > 0 else {
            return nil
        }
         
        var temp: Node? = head
        var pre: Node? = head
        
        while temp?.next != nil {
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
        
        return temp
    }
    
    public func removeFirst() -> Node? {
        
        if length == 0 {
            return nil
        }
        
        let temp: Node? = head
        head = head?.next
        temp?.next = nil
        
        length -= 1
        
        if length == 0 {
            tail = nil
        }
        
        return temp
    }
    
    public func remove(index: Int, value: Int) -> Node? {
        
        guard index >= 0 , index < length else {
            return nil
        }
        
        if index == 0 {
            return removeFirst()
        }
        
        if index == length - 1 {
            return removeLast()
        }
        
        let pre = get(index: index - 1)
        let temp = pre?.next
        
        pre?.next = temp?.next
        temp?.next = nil
        length -= 1
        
        return temp
    }
    
    //LL: Prepend
    public func prepend(value: Int) {
        
        let newNode = Node(value: value)
        
        if length == 0 {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        
        length += 1
        
    }
    
    //LL: Get
    func get(index: Int) -> Node? {
        
        guard index >= 0 && index < length else {
            return nil
        }
        
        var temp = head
        
        for _ in 0..<index {
            temp = temp?.next
        }
        
        return temp
    }
    
    //LL: Set
    func set(index: Int, value: Int) -> Bool {
        
        if let temp = get(index: index) {
            temp.value = value
            return true
        }
        
        return false
    }
    
    //LL Insert
    public func insert(index: Int, value: Int) -> Bool {
        
        guard index >= 0 , index < length else {
            return false
        }
        
        if index == 0 {
            append(value: value)
            return true
        }
        
        if index == length - 1 {
            append(value: value)
            return true
        }
        
        let newNode = Node(value: value)
        let pre: Node? = get(index: index - 1)
        newNode.next = pre?.next
        pre?.next = newNode
        
        length += 1
        
        return true
    }
    
    //LL: Reverse
    func reverse() {
        
        var temp: Node? = head
        head = tail
        tail = temp
        
        var after: Node? = temp?.next
        var before: Node? = nil
        
        for _ in 0..<length {
            after = temp?.next
            temp?.next = before
            before = temp
            temp = after
        }
    }
    
    //Floyd's Tortoise and Hare algorithm
    func findMiddleNode() -> Node? {
        
        var tortoise = head
        var hare = head
        
        while hare != nil && hare?.next != nil {
            
            tortoise = tortoise?.next
            hare = hare?.next?.next
            
        }
        
        return tortoise
    }
    
    func hasLoop() -> Bool {
        
        var tortoise = head
        var hare = head
        
        while hare != nil && hare?.next != nil {
            tortoise = tortoise?.next
            hare = hare?.next?.next
            
            if tortoise === hare {
                return true
            }
            
        }
        
        return false
    }
    
    func findKnode(k: Int) -> Node? {
        
        guard k > 0 else {
            return nil
        }
        
        var fast = head
        var slow = head
        
        for _ in 0..<k {
            
            guard fast != nil else {
                return nil
            }
            
            fast = fast?.next
        }
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
    
//    public func partitionList(x: Int) {
//        
//        var less: LinkedList?
//        var greater: LinkedList?
//        
//        var temp = head
//        
//        while temp != nil {
//        
//            if let value = temp?.value {
//                
//                if value < x {
//                    
//                    less == nil ? less = LinkedList(value: value) : less?.append(value: value)
//                    
//                } else {
//                    
//                    greater == nil ? greater = LinkedList(value: value) : greater?.append(value: value)
//                }
//            }
//            
//            temp = temp?.next
//        }
//        
//        less?.tail?.next = greater?.head
//        
//        less?.printList()
//    }
    
    func partitionList(x: Int) -> Node? {
        
        if head == nil {
            return nil
        }
        
        var dummy1 = Node(value: 0)
        var dummy2 = Node(value: 0)
        
        var prev1 = dummy1
        var prev2 = dummy2
        
        var current = head
        
        while current != nil {
            
            if let temp = current {
                if temp.value < x {
                    prev1.next = temp
                    prev1 = temp
                } else {
                    prev2.next = temp
                    prev2 = temp
                }
            }
            
            current = current?.next
        }
        
        prev2.next = nil
        
        prev1.next = dummy2.next
        
        head = dummy1.next
        
        while(head != nil) {
            print("Value ===> \(String(describing: head?.value))")
            head = head?.next
        }
        
        return head
    }
    
    func removeDuplicates() {
        
        var temp = head
        var after: Node?
        var dict = [Int: Bool]()
        
        while temp != nil {
            if let value = temp?.value {
                if dict[value] == nil {
                    dict[value] = true
                    after = temp
                } else if dict[value] == true {
                    after?.next = temp?.next
                    length -= 1
                }
            }
            temp = temp?.next
        }
    }
    
    func power(base: Int, exponent: Int) -> Int {
        
        var result = 1
        
        for _ in 0..<exponent {
            result *= base
        }
        
        return result
        
    }
    
    func binaryToDecimal() -> Int {
        
        var temp = head
        var result = 0
        
        while temp != nil {
            if let value = temp?.value {
                result = result * 2 + value
            }
           
            temp = temp?.next
        }
        
        return result
    }
    
    func reverseBetween(startIndex: Int, endIndex: Int) {
        
        guard startIndex >= 0, endIndex < length else {
            return
        }
        
        var first: Node? = get(index: startIndex)
        var second: Node? = get(index: endIndex)
        var temp = head
        var secondNext = second?.next
        var count = 0
        
        while temp != nil {
            
            if startIndex == 0 && count == 0 {
                let value = temp?.next
                head = second
                second?.next = value
            }
            
            if  startIndex - 1 == count {
                temp?.next = second
                second?.next = first?.next
            }
            
            if endIndex - 1 == count {
                temp?.next = first
                first?.next = secondNext
            }
            count += 1
            temp = temp?.next
        }
    }
}

var linked = LinkedList(value: 0)
linked.append(value: 1)
linked.append(value: 2)
linked.append(value: 3)
linked.append(value: 4)

linked.reverseBetween(startIndex: 0, endIndex: 4)
//linked.reverseBetween(startIndex: 0, endIndex: 4)
linked.printList()
//linked.append(value: 2)
//linked.append(value: 1)
//linked.append(value: 5)
//linked.append(value: 6)
//linked.append(value: 1)
//linked.append(value: 0)


//linked.append(value: 6)
//linked.printList()
//linked.findMiddleNode()?.value

//create a loop connecting the tail to the second node
//linked.getTail()?.next = linked.getHead()?.next
//linked.hasLoop()

//linked.findKnode(k: 5)?.value
//linked.partitionList(x: 5)
//linked.removeDuplicates()
//linked.printList()
//linked.getLength()
