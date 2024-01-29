//: [Previous](@previous)

import Foundation

//MARK: Quick Sort
//Average and best case case O(n log n)
//Worst O(nˆ2)
func qsort(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    let pivotIndex = input.count / 2
    let pivot = input[pivotIndex]
    
    let less = input.filter { $0 < pivot }
    let equal = input.filter { $0 == pivot }
    let greater = input.filter { $0 > pivot }
    
    return qsort(less) + equal + qsort(greater)
}

let numbers = Array.generateRandom(size: 100)

var exec = BenchTimer.measureBlock {
    _ = qsort(numbers)
}

print(exec.formattedTime)

let numbers1000 = Array.generateRandom(size: 1000)

exec = BenchTimer.measureBlock {
    _ = qsort(numbers1000)
}

print(exec.formattedTime)

//: [Next](@next)


//www.codility.com
//www.hackerrank.com

