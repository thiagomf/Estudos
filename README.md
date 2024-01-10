# Topics to study

Design patterns

- O que é Strategy?
- O que é Simple Factory?
- O que é Chain of Responsibility?
- O que é um Observable?

## Interface Builder

#### Inferface builder: StoryBoard or XIB Files UIKIT

**Storyboard**: A visual representation of the app's screens where you can drag and drop UI elements and desing the layout.

**XIB files**: These are individual interfaces files that can represent a single view or component. They allow you to design a specific UI element separately

**View Code**: in contrast to using Interface builder, when you create views using code, you're essentially instantiating and configuring UI elements directly in your Swift files rather that visually designing them in Interface builder.

**SwiftUI**: is a declarative UI framework introduced by Apple, you can define your user interface entirely in Swift code using SwiftUI's views, modifiers, and containers.

## SOLID

SOLID represent five principles of object-oriented programming and design aimed at creating more maintainable, scalable, and understandable software.

#### Principles

##### Single Responsibility Principle

A class or module should have only one reason to change. It should be responsible for only one specific task or functionality.
> Helps in keeeping code focused, understandable and maintainable.

Example: 
**Example violating SRP**

```
// Example violating SRP
class User {
    func login(username: String, password: String) {
        // Logic for user authentication
        // ...
        // Code for handling UI or network operations directly
    }
    
    func updateUserProfile() {
        // Logic for updating user profile
        // ...
        // Code for handling UI or network operations directly
    }
}
```
**Refactored Example: Separe Responsibilities**

```
// SRP-compliant approach

// Authentication Manager responsible for user authentication
class AuthenticationManager {
    func login(username: String, password: String) -> Bool {
        // Logic for user authentication
        // ...
        return true // or false based on success or failure
    }
}

// User Profile Manager responsible for managing user profile
class UserProfileManager {
    func updateUserProfile() {
        // Logic for updating user profile
        // ...
    }
}
```
##### Open/Closed Principle (OCP)

Software entities (classes, modules, functions) should be open for extension but closed for modification.

Allows extending behavior without altering existing code, promoting modularity and scalability.

```
// Base Shape Protocol
protocol Shape {
    func area() -> Double
}

// Different Shapes conforming to the Shape protocol
struct Circle: Shape {
    let radius: Double
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    func area() -> Double {
        return width * height
    }
}

// Area Calculator
struct AreaCalculator {
    static func calculateArea(shapes: [Shape]) -> Double {
        return shapes.reduce(0) { $0 + $1.area() }
    }
}
```

The **AreaCalculator** is open for extension: if a new shape (ex.: Triangle) is added by conforming to the **Shape** protocol, the AreaCalculator doesn't need modification. It can work with the new shape without its existing code.

##### Liskov Substitution Principle

Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program.

Ensures that derived classes can be used interchangeably with their base classes withount unexpected behavior.

**Example Shape Hierarchy**:

Let's consider a hierarchy of shapes where **Retangle** and **Square** inherit from a base class **Shape**. According to LSP, a Square should be substitutable for a Shape without causing unexpected behavior.

```
// Base Shape class
class Shape {
    func area() -> Double {
        return 0.0
    }
}

// Rectangle class inheriting from Shape
class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func area() -> Double {
        return width * height
    }
}

// Square class inheriting from Rectangle
class Square: Rectangle {
    init(sideLength: Double) {
        super.init(width: sideLength, height: sideLength)
    }
}

// Function to calculate total area of shapes
func calculateTotalArea(shapes: [Shape]) -> Double {
    return shapes.reduce(0) { $0 + $1.area() }
}
```

**Usage demonstrating LSP**:

```
let rectangle = Rectangle(width: 5.0, height: 4.0)
let square = Square(sideLength: 5.0)

let totalArea = calculateTotalArea(shapes: [rectangle, square])
print("Total area:", totalArea)
```

According to LSP, a Square is a special case of a Retangle, where all sides are equal. However, using inheritance in this manner might violetate the principle, as modifying the width of a Square would need to affect it's height to maintain equality.

#### Interface segregation principle (ISP)

Clients should not be forced to depend on interfaces they don't use.

Promotes creating specific, focused interfaces rather than large, general-purpose ones, preventing unnecessary dependencies.

Example: 

```
// Printable protocol for printing functionality
protocol Printable {
    func printDocument()
}

// Scannable protocol for scanning functionality
protocol Scannable {
    func scanDocument()
}

// Machine class conforming to both Printable and Scannable protocols
class Machine: Printable, Scannable {
    func printDocument() {
        print("Printing document...")
    }
    
    func scanDocument() {
        print("Scanning document...")
    }
}
```
Applying Interface Segregation Principle:

```
// Printer protocol for printing functionality only
protocol Printer {
    func printDocument()
}

// Updated Machine conforming to Printer protocol
extension Machine: Printer {}

// Printer class that uses the Printer protocol
class PrinterClient {
    let printer: Printer
    
    init(printer: Printer) {
        self.printer = printer
    }
    
    func executePrint() {
        printer.printDocument()
    }
}

```

Applying the Interface Segregation Principle helps in desiging more focused and specialized protocols, reducing unnecessary dependencies and making the codebase more maintainable and adaptable to change.

#### Dependency Inversion Principle (DIP)

High-level modules should not depend on low-level modules. Both should depend on abstractions.

Abstractions (interfaces, protocols) should not depend on details; details should depend on abstractions.

Encourages the use of abstractions to decouple components and reduce dependencies.

