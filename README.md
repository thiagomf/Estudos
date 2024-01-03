# Topics to study

Roteiro técnico para entrevista

Arquitetura e organização:

- Arquiteturas: MVC, MVVM-C entre outras arquiteturas que você saiba para poder perguntar
- Interface builder: .xib, viewCode e SwiftUI, como ele constrói as interfaces
- Gerenciadores de dependecias: Cocoapods, Carthage e Swift Package Manager

Swift

- O que é Swift?
- Qual a diferença entre LET e VAR:?
- Access control, já trabalhou ou utilizou em algum momento?
- Já utilizou typelias?
- Diferença entre struct e class?
- GCD em Swift, já trabalhou? Se sim para que serve?
- Com funciona o ciclo de vida de uma ViewController?
- Como funciona um delegate?
- Para que serve o ARC?
- Quais as diferenças em weak e unowned?
- O que é inout?
- O que é uma tupla?
- Como funciona uma closure?
- Qual a função do guard?
- Para que serve o final?
- O que é throws?
- Para que serve o async e await?

P.O.O e boas práticas

- O que é SOLID?
- Qual a diferença entre herança e composição?
- O que é polimorfismo?
- O que é encapsulamento?
- Explique como funciona uma sobrecarga?
- Code review, normalmente você faz?

Design patterns

- O que é Strategy?
- O que é Simple Factory?
- O que é Chain of Responsibility?
- O que é um Observable?

Testes

- O que é BDD e TDD? Qual a diferença entre os dois?
- Já utilizou XCTest? Como funciona o ciclo de testes com o XCTest?
- Com funciona uma pirâmide de testes? Explique os níveis


CI/CD

- Já utilizou C.I? Explique para que serve?
- Já utilizou C.D? Explique para que serve?

Agilidade

- Já trabalhou com Kanbam?
- Já utilizou metodologia Scrum?
- Já trabalhou em times multidisciplinar?
- Qual sua reação a um Feedback negativo?

### Interface Builder

#### Inferface builder: StoryBoard or XIB Files UIKIT

**Storyboard**: A visual representation of the app's screens where you can drag and drop UI elements and desing the layout.

**XIB files**: These are individual interfaces files that can represent a single view or component. They allow you yo desing a specific UI element separately

**View Code**: in contrast to using Interface builder, when you create views using code, you're essentially instantiating and configuring UI elements directly in your Swift files rather that visually designing them in Interface builder.

**SwiftUI**: is a declarative UI framework introduced by Apple, you can define your user interface entirely in Swift code using SwiftUI's views, modifiers, and containers.

### What is swift? 

Swift is a powerful and intuitive prgramming language. 

**It's safe**, reduces commom programming errors by design, forces coding patterns like optinoals to handle nil values, type inference, and memory management techniques like automatic reference counting (ARC).

**Modern Syntax:** it includes features like closures, tuples, generics and powerful pattern matching.

**Performance:** is designed to be fast and efficient. The performing is better tahm objctive-c. 

**Interoperability:** Swift can work seamlessly with existing Objective-C. 

**Open Source:** Apple made swift an opne source language, encouraging community involvement, contribution , and cross-platform development.

**Playgrounds:** a environment where developers can experiment with code.

### LET and VAR

**LET**, declares a constante, meaning the value assigned toit cannot be changed once it's set.

**VAR**, declares a variable, allowing the valuw to be changed or mutated.

### Acess Control

Acess Controll in swift refers to the rules and mechanisms that regulate the visibility and interaction of different parts of your codebase. It determines which parts of your code can be accessed from other code modules.

**OPEN** : the least restrictive access level. Classes marked as open can be subclassed and their methods overridden in the current module and in other modules.

**PUBLIC**: allows entities to be accessed from any source file within their defining module and from another module that imports the defining module. Public acess is less permissive than open as it doesn't allow subclassing or overriding by external modules.

**INTERNAL**: The default access level. Entities marked as internal can be accessed from any source file within the defining module but not from outside that module.

