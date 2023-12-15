import Foundation

// FACADE
/** Provide a simple interface for sophisticated programs.
 It can generate classes to provide simplified interfaces, regardless
 of the multiple methods.
*/

class FACADE {
    
    private var system1: Subsystem1
    private var system2: Subsystem2
    
    init(_ system1: Subsystem1 = Subsystem1(),
         _ system2: Subsystem2 = Subsystem2()) {
        self.system1 = system1
        self.system2 = system2
    }
    
    func operation() -> String {
        
        var result = "Facade initializes subsystems:"
        result += system1.operation1()
        result += system2.operation1()
        result += "\n" + "Facade orders subsystems to perform the action: \n"
        result += " " + system1.operationN()
        result += " " + system2.operationZ()
        return result
    }
}

class Subsystem1 {
    func operation1() -> String {
        return "Subsystem1: ready!\n"
    }
    
    func operationN() -> String {
        return "Subsystem1: Go!\n"
    }
}

class Subsystem2 {
    
    func operation1() -> String {
        return "Subsystem2: GET ready!"
    }
    
    func operationZ() -> String {
        return "Subsystem2: Fire!"
    }
}

class Client {
    func clientCode(_ facade: FACADE = FACADE()) {
        print(facade.operation())
    }
    
    static func clientCodeStatic(_ facade: FACADE = FACADE()) {
        print("-------")
        print("With Static")
        print(facade.operation())
    }
}

let faceSys = Client()
faceSys.clientCode()

Client.clientCodeStatic()