```
// Messenger protocol defining the behavior for sending messages
protocol Messenger {
    func sendMessage(message: String)
}

// Concrete implementation of the Messenger protocol
class EmailService: Messenger {
    func sendMessage(message: String) {
        print("Email sent: \(message)")
    }
}

class SMSService: Messenger {
    func sendMessage(message: String) {
        print("SMS sent: \(message)")
    }
}

// MessageService that depends on the Messenger protocol
class MessageService {
    let messenger: Messenger
    
    init(messenger: Messenger) {
        self.messenger = messenger
    }
    
    func sendNotification(message: String) {
        messenger.sendMessage(message: message)
    }
}
```
**Usage Demonstrating DIP**

```
let emailMessenger = EmailService()
let smsMessenger = SMSService()

let emailMessageService = MessageService(messenger: emailMessenger)
let smsMessageService = MessageService(messenger: smsMessenger)

emailMessageService.sendNotification(message: "Important email notification")
smsMessageService.sendNotification(message: "Urgent SMS alert")
```

## What is swift? 

Swift is a powerful and intuitive programming language. 

**It's safe**, reduces commom programming errors by design, forces coding patterns like optionals to handle nil values, type inference, and memory management techniques like automatic reference counting (ARC).

**Modern Syntax:** it includes features like closures, tuples, generics and powerful pattern matching.

**Performance:** is designed to be fast and efficient. The performing is better than objctive-c. 

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


# Design Patterns

## MVC (Mode-View-Controller)

A classic pattern where the app divides into three main components: Model(data), View(UI), and Controller (mediator between Model and View).

**Example**: This example showcases the separation of concerns, where the **model** (Counter), holds the data, the **view** (ViewController and associated UI Elements) display the data, and the controller (View Controller) manages the interaction between the model and the view.

**Model:**

```
// Counter model
class Counter {
    var count = 0
}
```

**View: **

```
import UIKit

// View Controller
class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    
    var model = Counter() // Model instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        countLabel.text = "Count: \(model.count)"
    }
    
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        model.count += 1 // Increment the count in the model
        updateCounterLabel() // Update the view
    }
}
```

## MVVM

MVVM (Model-View-ViewModel) is an architectural design pattern that aims to separate the presentation layer from the business logic and data access in applications. It's widely used in Swift and iOS development to create maintainable and testable code.

**Model:** Represents the data entities and business logic. For example, networking code, database interactions, or any data manipulation.

Example: 

```
// Model
struct User {
    let username: String
}
```

**View:** Consists of the UI Elements, including storyboards, view controllers, and SwiftUI views. The View binds to properties in the ViewModel and updates itself based on changes.

Example: 

```
// View (ViewController)
class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    
    var viewModel: UserViewModel! // Injected ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        usernameLabel.text = viewModel.usernameText
    }
}
```

**ViewModel:** Contains the presentation loginc and data needed by the view. It prepares the data to be displayed, handles user interactions, and communicates with the Model layer. The ViewModel doesn't have any reference to the View.

Example: 

```
// ViewModel
class UserViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var usernameText: String {
        return "Username: \(user.username)"
    }
}
```


## MVVM with Coordinator

#### MVVM-C

How MVVM-C Works:

**Coordinator:** Handles the navigation between ViewControllers, instantiates ViewModel, and manages their dependencies. The coordinator is responsible for creating and pushing/presenting ViewController while injecting their respective ViewModels.

Example:

```
// Coordinator
protocol Coordinator {
    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let user = User(username: "JohnDoe")
        let viewModel = UserViewModel(user: user)
        let profileVC = ProfileViewController.instantiate()
        profileVC.viewModel = viewModel
        navigationController.pushViewController(profileVC, animated: true)
    }
}

// View
class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    var viewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        usernameLabel.text = viewModel.usernameText
    }
    
    static func instantiate() -> ProfileViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        return vc
    }
}

// ViewModel and Model remain the same
```

## VIPER

Viper is an architectural design pattern primarily used in IOS app development to enhance code reusability, scalability, and testability by separating te app into distinct modules or components, each with it's specific responsibility.

**VIEW**: 
- Represents the user interface elements
- Passes user actions to the Presenter and display data from the Presenter.

```
// View (ViewController)
class TodoListViewController: UIViewController {
    var presenter: TodoListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func displayTodoItems(items: [TodoItem]) {
        // Update UI to display todo items
        for item in items {
            print("Title: \(item.title), Completed: \(item.completed)")
        }
    }
}
```

**PRESENTER**:
- Acts as a mediator between the View and Interactor
- Receives user actions from the View and requests data manipulation from the Interactor.
- Formats the data from the Interactor and passes it to the View for display.

```
// Presenter
protocol TodoListPresenterProtocol {
    func presentTodoItems(items: [TodoItem])
}

class TodoListPresenter: TodoListPresenterProtocol {
    weak var viewController: TodoListViewController?
    var interactor: TodoListInteractorProtocol?
    
    func viewDidLoad() {
        let items = interactor?.fetchTodoItems() ?? []
        presentTodoItems(items: items)
    }
    
    func presentTodoItems(items: [TodoItem]) {
        viewController?.displayTodoItems(items: items)
    }
}
```

**INTERACTOR**:
- Constains business logic, performs data manipulatio, and interacts with the data source (API, database)
- Notifies the Presenter of the results. 

