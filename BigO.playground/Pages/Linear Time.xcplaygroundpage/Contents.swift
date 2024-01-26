import Foundation

let array100 = Array.generateRandom(size: 100)

var execTime100 = BenchTimer.measureBlock {
    _ = array100.sum()
}

print("Average execution time for sum array100: \(execTime100)")

let array1000 = Array.generateRandom(size: 1000)

var execTime1000 = BenchTimer.measureBlock {
    _ = array1000.sum()
}

print("Average execution time for sum array100: \(execTime1000)")

let array10000 = Array.generateRandom(size: 10000)

var execTime10000 = BenchTimer.measureBlock {
    _ = array10000.sum()
}

print("Average execution time for sum array100: \(execTime10000)")

var execTimeOddEven100 = BenchTimer.measureBlock {
    _ = array100.countOddEven()
}

print("Average OddEven execution time for sum array100: \(execTimeOddEven100.formattedTime)")

var execTimeOddEven1000 = BenchTimer.measureBlock {
    _ = array1000.countOddEven()
}

print("Average OddEven execution time for sum array1000: \(execTimeOddEven1000.formattedTime)")

var execTimeOddEven10000 = BenchTimer.measureBlock {
    _ = array10000.countOddEven()
}

print("Average OddEven execution time for sum array10000: \(execTimeOddEven10000.formattedTime)")
