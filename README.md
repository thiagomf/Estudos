# Topics to study

Roteiro técnico para entrevista

Arquitetura e organização:

- Arquiteturas: MVC, MVVM-C entre outras arquiteturas que você saiba para poder perguntar
- Interface builder: .xib, viewCode e SwiftUI, como ele constrói as interfaces
- Gerenciadores de dependecias: Cocoapods, Carthage e Swift Package Manager

Swift

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

## Interface Builder

#### Inferface builder: StoryBoard or XIB Files UIKIT

**Storyboard**: A visual representation of the app's screens where you can drag and drop UI elements and desing the layout.

**XIB files**: These are individual interfaces files that can represent a single view or component. They allow you to design a specific UI element separately

**View Code**: in contrast to using Interface builder, when you create views using code, you're essentially instantiating and configuring UI elements directly in your Swift files rather that visually designing them in Interface builder.

**SwiftUI**: is a declarative UI framework introduced by Apple, you can define your user interface entirely in Swift code using SwiftUI's views, modifiers, and containers.

## What is swift? 

Swift is a powerful and intuitive programming language. 

**It's safe**, reduces commom programming errors by design, forces coding patterns like optionals to handle nil values, type inference, and memory management techniques like automatic reference counting (ARC).

**Modern Syntax:** it includes features like closures, tuples, generics and powerful pattern matching.

**Performance:** is designed to be fast and efficient. The performing is better tahm objctive-c. 

**Interoperability:** Swift can work seamlessly with existing Objective-C. 

**Open Source:** Apple made swift an opne source language, encouraging community involvement, contribution , and cross-platform development.

**Playgrounds:** a environment where developers can experiment with code.

## LET and VAR

**LET**, declares a constant, meaning the value assigned to it cannot be changed once it's set.

**VAR**, declares a variable, allowing the value to be changed or mutated.

## Acess Control

Acess Controll in swift refers to the rules and mechanisms that regulate the visibility and interaction of different parts of your codebase. It determines which parts of your code can be accessed from other code modules.

**OPEN** : the least restrictive access level. Classes marked as open can be subclassed and their methods overridden in the current module and in other modules.

**PUBLIC**: allows entities to be accessed from any source file within their defining module and from another module that imports the defining module. Public acess is less permissive than open as it doesn't allow subclassing or overriding by external modules.

**INTERNAL**: The default access level. Entities marked as internal can be accessed from any source file within the defining module but not from outside that module.

**FILE-PRIVATE**: Limits the use of an entity to its defining source file. Entities marked as 'file-private'can only be accessed from the same Swift source file where they're defined.

**PRIVATE**: The most restrictive access level. Entities marked as private are accessible only within the enclosing declaration and aren't avaliable outside that scope.

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

**openProperty** and **publicProperty** can be accessed from other modules

**internalProperty** is accessible within the defining module.

**filePrivateProperty** is acessible within the file where MyOpenClass is defined.

**privateProperty** is only accessible within MyOpenClass itself.

## Final

The word final is used to declare that a class, method or property cannot be overriden or subclassed.

#### Final Classes

Declaring a class as final means it cannot be subclassed. Any attempt.to subclass a final class will result in a compilation error.

```
final class FinalClass {
    // Class implementation
}
```

#### Final Methods

Declaring a method within a class as final menas that subclasses cannot override tha method

```
class ParentClass {
    final func doSomething() {
        // Method implementation
    }
}
```

#### Final Properties

Properties can also be marked as final within a class to prevent overriding by subclasses.

```
class BaseClass {
    final var value: Int = 10
}

```

**Using final with inheritance:**

```
class BaseClass {
    final func doSomething() {
        print("Base class method")
    }
}

class SubClass: BaseClass {
    // Attempting to override a final method will result in a compilation error
    // override func doSomething() { ... }
}
```

Can I inheritance a final class ?
NO. When a class is declared as final, it explicitly prohibits any subclassing.

```
final class FinalClass {
    // Class implementation
}

// This will cause a compilation error because FinalClass is declared as final
class Subclass: FinalClass {
    // Subclass implementation
}
```

## INOUT

