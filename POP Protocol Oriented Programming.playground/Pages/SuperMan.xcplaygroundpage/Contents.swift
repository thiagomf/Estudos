//: [Previous](@previous)

import Foundation

protocol Named {
    var name: String { get }
}

extension Named {
    func sayHello() {
        print("Diz olá: \(name)")
    }
}

protocol Alien: Named {
    var species: String { get }
}

protocol Flyer {
    func fly()
    func flyTo(location: String)
}

extension Flyer {
    
    func fly() {
        print("I can fly")
    }
    
    func flyTo(location: String) {
        print("let fly to : \(location)")
    }
}

protocol SpaceTraveler {
    
    func travelto(location: String)
}

extension SpaceTraveler {
    
    func travelto(location: String) {
        print("Go to \(location)")
    }
}

struct Superman: Alien, Flyer, SpaceTraveler {
    let name: String = "Clark"
    let species: String = "Krypto"
}

let clark = Superman()
clark.name
clark.flyTo(location: "Brazil")
clark.travelto(location: "EUA")
clark.sayHello()

