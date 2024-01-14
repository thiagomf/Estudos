//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
for i in 1...3 {
    print(i)
}

var foo: Float = 32
var bar: Double = 32

//foo = bar
//bar = foo

let crew = NSMutableDictionary()
crew.setValue("Kryten", forKey: "Mechanoid")
print(crew.count)

let name = "Simon"

switch name {
case "Simon":
    fallthrough

case "Malcom", "Zoe", "Kaylee":
    print("Crew")

default:
    print("Not crew")
}

func greet(names: String...) {
    print("Criminal masterminds:", names.joined(separator: ", "))
}

greet(names: "Malcolm", "Kaylee", "Zoe")

let foo2 = 0x10
print(foo2)

let possibleNumber = "1701"
let convertedNumber = Int(possibleNumber)
print("\(convertedNumber)")

var i = 1

mainLoop: repeat {
    i += 2

    switch i % 2 {
    case 0:
        break mainLoop
    default:
        break mainLoop
    }
} while true

print("Complete!")

func sum(numbers: Int...) -> Int {
    var result = 0

    for number in numbers {
        result += number
    }

    return result
}

let result = sum(numbers: 1, 2, 3, 4, 5)
