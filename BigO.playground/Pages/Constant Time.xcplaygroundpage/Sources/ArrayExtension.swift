import Foundation

public extension Array where Element == Int {
    
    func startWithZero() -> Bool {
        
        guard self.isEmpty == false else {
            return false
        }
        
        return self.first == 0 ? true : false
    }
    
}
