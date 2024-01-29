import Foundation

public extension Array where Element == Int {
    
    static func generateRandom(size: Int) -> [Int] {
        guard size > 0 else {
            return [Int]()
        }
        
        return Array(0..<size).shuffled()
    }
    
    static func incrementalArray(size: Int) -> [Int] {
        
        var result = [Int](repeating: 0, count: size)
        
        for i in 0..<size {
            result[i] = i
        }
        
        return result
    }
    
    func startWithZero() -> Bool {
        
        guard self.isEmpty == false else {
            return false
        }
        
        return self.first == 0 ? true : false
    }
    
    func sum() -> Int {
        
        var result = 0
        for i in 0..<self.count {
            result += self[i]
        }
        
        return result
    }
    
    func countOddEven() -> (even: UInt, odd: UInt) {
        
        var even: UInt = 0
        var odd: UInt = 0
        
        for elem in self {
            if elem % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }
        
        return (even, odd)
    }
}
