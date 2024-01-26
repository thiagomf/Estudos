//SUM
//Brute Force

func sum(n: Int) -> Int {
    
    var result = 0
    
    guard n > 0 else {
        return 0
    }

    for number in 1...n {
        result += number
    }
    
    return result
}

let step = 100

var execTime: Double

for i in 1...5 {
    execTime = BenchTimer.measureBlock {
        _ = sum(n: i * step)
    }
    
    print("Brute force Time Sum i = \(i) timer = \(execTime.formattedTime)")
}

// Optimezed Sum

func sumOptimized(n: Int) -> Int {
    
    return n * (n + 1) / 2
}

var excTime: Double

for i in 1...5 {
        
    excTime = BenchTimer.measureBlock {
        _ = sumOptimized(n: i*step)
    }
    
    print("OptimizedTime of sum \(i) is time = \(excTime.formattedTime)")
}

// Two Sun

//Brute Force

func findTwoSum(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 1 else {
        return nil
    }
    
    for i in 0..<array.count {
        let left = array[i]
        for j in (i+1)..<array.count {
            let right = array[j]
            if left + right == target {
                return (i, j)
            }
        }
    }
    
    return nil
}

let array = [0, 2, 2, 3, 4]

if let indices = findTwoSum(array, target: 4) {
    print(indices)
} else {
    print("No pair found")
}

//Optimized
func findTwoSunOptimized(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 1 else {
        return nil
    }
    
    var diffs = Dictionary<Int, Int>()
    
    for i in 0..<array.count {
        let left = array[i]
        let right = target - left
        
        if let foundIndex = diffs[right] {
            return (i, foundIndex)
        } else {
            diffs[right] = i
        }
    }
    
    return nil
}

let size = 10
let target = 10

let arrayRandom = Array.generateRandom(size: size)

var exeTime = BenchTimer.measureBlock {
    _ = findTwoSum(arrayRandom, target: target)
}

print("No optimized array => \(exeTime.formattedTime)")

var exeOpTime = BenchTimer.measureBlock {
    _ = findTwoSunOptimized(arrayRandom, target: 10)
}

print("Optimized array => \(exeOpTime.formattedTime)")

print("----- Equilibrium indixes-----")

func equilibrium(_ numbers: [Int]) -> [Int]? {
    
    guard array.count > 1 else {
        return nil
    }
    
    var indices = [Int]()
    var left = 0
    var right = 0
    let count = numbers.count
    
    for i in 0..<count {
        left = 0
        right = 0
        
        for j in 0..<i {
            left = left + numbers[j]
        }
        
        for j in i+1..<count {
            right = right + numbers[j]
        }
        
        if left == right {
            indices.append(i)
        }
    }
    
    return indices.isEmpty ? nil : indices
}

let arrayEQ = Array.generateRandom(size: size)

var timeExec01 : Double

timeExec01 = BenchTimer.measureBlock {
    _ = equilibrium(arrayEQ)
}

print("Executing time in 3 loops: \(timeExec01.formattedTime)")

//Efficient loops

func equilibriumOptimized(_ numbers: [Int]) -> [Int]? {
    
    var indices = [Int]()
    var leftSum = 0
    var sum = numbers.reduce(0,+)
    let count = numbers.count
    
    for i in 0..<count {
        sum = sum - numbers[i]
        
        if leftSum == sum {
            indices.append(i)
        }
        
        leftSum = leftSum + numbers[i]
    }
    
    return indices.isEmpty ? nil : indices
}

timeExec01 = BenchTimer.measureBlock {
    _ = equilibriumOptimized(arrayEQ)
}

print("Executing time in 1 loop: \(timeExec01.formattedTime)")