```
// Interactor
protocol TodoListInteractorProtocol {
    func fetchTodoItems() -> [TodoItem]
}

class TodoListInteractor: TodoListInteractorProtocol {
    func fetchTodoItems() -> [TodoItem] {
        // Code to fetch todo items from a data source (e.g., database, API)
        return [
            TodoItem(id: 1, title: "Buy groceries", completed: false),
            TodoItem(id: 2, title: "Finish homework", completed: true)
        ]
    }
}
```

**ENTITY**: 
- Represents the data models or entities used in the app.
- Usually, plain data objects without any business logic.

```
// Entity
struct TodoItem {
    let id: Int
    let title: String
    let completed: Bool
}
```

**ROUTER**:
- Handles navigation between different modules or components (ViewControlllers)
- Isolates navigation logic from the ViewControllers.
- Responsible for creating and presenting new ViewControllers.

```
// Router
protocol TodoListRouterProtocol {
    static func createTodoListModule() -> UIViewController
}

class TodoListRouter: TodoListRouterProtocol {
    static func createTodoListModule() -> UIViewController {
        let viewController = TodoListViewController()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        
        return viewController
    }
}
```

```
// Usage in App (e.g., AppDelegate)
let todoListModule = TodoListRouter.createTodoListModule()
// Present `todoListModule` in the app's navigation stack or window
```

## Diference between Coordinator and Router

Coordinators generally focus on the **navigation flow** between individual view controllers/screens, **abstracting away the navigation logic**. **Routers**, in architectures like VIPER or Clean Swift, **manage the transitions between larger architectural components or modules.**

## Encapsulation

Encapsulation in Swift refers to the principle of bundling the implementation details of an entity (like a class, struct, or a enum) with its interface or public API, restricting access to certain components while exposing others. It aims to hide the internal workings of an entity and only provide access to the necessary parts, promoting better code organization, readability, and maintainability.

#### Access Control

Keywords: public, internal, privatem fileprivate

#### Hide implementation Details

Allow you to hide the internal implementation details of class or struct, exposing only the necessarry parts through its public interface.

Encourages clients to interact with the entity using it's designated methods and properties rather that directly accessing its internal state.

#### Data Hiding

It helps in protecting the integrity of an entity's data by providing controlled access through methods (getters, setters) and preventing direct modification of properties.

#### Code Modularity

Encapsulation facilitates code modularity by organizing code into distinct components with clear boundaries and limited exposure to the outside world.

Modules, classes and structs can encapsulate their functionality reducing dependecies and making the codebase more maintainable.

```
class BankAccount {
    private var balance: Double = 0.0
    
    // Public interface to interact with the account balance
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            print("Insufficient balance")
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}

// Usage
let account = BankAccount()
account.deposit(amount: 1000.0)
account.withdraw(amount: 500.0)
print("Current Balance:", account.getBalance()) // Accessing the balance through the public method
```

## Monolithic Repository or Monorepo

Monolithic is where multiple projects or components are stored within a single repository. In the context of Swift or any other programming language, a monorepo might contain multiple Swift projects, libraries, frameworks, or modules within a single repository.

#### Characteristics

##### Single Repository

All related Swift projects, libraries, or modules are stored within a single version control repository

This contrast with the traditional approach of having separate repositories for individual projects or components.

##### Shared History and Codebase

All code within a monorepo shares the same version control history.

Changes made across different projects or components are tracked together within the same repository.

##### Code Sharing and Collaboration

Developers working within a monorepo have easy access to shared code and resources.

Collaboration and sharing between different projects/modules are simplified since they're all part of the same repository

##### Consistent Tooling and Processes

A monorepo allows for consistent tooling, build processes, and versioning across all components within the repository.

It promotes standardized practices and conventions across the entire codebase.

### Challengers:

**Increased complexity**: handling a large codebase within a single repository become complex and cumbersome.

**Build and Test Overheads**: Large monorepos might have longer build and test times due to the interconnectedness of components.

**Access Control**: Granular access control and permissions become crucial when multiple teams work on diffenrent parts of the monorepo.

## Modularization

Modularization in Swift refers to the practice of organizing a codebase into smaller, self-contained modules or units that encapsulate specific functionalities.

This approach promotes code separation, reusability, and maintainabilty by dividing a large codebase into smaller, more manageable parts.

You can create separate modules for different features such: 
1. User authentication
2. Networking
3. UI components
4. Data persistence

## Polymorphism

Polymorphism refers to the ability of different objects to be treated as instances of a commom superclass or conforming to a shared protocol, allowing them to be used interchangeably through a uniform interface.

Polymorphism in Swift allows for code that is more adaptable, reusable, and maintains a high level of abstraction, enabling the use of a common interface to work with diverse type without needing to know their specific implementation details at compile time.

```
// Superclass
class Vehicle {
    func drive() {
        print("Driving a vehicle")
    }
}

// Subclasses
class Car: Vehicle {
    override func drive() {
        print("Driving a car")
    }
}

class Bike: Vehicle {
    override func drive() {
        print("Riding a bike")
    }
}

// Usage
let vehicle1: Vehicle = Car()
let vehicle2: Vehicle = Bike()

vehicle1.drive() // Output: "Driving a car"
vehicle2.drive() // Output: "Riding a bike"
```

## Final

The word final is used to declare that a class, method or property cannot be overriden or subclassed.

#### Final Classes

Declaring a class as final means it cannot be subclassed. Any attempt to subclass a final class will result in a compilation error.

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

## Generics

Generics in swift allow you to write flexible and reusable functions, structures, classes, and enums that can work with any type. They enable you write code that doesn't depend on specific data types, making your code more adaptable and reusable.

