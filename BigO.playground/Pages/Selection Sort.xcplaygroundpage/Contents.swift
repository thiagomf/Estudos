//: [Previous](@previous)

import Foundation

//MARK: Selection Sort
// Uses nested loops O(n*n)
func selectionSort(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    
    for index in 0..<(result.count - 1) {
        
        var indexLowest = index
        
        for forwardIndex in (index + 1) ..< result.count {
            if result[forwardIndex] < result[indexLowest] {
                indexLowest = forwardIndex
            }
        }
        
        if index != indexLowest {
            result.swapAt(index, indexLowest)
        }
    }
    
    return result
}


var inputSize = 10
let array10 = Array.generateRandom(size: inputSize)

var execTime = BenchTimer.measureBlock {
    _ = selectionSort(array10)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize *= 10
let array100 = Array.generateRandom(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = selectionSort(array100)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize *= 10
let array1000 = Array.generateRandom(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = selectionSort(array1000)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize = 10
let sortArray10 = Array.incrementalArray(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = selectionSort(sortArray10)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize = 100
let sortArray100 = Array.incrementalArray(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = selectionSort(sortArray100)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")

inputSize = 1000
let sortArray1000 = Array.incrementalArray(size: inputSize)

execTime = BenchTimer.measureBlock {
    _ = selectionSort(sortArray1000)
}

print("Tempo de ordem para \(inputSize) => \(execTime.formattedTime)")
//: [Next](@next)
