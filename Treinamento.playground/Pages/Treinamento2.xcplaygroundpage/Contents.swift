//MARK: ARC

import Foundation
import UIKit

class Person {
    var dog: Dog?
}

class Dog {
    weak var owner: Person?
    deinit {
        print("Dog deinitialized")
    }
}

var john: Person? = Person()
var fido: Dog? = Dog()

john?.dog = fido
fido?.owner = john

john = nil
fido = nil


class Customer {
    
    var creditCard: CreditCard?
    
    deinit{
        print("Customer deinitialized")
    }
}

class CreditCard {
    
    unowned let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
    }
    
    deinit {
        print("CreditCard deinitialized")
    }
}

var johnny: Customer? = Customer()
johnny?.creditCard = CreditCard(customer: johnny!)
johnny = nil

//MARK: Retail Cycle

class ClasseA {
    
    weak var classeB: ClasseB?
    
    deinit {
        print("Class A deinitializated")
    }
}

class ClasseB {
    
    weak var classeA: ClasseA?
    
    deinit {
        print("Class B deinitializated")
    }
}

var clA: ClasseA = ClasseA()
//clA.classeB = ClasseB()
var clB: ClasseB = ClasseB()
//clB.classeA = ClasseA()

protocol Cadastro {
    func addNome(nome:String)
    func addEndereco(end: String)
}

extension Cadastro {
    func addNome(nome: String) {
        print("Seu nome: \(nome)")
    }
    
    func addEndereco(end: String) {
        print("Seu endereço: \(end)")
    }
}

struct Portifolio: Cadastro {
    var nome: String
    var end: String
    
    func showCadastro() {
        addNome(nome: nome)
        addEndereco(end: end)
    }
}

let update = Portifolio(nome: "Thiago", end: "R artur prado")

update.showCadastro()

//MARK: Extension

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

print(34.isEven)

//MARK: Overload and Override

//Overload

class Calculator {
    
    func sum(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sum(a: Double, b: Double) -> Double {
        return a + b
    }
}

let resul = Calculator()
let resultInt = resul.sum(a: 4, b: 5)
let resultDou = resul.sum(a: 4.5, b: 3.5)

//Override

protocol CustomProtocol {
    
    func printMensage()
}

class DefaultClass: CustomProtocol {
    
    func printMensage() {
        print("Mensagem do procolo")
    }
}

class RealClass: DefaultClass {
    
    override func printMensage() {
        print("Real mensage")
    }
}

let printMSN = RealClass()
printMSN.printMensage()

//MARK: CGD

let concurrentQueue = DispatchQueue.global()

concurrentQueue.async {
    print("Concurrent task")
}

let serialQueue = DispatchQueue(label: "com.example.serialQueue")

serialQueue.sync {
    print("Serial Task")
}

func syncWork() {
    
    let northzone = DispatchQueue(label: "perform_task_with_team_north")
    let southzone = DispatchQueue(label: "perform_task_with_team_south")
    
    northzone.sync {
        for number in 1...3 { print("North \(number)")}
    }
    southzone.sync {
        for number in 1...3 { print("South \(number)")}
    }
}

syncWork()

func asyncWork() {
    
    let northzone = DispatchQueue(label: "perform_task_with_team_north")
    let southzone = DispatchQueue(label: "perform_task_with_team_south")
    
    northzone.async {
        for number in 1...3 { print("North Async \(number)")}
    }
    southzone.async {
        for number in 1...3 { print("South Async \(number)")}
    }
}

asyncWork()

//MARK: Async/Await

enum CountError: Error {
    case outOfRange
}

func counterData() async throws -> String {
    for number in 1...10 {
        guard number < 10 else {
            throw CountError.outOfRange
        }
        print("Processing \(number)")
    }
    return "Count Finished"
}

func counterDataTo20() async throws -> String {
    for number in 1...20 {
        guard number < 21 else {
            throw CountError.outOfRange
        }
        print("Processing \(number)")
    }
    return "Count Finished"
}


func processCounter10() async {
    do {
        let data = try await counterData()
        print(data)
    } catch CountError.outOfRange {
        print("This process is overload")
    } catch {
        print("Unknow error")
    }
}

func processCounter20() async {
    do {
        let data = try await counterDataTo20()
        print(data)
    } catch CountError.outOfRange {
        print("This process is overload")
    } catch {
        print("Unknow error")
    }
}

Task {
    await processCounter10()
    await processCounter20()
}

//MARK: Tuples

let name = (nome: "Thiago", sobrenome: "Machado")
print(name.nome + " " + name.sobrenome)

//MARK: Throws

enum ErrorPrint: Error {
    case noDocuments
    case emptyFile
}

func readFiles(code: Int) throws -> String {
    switch code {
        case 1: throw ErrorPrint.noDocuments
        case 2: throw ErrorPrint.emptyFile
        default: return "Readed file"
    }
    
}

do {
    let response = try readFiles(code: 3)
    print(response)
} catch ErrorPrint.noDocuments {
    print("There is no documents")
} catch ErrorPrint.emptyFile {
    print("The file is empty")
}


enum Authenticator: Error {
    case loginError
    case codeError
}

func loginAplication(login: String, code: String) throws -> String {
    
    guard login == "admin" else {
        throw Authenticator.loginError
    }
    
    guard code == "123" else {
        throw Authenticator.codeError
    }
    
    return "Login Sucess"
}

do {
    let response = try loginAplication(login: "a1dmin", code: "123")
    print("Login Sucess")
} catch Authenticator.loginError {
    print("Your login is incorrect")
} catch Authenticator.codeError {
    print("Your code is incorrect")
}

//MARK: Closure

let teste = {
    return "Isso é um teste"
}

print(teste())

let numbers = [1,2,3,4]
let multiplationNumber = numbers.map { $0 * $0 }
print(multiplationNumber)


