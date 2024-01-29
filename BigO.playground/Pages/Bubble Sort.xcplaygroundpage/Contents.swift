//: [Previous](@previous)

import Foundation

//MARK: Bubble Sort
// O(n*n) -> worst case
// not use in programs ... insertion is better

func bubbleSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    
    var isSwapped = false
    repeat {
        isSwapped = false
        for index in 1..<count {
            if result[index] < result[index-1] {
                result.swapAt(index, index-1)
                isSwapped = true
            }
        }
    } while isSwapped
    
    return result
}

//: [Next](@next)