**FILE-PRIVATE**: Limits the use of an entity to its defining source file. Entities marked as 'file-private'can only be accessed from the same Swift source file where they're defined.

**PRIVATE**: The most restrictive access level. Entities marked as private are accessible only within the

```
open class MyOpenClass {
    open var openProperty = 10
    public var publicProperty = 20
    internal var internalProperty = 30
    fileprivate var filePrivateProperty = 40
    private var privateProperty = 50
}
```

**MyOpenClass** can be subclassed and its properties accessed from anywhere

**openProperty** and publicProperty can be accessed from other modules

**internalProperty** is accessible within the defining module.

**filePrivateProperty** is acessible within the file where MyOpenClass is defined.

**privateProperty** is only accessible within MyOpenClass itself.


### Differences between Protocol Oriented Programming (POP) and Object-Oriented Programming (OOP)

#### Inheritance Problems

When coming from an **Object-Oriented Programming OOP** language, inheritance is often used to share code between multiple classes. The problem is that a **class can't inherit multiple superclasses**.

Object-Oriented Programming (OOP) resolves around concept of object, which encapsulate data and behavior. In OOP, you create classes that define attributes and methods to manipulate that data. Inheritance allows classes to inherit properties and behavior from other classes

```
class MainViewController: UIViewController {

  func setupProfilePicture() { … }

  func onProfilePictureTapped() { … }
}

class MyViewController: MainViewController {

  func viewDidLoad() {

    super.viewDidLoad()

    setupProfilePicture()
  }
}
```

*But if you realize that you need an UITABLEViewController or UIViewController?*

#### Here comes Composition

In this case, we could imagine a ProfileManager class that provides all the needed methods to set up the profile pictures image and interact with it.

```
class ProfileManager {

  func setupProfilePicture() { … }

  func onProfileTapped() { … }
}

class MyViewController: UIViewController {

  var profileManager: ProfileManager()

  func viewDidLoad() {

    super.viewDidLoad()

    profileManager.setupProfilePicture()
  }
}

class AnotherViewController: UITableViewController {

  var profileManager: ProfileManager()

  func viewDidLoad() {

    super.viewDidLoad()

    profileManager.setupProfilePicture()
  }  
}
```

> You can see how that could get complicated. You need to explicity reference the intermediate object ProfileManager each time.

On the other hander, **Protocol - Oriented Programming POP** emphansizes the use of protocols to define a blueprint of methods, properties and other requirements that a type should adopt. Protocols can be seen as contracts that define a set of functionalities without specifiying how they should be implemented. Types (classes, structures, or enumerarions) can then conform to theses protocols by providing implementations for the requiredfunctionalities. POP encourages composition over inheritance and enable more flexibility and code reuse by allowing types to conform to multiple protocols.

```
protocol Flyer {

  func fly()

}

extension Flyer {

  func fly() {

    print("I can Fly")

  }
}
```

### Optional Chaining

Optional chaining is a process for querying and calling properties methods, and subscripts on an optional that might currently be nil.

**Optional Chaining as an Alternative to Forced Unwrapping**

```
class Person {
    var residence: Residence?
}


class Residence {
    var numberOfRooms = 1
}

let john = Person()

//this triggers a runtime error
let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."

//-----------------------------------------------------

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
```

## Diference between Value Type and Reference Type
In swift there are two categories of types: value types and reference types.

A value type instance keeps a unique copy of its data: **Struct** or an **Enum**

*Use a **value type** when you want copies to have an independent state, and the data will be used in code across multiple threads.*

**Array, String and Dictionary** are all value types.

A reference type, shares a single copy of its data: **Class, Function, Closure**

*In swift, **reference type** instances share a single copy of their data, so that every new instance will point to the same address in memory.*

Example:

### ValueType

#### Struct
```
struct Car {
    let brand: String
    var model: String
}

var golf = Car(brand: "Volkswagen", model: "Golf")

let polo = golf

golf.model = "Golf 2019"

print(golf) //prints: brand: Volkswagen model: Golf 2019
print(polo) //prints: brand: Volkswagen model: Golf

```

