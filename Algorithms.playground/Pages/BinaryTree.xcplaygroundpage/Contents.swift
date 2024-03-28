//: [Previous](@previous)

import Foundation

public class BinarySearchTree {
    
    var root: Node?
    
    class Node {
        var value: Int
        var left: Node?
        var right: Node?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    public func insert(value: Int) {
        
        let newNode = Node(value: value)
        
        if root == nil {
            root = newNode
            return
        }
        
        var temp = root
        
        while true {
            if newNode.value == temp?.value {
                break
            }
            
            if let value = temp?.value, newNode.value < value{
                if temp?.left == nil {
                    temp?.left = newNode
                }
                temp = temp?.left
            } else {
                if temp?.right == nil {
                    temp?.right = newNode
                }
                temp = temp?.right
            }
        }
    }
    
    public func contains(value: Int) -> Bool {
        
        var temp = root
        
        while temp != nil {
            
            if let tempValue = temp?.value {
                
                if  value < tempValue {
                    
                    temp = temp?.left
                    
                } else if value > tempValue {
                    
                    temp = temp?.right
                    
                } else {
                    
                    return true
                }
            }
        }
        
        return false
    }
}

var myBST = BinarySearchTree()
myBST.insert(value: 47)
myBST.insert(value: 21)
myBST.insert(value: 76)
myBST.insert(value: 18)
myBST.insert(value: 52)
myBST.insert(value: 82)
myBST.insert(value: 27)

print(myBST.root?.left?.right?.value ?? 0)

myBST.contains(value: 76)
myBST.contains(value: 6)
//: [Next](@next)
