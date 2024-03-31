//: [Previous](@previous)

import Foundation

class HashExercise {
    
    var array1: [Int] = []
    var array2: [Int] = []
    
    init(_ array1: [Int], _ array2: [Int]) {
        self.array1 = array1
        self.array2 = array2
    }
    
    func isItemCommon() -> Bool {
        
        var hash: [Int: Bool] = [:]
        
        for (_,value) in array1.enumerated() {
            hash[value] = true
        }
        
        for (_, value) in array2.enumerated() {
            
            if hash[value] == true {
                return true
            }
        }
        
        return false
    }
    
    func findDuplicate() {
        
    }
}

var hash = HashExercise([1,2,3], [1,5,6])
hash.isItemCommon()

//: [Next](@next)
