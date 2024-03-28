//: [Previous](@previous)

import Foundation

public class HashTable {
    
    var size: Int = 7
    var dataMap: [Node?]
    
    init() {
        dataMap = [Node?](repeating: nil, count: 7)
    }
    
    public class Node {
        var key: String = ""
        var value: Int = 0
        var next: Node?
        
        init(key: String, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    public func getDataMap() -> [Node?] {
        return dataMap
    }
    
    public func printTable() {
        for i in 0..<dataMap.count {
            print("\(i):")
            let temp = dataMap[i]
            while temp != nil {
                print("  { \(temp?.key ?? "") = \(temp?.value ?? 0) }")
            }
        }
    }
    
    public func hash(key: String) -> Int {
        var hash = 0
        let keyChars = Array(key)
        
        for (_, value) in keyChars.enumerated() {
            let asciiValue = Int(value.asciiValue ?? 0)
            hash = (hash + asciiValue * 23) % dataMap.count
        }
        
        return hash
    }
    
    public func set(key: String, value: Int) {
        
        let index = hash(key: key)
        var newNode = Node(key: key, value: value)
        
        if dataMap[index] == nil {
            
            dataMap[index] = newNode
            
        } else {
            
            var temp = dataMap[index]
            
            if temp?.key == key {
                temp?.value += value
                return
            }
            
            while temp?.next != nil {
                temp = temp?.next
                if temp?.key == key {
                    temp?.value += value
                    return
                }
            }
            
            temp?.next = newNode
        }
    }
}



//: [Next](@next)
