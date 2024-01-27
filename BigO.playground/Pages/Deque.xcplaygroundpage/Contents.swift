//: [Previous](@previous)

import Foundation

public struct Deque<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
    
    public mutating func enqueueFront(_ element: Element) {
        storage.insert(element, at: 0)
    }
    
    public mutating func enqueueBack(_ element: Element) {
        storage.append(element)
    }
    
    public mutating func dequeueFront() -> Element? {
        storage.isEmpty ? nil : storage.removeFirst()
    }
    
    public mutating func dequeueBack() -> Element? {
        storage.isEmpty ? nil : storage.removeLast()
    }
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    public var peekFront: Element? {
        storage.first
    }
    
    public var peekBack: Element? {
        storage.last
    }
}

extension Deque: CustomStringConvertible {
    public var description: String {
        storage.description
    }
}

var deque = Deque<Int>()

deque.enqueueFront(1)
deque.enqueueFront(2)
deque.enqueueBack(3)
deque.enqueueBack(4)

print(deque)

let emptyWarning = "Deque is empty"

print(deque.dequeueFront() ?? emptyWarning)
print(deque.dequeueBack() ?? emptyWarning)

print(deque)

print(deque.peekFront ?? emptyWarning)
print(deque.peekBack ?? emptyWarning)

print(deque)

// Sliding Window
// Bruto Force without Deque
func findSlidingWindowMax(_ numbers: [Int], windowSize: Int) -> [Int] {
    
    var result = [Int]()
    
    guard numbers.isEmpty == false , windowSize >= 1,
          windowSize <= numbers.count else {
        return result
    }
    
    switch (windowSize) {
        case 1: result = numbers
        case numbers.count:
            if let max = numbers.max() {
                result = [max]
            }
        default: //BigO : n - k + 1 (n: numbers, k:windowSize)
            for i in 0...numbers.count - windowSize {
                let windows = Array(numbers[i..<i+windowSize])
                if let maxElement = windows.max() {
                    //max() all K windows elements
                    result.append(maxElement)
                }
            //Result BigO : O((n - k + 1) * k)
        }
    }
    
    return result
}

let inputArray = Array.generateRandom(size: 300)
var timeBigO: Double

timeBigO = BenchTimer.measureBlock {
    _ = findSlidingWindowMax(inputArray, windowSize: 3)
}

print("BigO ===> \(timeBigO.formattedTime)")

//Using Deque

func findSlindWindowMaxdeque(_ numbers: [Int], windowSize: Int) -> [Int] {
    
    var result = [Int]()
    
    var deque = Deque<Int>()
    
    guard numbers.isEmpty == false,
          windowSize >= 1,
          windowSize <= numbers.count else {
        return result
    }
    
    switch(windowSize) {
        case 1:
            result = numbers
        case windowSize:
            if let max = numbers.max() {
                result = [max]
            }
        default:
        //Big O - linear operation O(n)
            for i in 0..<numbers.count {
                while !deque.isEmpty, let last = deque.peekBack,
                      numbers[i] >= last {
                    //deque.peekBack O(1)
                    
                    deque.dequeueBack() // O(1)
                }
                //O(n)
                deque.enqueueBack(numbers[i])
                let windowStartIndex = i - windowSize + 1
                
                if windowStartIndex >= 0 {
                    //deque.peekFront O(1)
                    if let maxElement = deque.peekFront {
                        result.append(maxElement)
                        
                        if numbers[windowStartIndex] == maxElement {
                            //O(1)
                            deque.dequeueFront()
                        }
                    }
                }
            }
    }
    return result
}
 
timeBigO = BenchTimer.measureBlock {
    _ = findSlidingWindowMax(inputArray, windowSize: 3)
}

print("BigO ===> \(timeBigO.formattedTime)")
//: [Next](@next)
