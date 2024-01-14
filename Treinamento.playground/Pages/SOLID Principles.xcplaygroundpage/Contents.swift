//: [Previous](@previous)

import Foundation

//MARK: SOLID

//Single Responsability Principle - a class or module should have only one reason to change

//Wrong example

class User {
    
    func login(user: String, password: String) {
        if (user.isEqual("admin") && password.isEqual("123")) {
            print("It was sucessful login")
        } else {
            print("The login attempt was unsuccessful")
        }
    }
    
    func updateUserProfile() {
        let name = "Thiago"
        let lastName = "Machado"
        print("It was updated user profile \(name) \(lastName)")
    }
}

let showUser = User()
showUser.login(user: "admin", password: "123")
showUser.updateUserProfile()

//Right example

class Login {
    func login(user: String, password: String) {
        if (user.isEqual("admin") && password.isEqual("123")) {
            print("It was sucessful login")
        } else {
            print("The login attempt was unsuccessful")
        }
    }
}

class Profile {
    func updateUserProfile() {
        let name = "Thiago"
        let lastName = "Machado"
        print("It was updated user profile \(name) \(lastName)")
    }
}

let loginUser = Login()
loginUser.login(user: "admin", password: "123")

let profileUser = Profile()
profileUser.updateUserProfile()

//Open/Closed Principle - should be open for extension but closed for modification

protocol Shape {
    func area() -> Double
}

struct Circule: Shape {
    
    let radius: Double
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

struct Retangle: Shape {
    
    let width: Double
    let height: Double

    func area() -> Double {
        return width * height
    }
}

struct AreaCalculator {
    static func totalArea(shapes: [Shape]) -> Double {
        return shapes.reduce(0) { $0 + $1.area() }
    }
}

let circle = Circule(radius: 2.0)
let retangle = Retangle(width: 3.0, height: 4.0)
let shape: [Shape] = [circle, retangle]
let result = AreaCalculator.totalArea(shapes: shape)
print("Total area protocol Module: ", result)

//Liskov Substitution Principle - objects of a superclass should be replaceble with objects of its subclasses without affecting the correctness of the program

//Base Shape class
class ShapeCalculation {

    func area() -> Double {
        return 0.0
    }
}

class RetangleClass: ShapeCalculation {
    
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func area() -> Double {
        return width * height
    }
}

class SquareClass: RetangleClass {
    
    init(singleLength: Double) {
        super.init(width: singleLength, height: singleLength)
    }
}

func calculateTotalArea(shapes: [ShapeCalculation]) -> Double {
    return shapes.reduce(0) { $0 + $1.area() }
}

let rectangle = RetangleClass(width: 5.0, height: 4.0)
let square = SquareClass(singleLength: 6.0)

let resulShapeClass = calculateTotalArea(shapes: [rectangle, square])
print("Total area CLASS inhertance: ", resulShapeClass)

// Interface segregation principle (ISP) - clients should not be forced to depend on interfaces they don't use

// Wrong way
protocol Printable {
    func printDocument()
}

protocol Scannable {
    func scanDocument()
}

class Machine: Printable, Scannable {
    
    func printDocument() {
        print("Printed")
    }
    
    func scanDocument() {
        print("Scanned")
    }
}

//Right way - applying interface segregation principle

protocol Printer {
    func printDocument()
}

extension Machine: Printer {}

class PrinterClient {
    
    let printer: Printer
    
    init(printer: Printer) {
        self.printer = printer
    }
    
    func executePrint() {
        printer.printDocument()
    }
}

let machinePrinter = PrinterClient(printer: Machine())
machinePrinter.executePrint()

// Dependency Inversion Principle (DIP) - Abstractions (interfaces, protocols) should not depend on details; details should depend on abstractions.

// Messenger protocol defining the behavior for sending messages
protocol Messenger {
    func sendMessage(message: String)
}

// Concrete implementation of the Messenger protocol
class EmailService: Messenger {
    
    func sendMessage(message: String) {
        
        print("Sended message by email -> \(message)")
    }
    
}

class SMSService: Messenger {
    
    func sendMessage(message: String) {
        
        print("Sended message by sms -> \(message)")
    }
}

// MessageService that depends on the Messenger protocol
class MessageService {
    
    let typeService: Messenger
    
    init(typeService: Messenger) {
        self.typeService = typeService
    }
    
    func sendMensage(mensage: String) {
        typeService.sendMessage(message: mensage)
    }
}

let sms = SMSService()
let email = EmailService()

let messageSMS = MessageService(typeService: sms)
messageSMS.sendMensage(mensage: "Olá")

let messageEMAIL = MessageService(typeService: email)
messageEMAIL.sendMensage(mensage: "Hi")

//: [Next](@next)
