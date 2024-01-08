import UIKit

//MARK: Acess Control

open class MyOpenClass {
   
    open var openProperty = 10
    public var publicProperty = 10
    internal var internalProperty = 10
    fileprivate var filePrivateProterty = 10
    private var privateProperty = 50
}

class subClass: MyOpenClass {
    
    func openProperty() {
        print("Open -> \(openProperty)")
        openProperty = 20
        print("Open -> \(openProperty)")
    }
    
    func publicChangeValue() {
        print("Public -> \(publicProperty)")
        publicProperty = 20
        print("Public -> \(publicProperty)")
    }
    
    func internalChangeValue() {
        print("Internal -> \(internalProperty)")
        internalProperty = 20
        print("Internal -> \(internalProperty)")
    }
    
    func filePrivateValue() {
        print("Internal -> \(filePrivateProterty)")
        filePrivateProterty = 20
        print("Internal -> \(filePrivateProterty)")
    }
    
//    func privateValue() {
//        print("Private -> \(privateProperty)")
//        privateProperty = 20
//        print("Internal -> \(privateProperty)")
//    }
}

let variable = subClass()

variable.openProperty()
variable.publicChangeValue()
variable.internalChangeValue()
variable.filePrivateValue()

//MARK: Encapsulamento

class BankAcount {
    
    private var balance: Double = 0.0
    
    public func deposit(value : Double) {
        
        balance += value
    }
    
    public func retirada(value: Double) {
        
        if balance >= value {
            
            balance -= value
        } else {
            print("Dinheiro insuficiente")
        }
    }
    
    public func showMeMyMoney() -> Double {
        return balance
    }
}

let user = BankAcount()
user.showMeMyMoney()
user.deposit(value: 10000)
user.retirada(value: 5000)
user.showMeMyMoney()

//MARK: Polimorfismo

class Vehicle {
    func drive() {
        print("A vehicle can driving")
    }
}

class Airplane: Vehicle {
    
    override func drive() {
        print("A airplane can fly")
    }
}

class Bicicle: Vehicle {
    
    override func drive() {
        print("A bicicle can run")
    }
}

let airplane: Vehicle = Airplane()
airplane.drive()
let bicicle: Vehicle = Bicicle()
bicicle.drive()

//------ Using protocol

protocol Fly {
    func flying()
}

class Bird : Fly {
    func flying() {
        print("A bird can fly")
    }
}

class Butterfly: Fly {
    func flying() {
        print("A butterfly can fly")
    }
}

func message(aniamls: Fly) {
    aniamls.flying()
}

let bird : Fly = Bird()
let butter: Fly = Butterfly()
butter.flying()

//MARK: Final

class NotasEscolares {
    
    func materia() -> String {
        return "Geografia \n"
    }
    
    final func mostrarnota(aluno: String, nota: Int) {
        materia()
        print("O aluno \(aluno) tirou \(nota)")
    }
}

class Matematica: NotasEscolares {
    
    override func materia() -> String {
        return "Matematica"
    }
    
}

let aluno = NotasEscolares()
aluno.mostrarnota(aluno: "Thiago", nota: 8)

let aluno01 = Matematica()
aluno01.mostrarnota(aluno: "Thiago", nota: 5)

//MARK: INOUT

func incrementarnota10Aluno(_ nota: inout Int) {
    nota += 10
}

var nota = 0
incrementarnota10Aluno(&nota)
print(nota)

func adicionarSobrenomeAluno(nome: String, _ nomeCompleto: inout String) {
    nomeCompleto = nome + nomeCompleto
}

var nomeCompleto = " Machado"

adicionarSobrenomeAluno(nome: "Thiago", &nomeCompleto)

print(nomeCompleto)

//MARK: Generics

//Functions
func changeValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 1
var b = 2
changeValues(&a, &b)

print(a)
print(b)

//Struct

struct Queue<T> {
    
    var elements: [T] = []
    
    mutating func addElemt(_ element: T) {
        elements.append(element)
    }
    
    mutating func removeElem() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
}

var intQueue = Queue<Int>()

intQueue.addElemt(2)
intQueue.addElemt(1)
intQueue.addElemt(0)
intQueue.removeElem()

// Associated Types

protocol Printable {
    associatedtype PrintableItem
    var description: String { get }
    func printItem(_ item : PrintableItem)
}

struct Printer<T>: Printable {
  
    typealias PrintableItem = T
    
    var description: String {
        return "A description is \(PrintableItem.self)"
    }
    
    func printItem(_ item: PrintableItem) {
        print("Variable items is: \(item)")
    }
}

let numberPrinter = Printer<Int>()
numberPrinter.printItem(2)
numberPrinter.description

struct Document: Printable {
    
    typealias PrintableItem = String
    
    var description: String {
        return "A description is String"
    }
    
    
    func printItem(_ item: String) {
        print("Escreva uma mensagem: \(item)")
    }
}

let document = Document()
document.description
document.printItem("Olá")

//MARK: GUARD

let order: [String: Any] = ["id": 1, "items": ["arroz", "feijao", "carne"]]

func processOrder(_ order: [String: Any]) {
    guard let orderID = order["id"] as? Int else { print("Invalid order")
        return
    }
    guard let item = order["items"] as? [String], !item.isEmpty else {
        print("Invalid order: Missing or empty items list")
        return
    }
    print("Ordem executada com sucesso: \(orderID) -> \(item)")
}

processOrder(order)

//MARK: Superclasse e Subclasse

class Doce {
    
    var nomeComida: String
    let tipo = "Doce"
    
    init(nome: String) {
        nomeComida = nome
    }
    
    func mensagem() {
        print("A comida é \(tipo) e seu nome é \(nomeComida)")
    }
}
    

class Comida: Doce {
    
    init(nomeComida: String) {
        super.init(nome: nomeComida)
    }
}


let comida = Comida(nomeComida: "pudim")
comida.mensagem()

//MARK: Optional

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
print(john.residence?.numberOfRooms ?? 0)

if let rooms = john.residence?.numberOfRooms{
    print("Existe \(rooms) numeros")
} else {
    print("Não existe rooms")
}

john.residence = Residence()

if let rooms = john.residence?.numberOfRooms{
    print("Existe \(rooms) numeros")
} else {
    print("Não existe rooms")
}

//MARK: Value Type and Reference Type

//Value Type

struct Car {
    var ano: Int
    var brand: String
}

var corsa: Car = Car(ano: 1986, brand: "Corsa")

let golf = corsa

corsa.brand = "Golf"

print(corsa.brand)
print(golf.brand)

//Reference Type

class Dog: CustomStringConvertible {
    
    var age: Int
    var weight: Int
    
    var description: String {
        return "Age \(age) - Weight \(weight)"
    }
    
    init(age:Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
}

let doberman = Dog(age: 1, weight: 70)

let chihuahua = doberman

doberman.age = 2
chihuahua.age = 5

print(doberman)
print(chihuahua)

if doberman === chihuahua { print("Same reference memory") }

//MARK: Mutability
//Value Type
struct Bike {
    var brand: String
    let km: Int
}

let bike1 = Bike(brand: "Teste", km: 50)
//bike1.brand = "teste02" not working because value type is a constant

var bike2 = Bike(brand: "Teste", km: 20)
bike2.brand = "Teste02"

//Reference Type

class Motorbike {
    
    let brand: String
    var km: Int
    
    init(brand: String, km: Int) {
        self.brand = brand
        self.km = km
    }
}

let honda: Motorbike = Motorbike(brand: "Honda", km: 10)
honda.km = 40
//honda.brand = "Kasin" because is let inside the class

