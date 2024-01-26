let arraySizes = [10, 100, 1000, 10000, 100000]

for size in arraySizes {
    
    let array = Array<Int>(repeating: 0, count: size)
    
    let execTime = BenchTimer.measureBlock {
        _ = array.startWithZero()
    }
    
    print(String(format: "Size %d -> %@", array.count, execTime.formattedTime))
}

let dictSizes = [100, 1000, 10000]

for size in dictSizes {
    
    let dictionary = Dictionary.generate(size: size)
    
    let randomKey = String(Int.random(in: 0..<size))
    
    let execTime = BenchTimer.measureBlock {
        _ = dictionary[randomKey]
    }
    
    print(String(format: "Size %d -> %@", dictionary.count, execTime.formattedTime))
}
