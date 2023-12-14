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
protocol Insect: Named {
    var insectType: String { get }
}

//extension Insect {
//    init(name: String, insectType: String) {
//        self.init(name: name, insectType: insectType)
//    }
//}

protocol Quotable {
    var catchPhrases: [String] { get }
    func randomQuote() -> String
}

extension Quotable {
    func randomQuote() -> String {
        return catchPhrases[Int(arc4random_uniform(UInt32(catchPhrases.count)))]
    }
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

struct Bee: Insect, Flyer, Quotable {
    var insectType: String = "Flyer"
    var currentLocation: String = "Honey Comb"
    let name = "honeyBee"
    let catchPhrases: [String]
}

let comb = Bee(catchPhrases: ["buzzz", "zzzz", "wzzzzziiii"])
comb.sayHello()
