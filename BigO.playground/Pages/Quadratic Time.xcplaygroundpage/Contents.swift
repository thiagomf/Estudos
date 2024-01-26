import Foundation

func multTable(_ size: Int) -> [Int] {
    
    guard size > 0 else {
        return [Int]()
    }
    
    var table = [Int]()
    let array = [Int](1...size)
    
    for row in 0..<size {
        for column in 0..<size {
            let val = array[row] * array[column]
            table.append(val)
        }
    }
    
    return table
}

func multTableOptimized(_ size: Int) -> [Int] {
    guard size > 0 else {
        return [Int]()
    }
    
    var table = [Int](repeating: 0, count: size*size)
    let array = [Int](1...size)
    
    for row in 0..<size {
        for column in 0..<size {
            let val = array[row] * array[column]
            table[row * size + column] = val
        }
    }
    
    return table
}

func multTable2D(_ size: Int) -> [[Int]] {
    
    var table = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    let array = [Int](1...size)
    
    for row in 0..<size {
        
        for column in 0..<size {
            
            let val = array[row] * array[column]
            table[row][column] = val
        }
    }
    
    return table
}

func multTableMatrix(_ size: Int) -> Matrix<Int> {
    
    var table = Matrix(rows: size, columns: size, repeating: 0)
    
    let array = [Int](1...size)
    
    for row in 0..<size {
        for column in 0..<size {
            
            let val = array[row] * array[column]
            table[row, column] = val
        }
    }
    
    return table
}

//: Multiplication Table - O(n^2)
let sizes = [10, 20, 30]


print("\nAverage execution time for multiplication table")
print("-----------------------------------------------")

for i in 0..<sizes.count {
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTable(size)
    }
    
    print(String(format: "Size %d -> %@", size, execTime.formattedTime))
}

print("\nAverage execution time for multiplication table optimized")
print("---------------------------------------------------------")

for i in 0..<sizes.count {
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTableOptimized(size)
    }
    
    print(String(format: "Size %d -> %@", size, execTime.formattedTime))
}

print("\nAverage execution time for multiplication table with 2D array")
print("-------------------------------------------------------------")

for i in 0..<sizes.count {
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTable2D(size)
    }
    
    print(String(format: "Size %d -> %@", size, execTime.formattedTime))
}

print("\nAverage execution time for multiplication table with custom Matrix")
print("------------------------------------------------------------------")

for i in 0..<sizes.count {
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTableMatrix(size)
    }
    
    print(String(format: "Size %d -> %@", size, execTime.formattedTime))
}
