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
            var temp = dataMap[i]
            while temp != nil {
                print("  { \(temp?.key ?? "") = \(temp?.value ?? 0) }")
                temp = temp?.next
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
    
    public func get(key: String) -> Int {
        
        let index = hash(key: key)
        
        var temp = dataMap[index]
        
        while temp != nil {
            if (temp?.key == key) {
                return temp?.value ?? 0
            }
            
            temp = temp?.next
        }
        
        return 0
    }
    
    
    public func keys() -> [String] {
        
        var allKeys: [String] = []
        
        for (index, _) in dataMap.enumerated() {
            var temp = dataMap[index]
            while(temp != nil) {
                allKeys.append(temp?.key ?? "")
                temp = temp?.next
            }
        }
        
        return allKeys
    }
}

var myHash = HashTable()
myHash.set(key: "paint", value: 20)
myHash.set(key: "bolts", value: 40)
myHash.set(key: "nails", value: 100)
myHash.set(key: "tile", value: 50)
myHash.set(key: "tile", value: 20)
myHash.set(key: "lumber", value: 80)

myHash.get(key: "tile")
myHash.get(key: "lomber")
myHash.printTable()
myHash.keys()

//: [Next](@next)
