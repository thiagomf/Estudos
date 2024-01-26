func factorial(n : Int) -> Int {
    
    guard n >= 1 else {
        return 1
    }
    
    return n * factorial(n: n - 1)
}

let number = factorial(n: 10)

func powerSum(n: Int) -> Int {
    
    guard n >= 0 else {
        return 0
    }
    
    return n + powerSum(n: n - 1)
    
}

print("-------Factorial---------------------------\n")

var timeFac = BenchTimer.measureBlock {
    let number2 = factorial(n: 20)
}

print("Factorial: \(timeFac)\n")

print("-------Power Sum---------------------------\n")

var time = BenchTimer.measureBlock {
    let number2 = powerSum(n: 20)
}

print("PowerSumTime: \(time)\n")