#### Reusability
Generics enable writing functions and types that can work with any type.

They allow you to write flexible code that doesn't need to be duplicated for different data types.

#### Type Safety
Generics maintain strong type safety by allowing you to define placeholders for types.

They provide type information at compile-time, ensuring that the code is correctly used with compatible types.

#### Code Optimization
Generics help avoid code redundancy by writing a single implementation that works with different types.

This reduces the need for creating specialized version of function or structures for each data type.

**Examples:**

Generic Functions

```
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 5
var y = 10
swapValues(&x, &y) // Swaps the values of x and y
```

Generic Types (Classes, Structs, Enums)

```
struct Queue<T> {
    var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

var intQueue = Queue<Int>()
intQueue.enqueue(1)
intQueue.enqueue(2)
let dequeuedValue = intQueue.dequeue() // dequeuedValue = 1

```

Associated Types

```
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
}

struct Stack<T>: Container {
    private var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    // Implementing Container protocol
    mutating func append(_ item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
}
```
Associated types in protocols provide flexibility by allowing conforming types to define specific types for associated placeholders, enablind protocol-oriented designs and generic programming patterns.

**More example**:

```
// Protocol with an associated type
protocol Printable {
    associatedtype PrintableItem // Placeholder for the printable item type
    
    var description: String { get }
    func printItem(_ item: PrintableItem)
}

// Conforming types using associated types
struct Printer<T>: Printable {
    // Associated type defined as `T` for the Printer
    typealias PrintableItem = T
    
    var description: String {
        return "Printer with type \(T.self)"
    }
    
    func printItem(_ item: T) {
        print("Printing: \(item)")
    }
}

// Another conforming type using a different associated type
struct Document: Printable {
    // Associated type defined as `String` for the Document
    typealias PrintableItem = String
    
    var description: String {
        return "Document Printer"
    }
    
    func printItem(_ item: String) {
        print("Document: \(item)")
    }
}

// Example usage:
let numberPrinter = Printer<Int>()
numberPrinter.printItem(10) // Output: Printing: 10
print(numberPrinter.description) // Output: Printer with type Int

let docPrinter = Document()
docPrinter.printItem("Sample Document") // Output: Document: Sample Document
print(docPrinter.description) // Output: Document Printer
```

## Guard

Guard helps in writing defensive code by handling the conditions that must be met before executiong the rest of the code block, contributing to safer and more readable Swift code.

> It's particularly useful for checking conditions that must be true for the excution of the rest of the code block.

**Checking conditions**: is used to check conditions that, if not met, result in an early exist from the current code lock using. **RETURN, THROW, BREAK, CONTINUE**.

**Unwrapping Optionals**: It's commonly used to unwrap optionals and ensure that optional bindings have a value. If the condition fails the code inside the **else** block is executed.

**Early Exit**: It ensures that the rest of the code executes only when certain conditions are met, reducing nested code block and improving readability.

**Example:** 

```
func processOrder(order: [String: Any]) {
    guard let orderId = order["id"] as? Int else {
        print("Invalid order: Missing or invalid order ID")
        return
    }

    guard let items = order["items"] as? [String], !items.isEmpty else {
        print("Invalid order: Missing or empty items list")
        return
    }

    // Process the order since required conditions are met
    print("Processing order with ID: \(orderId)")
    print("Items to process: \(items)")
    
    // ... rest of the code to handle the order
}
```

## Combine

Combine is a framework introduced by Apple that facilitates reactive programming in Swift. It's designed to handle asynchronous and event-based code by providing a declarative Swift API for processing values over time.

Combine concepts:

#### Publishers

Publishers represent a sequence of values over time or asynchronous tasks. They emit elemnts to subscribers.

#### Subscribers

Subscribers receive and handles the values emitted by publishers.

#### Operators

Operators allow manipulation of the stream of data in various ways. (**map, filter, combineLastest, flatMap**)

Example:

```
import Combine

let numbers = (1...5)
let publisher = numbers.publisher  // Create a publisher from an array

let subscription = publisher
    .map { $0 * 2 } // Multiply each emitted value by 2
    .sink { value in
        print(value) // Print the transformed values
    }

```

**Example with SwiftUI**:

```
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var text = "Initial text"
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        TextField("Enter text", text: $viewModel.text)
            .padding()
    }
}
```

**Example MVVM with Combine**:

**Model**

```
struct User {
    let username: String
    let email: String
}
```

**View Model**

```
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User // The published property for reactive updates
    private var cancellables = Set<AnyCancellable>()

    init(user: User) {
        self.user = user
    }

    // Example method to update user's email
    func updateUserEmail(newEmail: String) {
        user = User(username: user.username, email: newEmail)
    }
}
```

**View**

```
import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        VStack {
            Text("Username: \(viewModel.user.username)")
            TextField("Enter new email", text: Binding(
                get: { viewModel.user.email },
                set: { viewModel.updateUserEmail(newEmail: $0) }
            ))
        }
        .padding()
    }
}
```

**Putting it together**:

```
import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = UserViewModel(user: User(username: "JohnDoe", email: "john@example.com"))

    var body: some View {
        UserView(viewModel: userViewModel)
    }
}
```


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

On the other hander, **Protocol - Oriented Programming POP** emphansizes the use of protocols to define a blueprint of methods, properties and other requirements that a type should adopt. Protocols can be seen as contracts that define a set of functionalities without specifiying how they should be implemented. Types (classes, structures, or enumerarions) can then conform to theses protocols by providing implementations for the required functionalities. POP encourages composition over inheritance and enable more flexibility and code reuse by allowing types to conform to multiple protocols.

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