#### Enum
```
enum Language {
    case italian
    case english
}

var italian = Language.italian

let english = italian

italian = .english

print(italian) //prints: english
print(english) //prints: italian
```

#### Tuple
```
var ironMan = ("Tony", "Stark")
let parent = ironMan

ironMan.0 = "Alfred"

print(ironMan) //prints: (Alfred, Stark)
print(parent) //prints: (Tony, Stark)
```

### Reference Type

#### Class

```
class Dog: CustomStringConvertible {

    var age: Int
    var weight: Int

    var description: String {
        return "Age \(age) - Weight \(weight)"
    }

    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
}


let doberman = Dog(age: 1, weight: 70)

let chihuahua = doberman

doberman.age = 2

chihuahua.weight = 10

print(doberman) // Age 2 - Weight 10
print(chihuahua) // Age 2 - Weight 10

print(address(of: doberman))
print(address(of: chihuahua))

if doberman === chihuahua { print("Same memory") }
```

### Mutability

The mutability of values types let's you specifically choose what variables can be modified or not.

If you create a struct constant, you can't change the values of its properties, even though the values themselves might be variable.

**Example:** Value Type

```
struct Bike {
    let radius: Int
    var km: Float
}

let bike = Bike(radius: 22, km: 34.5)
bike.km = 45.0 //not working because bike is a let

var bike2 = Bike(radius: 22, km: 34.5)
bike2.km = 44.0 //can work because bike2 is a var
```
On the other hand, a **Class** lets you change them because you are referencing the memory address of the object.

```
class Motorbike {
    let radius: Int
    var km: Float

    init(radius: Int, km: Float) {
        self.radius = radius
        self.km = km
    }
}

let motorbike = Motorbike(radius: 22, km: 34.5)
motorbike.km += 1

print(motorbike.km)
```

## Circular Reference

A **circular reference**, also know as a **retain cycle**, occurs when two or more objects hold a strong reference to each other, preventing the system from **deallocating** memory even whem they're no longer needed. This situation can happen when using **closures** or when two objects have properties that hold references to each other strongly.

**Example strong reference:**

```
class ClassA {
    var classBObject: ClassB?
}

class ClassB {
    var classAObject: ClassA?
}

```

In this scenario, **objectA** has a **reference** to **objectB** and **objectB** has a **reference** to **objectA**, creating a circular reference. Even if you set objectA and objectB to nil, their reference count will not becoome zero because they are still holding references to each other.

To break this retain cycle, you can use weak or unowned references in Swift.

```
class ClassA {
    weak var classBObject: ClassB?
}

class ClassB {
    weak var classAObject: ClassA?
}
```

By using **weak**, the references between **ClassA** and **ClassB** become non-owning references, allowing the objects to be deallocated.

### Category

The concept of category is more commonly referred to as "extensions" or "extending types"

Extensions allow you add new functionality to an existing class, structure, enumeration, or protocol type, without needing to modift it's original implementation. 

```
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 6
print(number.isEven) // Prints: true

```

Extensions can also be used to conform existing types to protocols:

```
protocol CustomProtocol {
    func doSomething()
}

// Extend existing types to conform to the protocol
extension Int: CustomProtocol {
    func doSomething() {
        print("Int type implementing CustomProtocol")
    }
}

let someInt: Int = 5
someInt.doSomething() // Prints: "Int type implementing CustomProtocol"
```


### Overload & Override

#### Overload

The method overloading allows a class to have a multiple methods with the same name but different parameters or arguments types.

```
class Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

```

#### Override

The method occurs when a subclass provides a new implementation for a method that is already defined in it's superclass.
The method in the subclass has the same signature (method name and parameters) as the one in the superclass, essentially replacing the inherited method's behavior with a new implementation.

```
class Vehicle {
    func drive() {
        print("The vehicle is being driven.")
    }
}

class Car: Vehicle {
    override func drive() {
        print("The car is being driven.")
    }
}
```



