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
    
    func findDuplicate() -> Bool {
        
        var hash: [Int : Bool] = [:]
        
        for (_, value) in array1.enumerated() {
            if hash[value] == true {
                return true
            } else {
                hash[value] = true
            }
        }
        
        return false
    }
    
    func firstNonRepat(word: String) -> Character? {
        var hash: [Character: Int] = [:]
        
        for (_, value) in word.enumerated() {
            
            if hash[value] == nil {
                hash[value] = 1
            } else {
                hash[value, default: 0] += 1
            }
        }
        
        for (_, value) in word.enumerated() {
            if hash[value] == 1 {
                return value
            }
        }
        
        return nil
    }
    
    func anagramsGroup(list: [String]) -> [[String]] {
       
        var resp: [String: [String]] = [:]
        var respArray: [[String]] = []
        for word in list {
            
            var charName = Array(word)
            charName.sort()
            let canonical = String(charName)
            
            if resp[canonical] == nil {
                resp[canonical, default: []].append(contentsOf: [word])
            } else {
                resp[canonical]?.append(word)
            }
            
            
        }
        
        for (_, value) in resp {
            respArray.append(value)
        }
        
        return respArray
    }
    
    func twoSun(nums: [Int], target: Int) -> [Int] {
        
        var dict: [Int: Int] = [:]
        
        for (index, value) in nums.enumerated() {
            
            let address = target - value
            
            if let number = dict[value] {
                return [number, index]
            } else {
                dict[address] = index
            }
        }
        
        return [0,0]
    }
    
    func subarraySum(nums: [Int], target: Int) -> [Int] {
        
        var sumIndex: [Int: Int] = [0 : -1]
        var currentSum = 0
        
        for (index,value) in nums.enumerated() {
            currentSum += value
            if let value = sumIndex[currentSum - target] {
                return [value+1 ,index]
            } else {
                sumIndex[currentSum] = index
            }
            
        }
        
        return []
    }
    
    func removeDuplicates(nums: [Int]) -> [Int] {
        
        var resp: [Int] = []
        var dictValue: [Int : Bool] = [:]
        
        for num in nums {
            if dictValue[num, default: false] == false {
                dictValue[num] = true
                resp.append(num)
            }
        }
        
        return resp
    }
    
    func removeSuplicatesWithSet(nums: [Int]) -> Set<Int> {
        var resp: Set<Int> = Set(nums)
        return resp
    }
    
    func hasUniqueChars(value: String) -> Bool {
        
        let countChar = value.count
        var arrayChar = Set(value)
        
        if countChar != arrayChar.count {
            return false
        }
        
        return true
    }
    
    func findPair(array1: [Int], array2: [Int], target: Int) -> [[Int]] {
        
        var dict: [Int: Int] = [:]
        var resp : [[Int]] = []
        
        for (index, value) in array1.enumerated() {
            
            let searchNum = target - value
            dict[searchNum] = index
        
        }
        
        for (_, value) in array2.enumerated() {
            
            if dict[value] != nil {
                var arrayInt: [Int] = []
                if let indexArray1 = dict[value]  {
                    let valueArray1 = array1[indexArray1]
                    arrayInt.append(valueArray1)
                    arrayInt.append(value)
                    resp.append(arrayInt)
                }
            }
        }
        
        return resp
    }
    
    func longestConsecutiveSequence(array: [Int]) -> [Int] {
        
        var myArray = Set(array)
        var result: [Int] = []
        
        for num in array {
            
            var consecutive : [Int] = []
            
            consecutive.append(num)
            
            var nextNumber = num + 1
            
            while myArray.contains(nextNumber) {
                consecutive.append(nextNumber)
                nextNumber += 1
            }
            
            if result.count < consecutive.count {
                result = consecutive
            }
        }
        
        return result
    }
}

var hash = HashExercise([1,2,3], [1,5,6])
hash.isItemCommon()
hash.findDuplicate()
hash.firstNonRepat(word: "hello")
let elements = hash.anagramsGroup(list: ["eat", "tea", "tan", "ate", "nat", "bat"])
print(elements)
let suns = hash.twoSun(nums: [2, 7, 11, 15], target: 9)
print(suns)
let arraySun = hash.subarraySum(nums: [1, 2, 3, 4, 5], target: 9)
print(arraySun)

let duplicates = hash.removeDuplicates(nums: [1, 2, 3, 4, 1, 2, 5, 6, 7, 3, 4, 8, 9, 5])
let duplicatesWithSet = hash.removeSuplicatesWithSet(nums: [1, 2, 3, 4, 1, 2, 5, 6, 7, 3, 4, 8, 9, 5])
print(duplicatesWithSet)

let hasUniqueChars = hash.hasUniqueChars(value: "hello")

let findPair = hash.findPair(array1: [1, 2, 3, 4, 5], array2: [2, 4, 6, 8, 10], target: 7)
print(findPair)

let longestConsecutiveSequence = hash.longestConsecutiveSequence(array: [100, 4, 200, 1, 3, 2])
print(longestConsecutiveSequence)
//: [Next](@next)