Is used to pass parameters by reference to a function, allowing the function to modify the original value of the parameter. When a parameter is passed with inout keyword, it allows the function to modify the original value, and any changes made to the parameter inside the function are reflected in the original variable outside the function.

```
func someFunction(_ parameter: inout Int) {
    // Modify the parameter value
    parameter += 1
}

var value = 10
someFunction(&value) // Pass the variable with the "&" before the variable name

print(value) // The value is modified to 11
```

## Guard

Guard helps in writing defensive code by handling the conditions that must be met before executiong the rest of the code block, contributing to safer and more readable Swift code.

> It's particularly useful for checking conditions that must be true for the excution of the rest of the code block.

**Checking conditions**: is used to check conditions that, if not met, result in an early exist from the current code lock using. **RETURN, THROW, BREAK, CONTINUE**.

**Unwrapping Optionals**: It's commonly used to unwrap optionals and ensure that optional bindings have a value. If the condition fails the code inside the **else** block is executed.

**Early Exit**: It ensures that the rest of the code executes only when certain conditions are met, reducing nested code block and improving readability.


## Differences between Protocol Oriented Programming (POP) and Object-Oriented Programming (OOP)

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

You can inheritance 2 classes at the same subclass.

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

## Superclass and SubClass

Superclass refers to the class that another class (Subclass) inherits from. This inheritance forms a hierarchy where the subclass inherits properties, methods, and other characteristics from its superclass.

**Example**:

```
// Superclass
class Vehicle {
    var speed: Double
    
    init(speed: Double) {
        self.speed = speed
    }
    
    func move() {
        print("Moving at \(speed) mph")
    }
}

// Subclass inheriting from Vehicle
class Car: Vehicle {
    var brand: String
    
    init(speed: Double, brand: String) {
        self.brand = brand
        super.init(speed: speed) // Calling superclass initializer
    }
    
    func honk() {
        print("Honk honk!")
    }
}
```

**Vehicle** is the superclass.

**Car** is a s subclass.

**Subclasses** inherit properties, methods, and functionalities from their superclass.

**Initialization**: Subclasses often call the superclass's initializer (super.init) to ensure that both the subclass's and superclass's properties are properly initialized.

**Overriding**: subclasses can override superclass methods and properties to provide their own implementation.

## Optional Chaining

Optional chaining is a feature that allows you to safely access properties, methods, and subscripts of an optional that might be **NIL**.

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

## Mutability

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

## ARC

Automatic Reference Counting (ARC), is a memory management mechanism used by Swift and Objective C to automatically manage memory allocation and deallocation for objects.

It keeps track of how many references there are to a particular instance of a class and automatically frees up memory when an object is no longer referenced.

#### Reference Counting

ARC tracks the number of strong references to an object. When an object is created, it has a reference count of 1. Each time a new strong reference is made to the object, the reference count increases by 1. When a reference goes out of score or is set to nil, the reference count decreases by 1.

#### Automatic Memory Management

ARC automatically handles memory management for you. When an object's reference count reaches zero meaning there are no more strong reference to it, ARC deallocates the memory occupied by the objects and frees up resources.

#### Strong References

By defaults, Swift uses strong references. These keep a strong hold on an object, meaning the object remains in memory as long as there's at least one strong reference to it.

#### Retain Cycles

Care should be taken to avoid retain cycles, where two or more objects hold strong references to each other, preventing them from being deallocated. This can be resolved by using weak or unowned references, or by breaking the cycle using closures with capture lists.

#### Weak and Unowned References

Swift provices weak and unowned to prevent retain cycles.

##### WEAK 

Allow the reference object become nil when the referenced object is deallocated

**Example:**

Use weak reference when the referenced object can become nil at some point during it's lifetime.

```
class Person {
    var dog: Dog?
}

class Dog {
    weak var owner: Person?
}

var john: Person? = Person()
var fido: Dog? = Dog()

john?.dog = fido
fido?.owner = john

// Breaking the strong reference cycle
john = nil
fido = nil
```

##### UNOWNED 

Assume that the referenced object will never be 'nil' during the lifetime of the referencing object.