print(motorbike.km) //35.5
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

> Memory for value types is directly allocated where they're defined, making their memory management very efficient.

> When a value type goes out of scope, Swift automatically deallocates its memory.

> For instance, when a function finishes executing and its local variables (value types) go out of scope, the memory they were using is automatically deallocated.

## Circular Reference or Retain Cycles

A **circular reference**, also know as a **retain cycle**, occurs when two or more objects hold a strong reference to each other, preventing the system from **deallocating** memory even when they're no longer needed. This situation can happen when using **closures** or when two objects have properties that hold references to each other strongly.

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

**Another Example using MVP:**

```
protocol PresenterProtocol: AnyObject {
    func onViewLoaded()
}

protocol ViewProtocol: AnyObject {
    func displayData(_ data: String)
}

class Presenter: PresenterProtocol {
    weak var view: ViewProtocol?
    
    func onViewLoaded() {
        // Perform operations
        view?.displayData("Some data")
    }
}

class ViewController: UIViewController, ViewProtocol {
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
        presenter?.onViewLoaded()
    }
    
    func displayData(_ data: String) {
        // Display data in the view
    }
}
```

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

### Overload

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

Sometimes we are trying to perform multiple tasks at the same time,that time most of the developer facing applications hang or freezing issue. That's why **we are using GCD, to manage multiple task at the same time.**

**Concurrenct** - It's starting multiple tasks at the same time, but not garantee for the finish at same time. It's can finish any order. (**Async**)

**Serial** - It's executing one task at a time. (**Sync**)

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

```
let mainQueue = DispatchQueue.main // Main Queue
let globalQueue = DispatchQueue.global() // Global Queue
let customSerialQueue = DispatchQueue(label: "com.example.serialQueue") // Custom Serial Queue
let customConcurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent) // Custom Concurrent Queue
```

#### Another kinds of DispatchQueue

```
let group = DispatchGroup() // DispatchGroup
let semaphore = DispatchSemaphore(value: 1) // DispatchSemaphore
let workItem = DispatchWorkItem { print("WorkItem executed") } // DispatchWorkItem
let timer = DispatchSource.makeTimerSource() // DispatchSource (Timer)
```

#### DispatchGroup

Synchronizes multiple tasks and waits for their completion using enter() and leave() methods. Uses notify(queue:) to execute a closure when all tasks are finished.

```
import Foundation

// Create a DispatchGroup
let group = DispatchGroup()

// Simulated asynchronous tasks
func performTask(number: Int) {
    DispatchQueue.global().async(group: group) {
        // Simulate an asynchronous task
        Thread.sleep(forTimeInterval: TimeInterval.random(in: 1...3))
        print("Task \(number) completed")
    }
}

// Perform multiple tasks
performTask(number: 1)
performTask(number: 2)
performTask(number: 3)

// Notify when all tasks are completed
group.notify(queue: .main) {
    print("All tasks finished. Ready to proceed!")
}
```

**performTask** simulates an asynchronosus task using DispatchQueue.global().async

Each task is associated with the DispatchGroup using **async(group:)**

After enqueuing the task, **group.notify** is called with closure that will execute when all tasks in the group complete.

The closure within '**group.notify**'executes on the main queue, indicating that all tasks have finished.

#### DispatchSemaphore

Controls access to a resource with a counter that decrements and increments with wait() and signal(). Useful for synchronization.

```
import Foundation

// Create a semaphore with an initial value of 2
let semaphore = DispatchSemaphore(value: 2)

// Simulate a resource shared among multiple tasks
var sharedResource = [Int]()

// Function representing a task that accesses the shared resource
func accessSharedResource(_ id: Int) {
    print("Task \(id) waiting to access the resource")
    
    // Wait on the semaphore, decrementing its value
    semaphore.wait()
    
    print("Task \(id) is accessing the resource")
    
    // Simulate accessing the shared resource
    sharedResource.append(id)
    
    // Simulate some work being done
    Thread.sleep(forTimeInterval: 2)
    
    print("Task \(id) finished accessing the resource")
    
    // Signal that the task has finished and release the semaphore
    semaphore.signal()
}

// Create multiple concurrent tasks trying to access the resource
for i in 0..<5 {
    DispatchQueue.global().async {
        accessSharedResource(i)
    }
}

// Wait for a few seconds to allow tasks to finish
Thread.sleep(forTimeInterval: 10)
print("Final shared resource: \(sharedResource)")
```

A **DispatchSemaphore** with an initial value of 2 is created

Five tasks attempt to access a shared resource (in this case, an array).

The semaphore ensures that at most two tasks can access the resource concurrently.

Each task waits on the semaphore with '**wait()**', accesses the resource, performs some work, and the signals ('**signal()**') that it has finished, allowing other tasks to access the resource.

> Semaphores are commonly used in scenarios where you want to control access to limited resources or manage the concurrency of tasks accessing a shared resource.

#### DispatchWorkItem

Represents a task or block of code to be executed. Can be canceled, scheduled, or dipatched onto a queue.

