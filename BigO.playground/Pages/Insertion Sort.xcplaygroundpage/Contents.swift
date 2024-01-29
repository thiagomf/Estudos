//: [Previous](@previous)

import Foundation

//MARK: Insertion Sort
//O(n*n) n square
func insertSort(_ input: [Int]) -> [Int] {
    
    var result = input
    
    let count = result.count
    
    for sortedIndex in 1..<count {
        var backIndex = sortedIndex
        while backIndex > 0 && result[backIndex] < result[backIndex-1] {
            result.swapAt(backIndex-1, backIndex)
            backIndex -= 1
        }
    }
    
    return result
}

var inputSize = 10
let array10 = Array.generateRandom(size: inputSize)

var execTime = BenchTimer.measureBlock {
    _ = insertSort(array10)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize *= 10

let array100 = Array.generateRandom(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = insertSort(array100)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

//inputSize *= 10
//
//let array1000 = Array.generateRandom(size: inputSize)
//
//execTime = BenchTimer.measureBlock {
//    _ = insertSort(array1000)
//}
//
//print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize = 10

let arrayShorted10 = Array.incrementalArray(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = insertSort(arrayShorted10)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize *= 10

let arrayShorted100 = Array.incrementalArray(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = insertSort(arrayShorted100)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

//: [Next](@next)