**Example:**

```
class Customer {
    var creditCard: CreditCard?
    deinit {
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

var john: Customer? = Customer()
john?.creditCard = CreditCard(customer: john!)
john = nil // Deallocates Customer and CreditCard
```

#### Memory Management for Value Types

Arc is for managing reference types (classes). Value types, such as structs and enums don't use reference counting and are managed differently - they are copied when passed around rather than referenced.

## Circular Reference or Retain Cycles

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

## Category / Extensions / Extending Types

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


## Overload & Override

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

### Override

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

## GCD

Sometimes we are trying to perform multiple tasks at the same time,that time most of the developer facing applcationg hang or freezing issue. That's why **we are using GCD, to manage multiple task at the same time.**

**Concurrenct** - It's starting multiple tasks at the same time, but not garantee for the finish at same time. It's can finish any order.

**Serial** - It's executing one task at a time.

```
// Get a reference to the global concurrent queue
let concurrentQueue = DispatchQueue.global()

// Perform a task asynchronously on the concurrent queue
concurrentQueue.async {
    // This code will run concurrently with other tasks
    print("Concurrent task")
}

// Get a reference to a serial queue
let serialQueue = DispatchQueue(label: "com.example.serialQueue")

// Perform a task synchronously on the serial queue
serialQueue.sync {
    // This code will execute in a serial manner
    print("Serial task")
}
```


#### Sync vs Async

**Sync** - When a work item is executed synchronously with the sync method, the program waits until execution finishes before the method call returns.

```
func syncWork(){
        let northZone = DispatchQueue(label: "perform_task_with_team_north")
        let southZone = DispatchQueue(label: "perform_task_with_team_south")
        
        northZone.sync {
            for numer in 1...3{ print("North \(numer)")}
        }
        southZone.sync {
            for numer in 1...3{ print("South \(numer)") }
        }
    }
    
    //Call Func here 
    syncWork()
    
//Output
//    North 1
//    North 2
//    North 3
//    South 1
//    South 2
//    South 3
```

**Async** - execute asynchronouly with the async method, the method call return immediately.

```
func asyncWork(){
        let northZone = DispatchQueue(label: "perform_task_with_team_north")
        let southZone = DispatchQueue(label: "perform_task_with_team_south")
        
        northZone.async {
            for numer in 1...3{ print("North \(numer)") }
        }
        southZone.async {
            for numer in 1...3{ print("South \(numer)") }
        }
    }

//Call Async Task
asyncWork()

//OutPut 
//    North 1
//    South 1
//    North 2
//    South 2
//    North 3
//    South 3
```

**Global Queue** - Using to perform non-UI work in the background.

**Main Queue** - Using to update the UI after completing work in a task on a concurrent queue.

## Typealias

Typealies is an alternative name for an existing data type or complex type. It allows developers to define a new name for an existing type, making the code more readable, concise and flexibe.

**Exemple**: typelias creates a new name "Distance" for the Double

```
typealias Distance = Double

let distance: Distance = 10.5

```

**Exemple**: this typelias ActionClosures, represents a closure that takes no parameters and return void.

```
typealias ActionClosure = () -> Void

let performAction: ActionClosure = {
    print("Performing action")
}
```

Exemple: Typelias define UserInfo as a tuple typle.

```
typealias UserInfo = (name: String, age: Int, email: String)

func processUser(info: UserInfo) {
    // Process user information
}
```

## Tuples

Tuples allow you to group multiple values into a single compound value. They are useful form temporary grouping of values and can hold any combination of different types.

```
let namedPerson = (name: "Sarah", age: 25)
print(namedPerson.name) // Accessing named elements
print(namedPerson.age)
```

Tuples can be used as return types for functions to return multiple values

```
func calculateValues() -> (Double, Double) {
    let result1 = 3.5
    let result2 = 7.2
    return (result1, result2)
}

let (value1, value2) = calculateValues()
print("Value 1: \(value1), Value 2: \(value2)")
```

## Closure

Closure are similar to functions but are defined in a more concise manner, often as inline expressions.

**Function-Like**: Closures can capture and store references to variables and constants from the surrounding context in which they're defined, smilar to nested functions.