```
import Foundation

// Create a queue to perform the work item
let queue = DispatchQueue(label: "com.example.workItemQueue")

// Define a work item
let workItem = DispatchWorkItem {
    print("Work item is executing")
    // Simulate some task
    for i in 1...3 {
        print("Task \(i)")
        Thread.sleep(forTimeInterval: 1)
    }
    print("Work item finished")
}

// Execute the work item asynchronously on the specified queue
queue.async(execute: workItem)

// You can also wait for the work item to finish if needed
workItem.wait()

// You can also cancel the work item if it's not yet started
// workItem.cancel()

// Perform other tasks while the work item is running asynchronously
print("Performing other tasks...")

// Wait for a few seconds to allow the work item to execute
Thread.sleep(forTimeInterval: 2)

```

A **DispatchQueue** named queue is created.

A **DispatchWorkItem** named **workItem** is defined. This work item contains a block of code that simulates a task by printing messages and pausing for one second between each message.

The work item is executed asynchronously on the **queue** using **queue.async(execute: workItem)**

**workItem.wait()** is called to block the current thread until the work item completes. This is optional and used here just to illustrate the point. In practice, you might not want to block the current thread.

While the work item is running asynchronously, other task can be perfomed on the main thread or other queues.

> DispatchWorkItem offers flexibility. You can also cancel the work item using workItem.cancel() if it hasn't started executing yet, allowing you to control task execution more precisely.

#### DispatchSource

Monitors various system events like file descriptors, signals, timers, etc., using sources such as "**DispatchSourceTimer**", "**DispatchSourceFileSystemObject**", etc.

```
import Foundation

// Create a file URL
let fileURL = URL(fileURLWithPath: "/path/to/your/file.txt")

// Create a file descriptor for the file
let fileDescriptor = open(fileURL.path, O_EVTONLY)

// Create a dispatch queue where the event handler will be executed
let queue = DispatchQueue(label: "com.example.fileMonitor")

// Create a DispatchSource for monitoring file changes
let fileMonitorSource = DispatchSource.makeFileSystemObjectSource(
    fileDescriptor: fileDescriptor,
    eventMask: .write, // Monitoring write events
    queue: queue
)

// Define the event handler
fileMonitorSource.setEventHandler {
    print("File was written to")
    // Here you can take actions in response to the file change
}

// Define the cancel handler
fileMonitorSource.setCancelHandler {
    close(fileDescriptor)
    print("File monitor canceled")
}

// Start monitoring the file
fileMonitorSource.resume()

// Simulate some changes in the file (write to the file)
let text = "Hello, DispatchSource!"
try text.write(to: fileURL, atomically: true, encoding: .utf8)

// Wait for a few seconds to allow the event handler to execute
Thread.sleep(forTimeInterval: 2)

// Don't forget to cancel the DispatchSource when it's no longer needed
fileMonitorSource.cancel()

```

Creation of a file descriptor for the specified file.

Creation of a **DispatchSource** using **DispatchSource.makeFileSystemObjectSource** to monitor write events (**eventMask: .write**) on the file.

Setting an event handler using **setEventHandler** that will be executed when the specified event (write to the file) occurs.

Setting a cancel handler using **setCancelHandler** to clean up resources when the source is canceled.

Resuming the **DispatchSource** to start monitoring the file.

Simulating a change in the file by writing some text to it.

Waiting for a few seconds to allow the event handler to execute.

Canceling the **DispatchSource** to stop monitoring the file.

## Async/Await

#### Asyncs Function

Functions marked with **async** can perform asynchronous operations and suspend their execution without blocking the thread.

Example: 

```
func fetchData() async throws -> Data {
    // Asynchronous operation, e.g., fetching data from a network
    let data = try await URLSession.shared.data(from: someURL).0
    return data
}
```

##### Await

Awaiting results is used within and async function to await the completion of an asynchronous task and retrieve its result.

**Await** is used before an expression that return a value from an asynchronous task.

```
async func processData() {
    do {
        let data = try await fetchData()
        // Process the fetched data asynchronously
    } catch {
        // Handle errors from fetchData() here
    }
}
```

Async and Await functionality simplifies asynchronous programming by providing a mode straightforward and intuitive way to work with asynchronous tasks, promoting cleaner and more maintainable code when dealing with asynchronous operations such as networks requests, file I/O, and other non-blocking tasks.

Asynchronous operation whitin async functions are marked with await, indicating points where the code waits for the asynchronous operation to complete before proceeding.

**Benefits**: 

**Readability**: Async and await make asynchronous code mode readable and easier to understand, resembling synchronous code flow.

**Error Handling**: Provides a structured way to handle error thrown by asynchronous operations.

**Exemple**: 

```
import Foundation

func fetchData(from url: URL) async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    return data
}

func processFetchedData() async {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    do {
        let data = try await fetchData(from: url)
        // Process the fetched data here (e.g., decode JSON, update UI)
        print("Fetched data:", String(data: data, encoding: .utf8) ?? "Unable to decode")
    } catch {
        print("Error fetching data:", error)
    }
}

// Run the async function
Task {
    await processFetchedData()
}

```

This example demonstrates the use of await to supende

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

## Trows

Throws is a keyword used in function declarations to indicate that a function can potentially "throw" an error durring it's execution.

Functions marked with throws can propagate error to the calling code, allowing the errors to be handled or passed up the call stack.

Using throws and do-catch blocks provides a structured way to handle errors in Swift, promoting safety and reliability in code that can potentially fail due to exceptional circumstances.

