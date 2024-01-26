import Foundation

public extension Dictionary where Key == String, Value == Int {
    
    static func generate(size: Int) -> [String: Int] {
        
        var result = [String: Int]()
        
        guard size > 0 else {
            return result
        }
        
        let values = Array(0..<size)
        for i in values {
            let key = String(i)
            result[key] = i
        }
        
        return result
    }
}