**Capture Values**: They capture the values of variables and constants from their enclosing context, even if they're defined outside the closure's body.

**Syntax**: Closures can be written in different forms, including: Using {} braces to encapsulate the closure body

With shorthand argument names ($0, $1)

Examples: 

#### Basic example

```
let greet = {
    print("Hello, closure!")
}

// Calling the closure
greet() // Prints: "Hello, closure!"
```

#### Sorting Collections

```
let numbers = [5, 2, 7, 1, 9]
let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers) // Prints: [1, 2, 5, 7, 9]
```

#### Map Functions

the map functions applies a given closure to each element of an array and returns a new array with the returns.

```
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers) // Prints: [1, 4, 9, 16, 25]
```

#### Filter function

The filter functions uses a closure to determine which elements of an array should be included in the resulting array.

```
let numbers = [10, 20, 30, 40, 50]
let filteredNumbers = numbers.filter { $0 > 25 }
print(filteredNumbers) // Prints: [30, 40, 50]
```

#### Asynchronous Operations

Closures are often used for handling asynchronous tasks, like network request.

```
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        // Simulating a network request
        Thread.sleep(forTimeInterval: 2)
        let result = "Data fetched"
        DispatchQueue.main.async {
            completion(result)
        }
    }
}

// Using the fetchData function
fetchData { data in
    print(data) // Prints: "Data fetched"
}
```

##### Sorting with Custom Logic

Sorting an array of custom objects based on a specific property using closure.

```
struct Person {
    let name: String
    let age: Int
}

let people = [
    Person(name: "Alice", age: 25),
    Person(name: "Bob", age: 30),
    Person(name: "Charlie", age: 20)
]

let sortedPeople = people.sorted { $0.age < $1.age }
print(sortedPeople.map { $0.name }) // Prints: ["Charlie", "Alice", "Bob"]
```

#### Capturing Values

Closure can capture and store references to variables and constants from their surrounding context.

```
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    return {
        total += incrementAmount
        return total
    }
}

let incrementByFive = makeIncrementer(incrementAmount: 5)
print(incrementByFive()) // Prints: 5
print(incrementByFive()) // Prints: 10
```

## Protocol

Protocol is a set of rules and requirements that define a particular functionality or behavior. It defines a list of methods, properties, and other requirements that a class, structure or enumeration can conform to.

```
protocol Vehicle {
    var numberOfWheels: Int { get }
    func startEngine()
    func stopEngine()
}

class Car: Vehicle {
    let numberOfWheels: Int = 4
    
    func startEngine() {
        // Code to start the car's engine
        print("Car engine started")
    }
    
    func stopEngine() {
        // Code to stop the car's engine
        print("Car engine stopped")
    }
}

```

> **Classes**, **structures** or **enumerations** can adopt (or conform to) protocols by providing implementaions for the required methods and properties in the protocol.

**AnyObject** limit the adoption of the protocol to **class types**. It's useful when you specifically want to work with a reference type, because it won't allow any of Swift's structs or enums to be used. AnyObject is also used when you want to restrict a protocol so that it can be used only with classes.

## Delegate

Delegate in Swift is a desing pattern where one object delegates or assigns responsibilities for certain tasks or behaviors to another object. 

This desing pattern is commonly used to establish communication between objects and allows one object to customize or influence the behavior of another object without needing subclassing.

#### Protocol

Typically delegation in Swift involves defining a protocol that declares the methods or properties that the delegate can implement to respond to specific events or tasks.

```
protocol SomeDelegate: AnyObject {
    func didReceiveData(data: Any)
    // Other delegate methods...
}
```

#### Delegating Object

The object that holds a reference to the delegate and invokes methods defined in the protocol when certain events occur.

```
class SomeDelegatingObject {
    weak var delegate: SomeDelegate?
    
    func performTask() {
        // Some task execution
        delegate?.didReceiveData(data: someData)
        // Invoke delegate method when needed
    }
}
```

#### Delegate Implementation

Another object that conforms to the protocol and acts as the delegate, implementing the methods defined in the protocol to respoond to events or taks.