**Exemple: ** 
```
enum FileError: Error {
    case fileNotFound
    case permissionDenied
}

func readFile() throws -> String {
    // Reading a file (example implementation)
    if fileNotPresent {
        throw FileError.fileNotFound
    }
    if insufficientPermissions {
        throw FileError.permissionDenied
    }
    return "File content"
}

// Using the throwing function
do {
    let fileContent = try readFile()
    print("File content: \(fileContent)")
} catch FileError.fileNotFound {
    print("File not found error")
} catch FileError.permissionDenied {
    print("Permission denied error")
} catch {
    print("An unknown error occurred")
}
```

More examples using Throws:

#### Custom Error Types

```
enum AuthenticationError: Error {
    case invalidUsername
    case invalidPassword
}

func authenticate(username: String, password: String) throws -> Bool {
    guard username == "admin" else {
        throw AuthenticationError.invalidUsername
    }
    guard password == "password123" else {
        throw AuthenticationError.invalidPassword
    }
    return true
}

do {
    let isLoggedIn = try authenticate(username: "admin", password: "password123")
    print("Authentication success: \(isLoggedIn)")
} catch AuthenticationError.invalidUsername {
    print("Invalid username")
} catch AuthenticationError.invalidPassword {
    print("Invalid password")
} catch {
    print("An unknown error occurred")
}

```

#### Handling Specific Errors

```
enum DivisionError: Error {
    case divisionByZero
}

func divide(_ dividend: Int, by divisor: Int) throws -> Int {
    guard divisor != 0 else {
        throw DivisionError.divisionByZero
    }
    return dividend / divisor
}

do {
    let result = try divide(10, by: 0)
    print("Result: \(result)")
} catch DivisionError.divisionByZero {
    print("Division by zero error")
} catch {
    print("An unknown error occurred")
}
```

#### Fallback with try?

```
func processNumber(from string: String) throws -> Int {
    guard let number = Int(string) else {
        throw NSError(domain: "InvalidNumber", code: 1, userInfo: nil)
    }
    return number
}

let userInput = "abc"
let number = try? processNumber(from: userInput)
print("Parsed number: \(number ?? 0)") // Output: Parsed number: 0 (due to failure to parse 'abc' as an Int)
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

#### Sorting with Custom Logic

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

**Classes**, **structures** or **enumerations** can adopt (or conform to) protocols by providing implementaions for the required methods and properties in the protocol.

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

## CI/CD


### CI (Continuous integration)

> Objective: To frequently integrate code changes into a shared repository, where automated builds and tests are run.

#### Workflow:

#### Version Control

Developer work on their local branches and push changes to a central repository (Github, Gitlab)

#### Trigger Build

Each push or merge triggers a CI server (Jenking, Travis) to automatically start the build process.

#### Build & Teste
 
The CI server compiles the code, runs automated tests and check for error.

#### Feedback

Developers receive immediate feedback on the status of their changes (sucess, failures or warnings)

Tools examples: **Jenkins, Travis CI, CircleCI, Github Actions**

### CD (Continuous Delivery / Continuous Deployment)

> Objective: To automate the process of delivering code changes to production or making them available for release.

### Worflow

After successful CI, the code is ready for development to various enviromments(staging, testing, pre-production)

#### Successful Build

Code passes all tests in CI.

#### Deployment to Staging

The build artifact is deployed to a staging environment for further testing and validation.

#### Manual Approval

A manual approval process or additional automated tests might be conducted in the staging environments.

#### Release 

If approved, the code is released to production or made available for manual release.

#### A Combined Example

1. Developers push changes to Github
2. Jenkins, upon detecting changes, triggers a build and automated tests.
3. Upon successful testing, Jenkins uses Docker to package the application into containers and deploys it to staginig.
4. Automated tests run in the staging environment.
5. If all tests pass and manual approvals are obtained, Jenkins automatically deploys the changes to production.

# BDD

It's an agile software development methodology that emphasizes collaboration among developers, quality assurance (QA) engineers, product owners and business stakeholders throughout the software development process.

Key Aspects: 

### Behavior-Centric Approach

BDD focuses on defining the behavior of software through scenarios that describe how the system should behave from a user's perpective.
Scenarios are written in a common language. (often using tools like Gherkin)

Example of Gherkin:

```
Feature: Checkout Process
  As a registered user
  I want to be able to add items to my cart
  So that I can proceed to checkout

  Scenario: Adding items to the cart
    Given I am a registered user
    When I add an item with ID "123" to my cart
    Then the item should be in my cart
    And the cart total should reflect the item price
```

### Collaboration and Communication

BDD encourages close collaboration between technical and non-technical team members to define and refine user stories.

### Automated Acceptance Tests

BDD promotes the creation of automated acceptance tests based on the defined scenarios.
Theses tests serve as living documentation and verify that the system behaves as intended based on the specified behaviors.

### Iterative Development

BDD follows an iterative development process, where features are built incrementally based on user stories and their corresponding behavior scenarios.

### Continuous Feedback and Adaptation

BDD encourages continuos feedback loops between stakeholders, allowing for adaptations and refinements based on feedback received during development.

### Focus on Business Value

BDD aims to align software development with business objectives by emphasizing the delivery of features that provide value to users.

### BDD in Swift

Implementing Behavior-Driven Development (BDD) involves using BDD Frameworks and tools that facilitate writing and excuting behavior-driven tests. While swift doesn't have a native BDD-specific framework, there are third-party libraries and tools that enable BDD practices within Swift projects.

Examples: 

### XCTest

> Although XCTest can be used for BDD-style testing with Given-When-Then approach, some third-party frameworks offer more expressive BDD syntax.

```
import XCTest

