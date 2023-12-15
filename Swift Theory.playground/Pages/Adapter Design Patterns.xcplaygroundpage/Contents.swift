import Foundation

//ADAPTER
/**
 A component shared similat functionality with existinf objects in your app
 Despite sharing similar functionality, the component has an interface that is imcompatigle with other object in your app
 The compoent's source code cannot be modified
 
 Use in : Swift Extensions and the dedicated adapter class
 */

protocol Fly {
    func canFly()
}

class Swallow: Fly {
    
    func canFly() {
        print("Swallow can fly fast")
    }
}

class Hummingbird: Fly {
    func canFly() {
        print("Hummingbird can fly very fast")
    }
}

let swallow = Swallow()
swallow.canFly()

let hummingbird = Hummingbird()
hummingbird.canFly()

class Chicken {
    
    func tryToFly() {
        print("Chicken try to fly, but is very slow")
    }
}

let chicken = Chicken()
chicken.tryToFly()

extension Chicken: Fly {
    func canFly(){
        tryToFly()
    }
}

var animals: [Fly] = [swallow, hummingbird, chicken]

func showAllAnimals(_ animals:[Fly]) {
    for animal in animals {
        animal.canFly()
    }
}