```
class SomeDelegateImplementation: SomeDelegate {
    func didReceiveData(data: Any) {
        // Handle received data
    }
    // Implement other delegate methods...
}

```

#### Assigning the delegate

An instance of the delegate implementation is assigne as the delegate of the delegating object.

```
let delegatingObject = SomeDelegatingObject()
let delegateImplementation = SomeDelegateImplementation()
delegatingObject.delegate = delegateImplementation
```

## View Controller life cycle

#### Inicialization

**(init(coder:))** might be instantiated from storyboard

```
class CustomView: UIView {

    // Other properties and methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Perform additional initialization if needed
    }
}
```

**init(nibName: bundle)** programmatically, when a view controller is create.

#### LoadingViews

**loadView()** : 

the view controlle's view is loaded into memory. If the view controller is instantiated programmatically, you might override **loadView()**. 

```
override func loadView() {
    let customView = UIView()
    customView.backgroundColor = .white
    
    // Add more subviews or configure the view as needed
    // customView.addSubview(...)

    self.view = customView
}
```

**viewDidLoad():** 

Is called after the view is loaded, where you can perform additional setup, like configuring UI elements or initializing data.

##### UI Configuration

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    let titleLabel = UILabel()
    titleLabel.text = "Welcome!"
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 30)
    view.addSubview(titleLabel)
    
    // Other UI setup...
}
```
##### Data Inicialization

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchDataFromServer()
    // Other data initialization...
}
```

##### View-related Setup

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    setupInitialConstraints()
    // Other view-related setup...
}
```

> Some commom tasks: Network call, user interface, other tasks those are needed to do once.

#### Appear/Dissapper Events

**viewWillAppear:** Before view appears, it's called everytime bofore view is visible

```
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Update data or perform actions when the view is about to appear
    
    // Example: Reload data in a table view
    tableView.reloadData()
    
    // Example: Update UI elements based on some condition
    if shouldUpdateUI {
        updateUI()
    }
}
```

> Use this method to perform tasks like update data, adjusting UI elements just like hidding fields, disable actions

**viewDidAppear:**  

This method is called after the view present on screen.

```
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // Perform actions when the view has appeared
    
    // Example: Start an animation when the view is fully visible
    startAnimation()
    
    // Example: Fetch data from a server after the view is displayed
    fetchDataFromServer()
}
```

> Use this method to save data, start animation, start playing video


**viewWillDisappear:** 

Before view is removed 

```
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Perform actions when the view is about to disappear
    
    // Example: Pause ongoing tasks or animations
    pauseAnimation()
    
    // Example: Save data or perform cleanup before the view disappears
    saveChanges()
}
```

> Use this method to hide the keyboard, canceling network request and stopping animations.

**viewDidDisappear** 

This method is called after the VC has been removed from the view.

```
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    // Perform actions when the view has disappeared
    
    // Example: Stop ongoing tasks or clean up resources
    stopTasks()
    
    // Example: Reset state or perform additional cleanup after the view is gone
    resetState()
}
```

> Use this method to stop listen notification, device sensor

#### deinit()

Before a view controller is removed from memory, it gets deinitialized just because a VC is no longer visible, doesn't mean that it has been deallocated even though a VC is off-screen, maybe it is still in memory.

```
class MyViewController: UIViewController {
    
    deinit {
        // Perform cleanup or release resources
        
        // Example: Remove observers or listeners
        NotificationCenter.default.removeObserver(self)
        
        // Example: Release any allocated resources
        releaseResources()
    }
    
    // Other methods and properties...
    
    // Example: A method to release resources
    func releaseResources() {
        // Release resources here
    }
}
```

**more examples:**

##### Removing Observers
```
deinit {
    NotificationCenter.default.removeObserver(self)
    // Remove other observers or KVO here...
}
```

##### Closing Connections

```
deinit {
    networkConnection.close()
    fileHandle.closeFile()
    // Close other connections or file handles...
}
```

##### Releasing Strong References
```
deinit {
    someObjectProperty = nil
    anotherObjectProperty = nil
    // Set other strong references to nil...
}
```