class ShoppingCartTests: XCTestCase {
    func testAddingItemToCart() {
        // Given
        let shoppingCart = ShoppingCart()
        let item = Item(id: "123", name: "Example Item", price: 10.0)
        
        // When
        shoppingCart.addItem(item)
        
        // Then
        XCTAssertTrue(shoppingCart.contains(item))
        XCTAssertEqual(shoppingCart.total, 10.0)
    }
}
```

#### What is expectation in XCTestExpectation

Is a part of the XCtest Framework in Swift, used for asynchronous testing. It allows you to test asynchronous operations by creating an expectation for a certain condition to be fulfilled within a specific time frame.

Example:

```
class AsyncTestExample {
    func performAsyncTask(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            // Simulating an asynchronous task
            Thread.sleep(forTimeInterval: 2)
            completion()
        }
    }
}
```

```
import XCTest

class AsyncTestExampleTests: XCTestCase {
    func testAsyncTask() {
        let asyncExample = AsyncTestExample()
        
        let expectation = expectation(description: "Async task expectation")
        
        asyncExample.performAsyncTask {
            // Fulfill the expectation when the async task completes
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled within 3 seconds
        waitForExpectations(timeout: 3) { error in
            XCTAssertNil(error, "Expectation timed out")
        }
    }
}
```

**expectation(description:)** created an expectation with a description.

**fulfill()** marks the expectation as fulfilled when the asynchronous task completes.

**waitForExpectations(timeout: handler:)** waits for the expectation to be fulfilled or times out after the specified duration.

**XCTAssertNil** verifies that the expectation didn't time out.


### Quick and Nimble

**Quick** is a behavior-driven-development framework for swift and objective-c that works well with **Nimble**.

```
import Quick
import Nimble

class ShoppingCartSpec: QuickSpec { //Quick
    override func spec() {
        describe("Shopping Cart") { //Quick
            it("should add an item and update total") { //Quick
                let shoppingCart = ShoppingCart()
                let item = Item(id: "123", name: "Example Item", price: 10.0)
                
                shoppingCart.addItem(item)
                
                expect(shoppingCart.contains(item)).to(beTrue()) //Nimble
                expect(shoppingCart.total).to(equal(10.0)) //Nimble
            }
        }
    }
}
```

**More examples:**

```
import Quick
import Nimble

class ShoppingCartSpec: QuickSpec { // Quick
    override func spec() {
        describe("Shopping Cart") { //Quick
            var shoppingCart: ShoppingCart!
            let item = Item(id: "123", name: "Example Item", price: 10.0)
            
            beforeEach { //Quick
                shoppingCart = ShoppingCart()
            }
            
            context("when adding items") { // Quick
                it("should contain the added item") { // Quick
                    shoppingCart.addItem(item)
                    expect(shoppingCart.contains(item)).to(beTrue()) //Nimble
                }
                
                it("should update the cart total") { // Quick
                    shoppingCart.addItem(item)
                    expect(shoppingCart.total).to(equal(10.0)) //Nimble
                }
            }
        }
    }
}
```

**QuickSpec, describe, context, it and beforeEach** is an example of Quick.

**expect(...), .to(equal(...)), .toNot(beEmpty())** is an example of Nimble.

## TDD

Test-Driven Development, a software development methodology that revolves around writing tests before writing the actual code.

The process involves iterative cycles of writing tests, implementing code to pass those tests, and refactoring the code to improve it's structure while ensuring it continues to pass the tests.

1. Write Test First - Before writing any code, developers write automated tests
2. Red-Green-Refactor Cycle - RED: Write a test taht initially fails. GREEN: Write the minimum amount of code to make the test pass.
3. Small, incremental Steps: TDD encourages breaking down complex problems into small, manageable tasks.
4. Automated Testing - These tests are run frequently to ensure that new code changes don't introduce regressions or unexpected behavior.

#### WorkFlow

> Write a test -> Write the code -> Run the Tests -> Refactor the Code -> Repeat

Example:

```
import XCTest

// Example of a simple class to test
class Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

class CalculatorTests: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func testAddition() {
        // Given
        let a = 5
        let b = 10
        
        // When
        let result = calculator.add(a, b)
        
        // Then
        XCTAssertEqual(result, 15) // Test case for addition
    }
}
```

## Pyramid Tests

Pyramid Tests refers to a testing stragy that invlves structuring test in a pyramid shape base on their granularity and execution time.

It is emphasizes having more lower-level, faster tests and fewer higher-level, slower tests.

![Alt text](https://www.onpathtesting.com/hs-fs/hubfs/agile%20testing%20pyramid%20onpath%20testing%20QA.png?width=3891&name=agile%20testing%20pyramid%20onpath%20testing%20QA.png "Pyramid Tests")

#### Unit tests (Bottom of the Pyramid)

- At the base of the pyramed are unit tests, which are small, focused tests that verify the behavior of individual components (**functions, methods and classes**) in isolation.
- It is quick to write and execute, providing fast feedback.

#### Integration Tests (Middle of the Pyramid)

- Above unit tests are integration tests, which validate the interaction and integration between components or modules within an application.
- These tests ensure that different parts of the system work together as expected.
- Integration tests might involve multiple components interacting, making them slower that unit tests but faster than end-to-end tests.

#### End-To-End Tests (Top of the pyramid)

- At the top of the pyramid are end-to-end tests, also knows as UI or acceptance tests.
- These tests validate the entire flow of an application, often interacting with the UI and external dependencies.
- End-to-End tests are slower, more complex, and can be more fragile compared to lower-level tests.
