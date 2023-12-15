import Foundation

/**
 Is about creating a single instance of a class that has global access. When a single is required for the first time, it uses lazy loading
 */

//Example using a class

class LocationManager {
    
    func requestForLocation() {
        print("Location granted")
    }
}

//Acess the class
//This is the class witout a singleton pattern for access to any function we need to initialize class every time for avoiding these things, we are using singleton classes with static instance
let location = LocationManager() //initialization class
location.requestForLocation() // call function here

//Write Singleton Class - First example
class LocationManagerSingleton {
    
    static let shared = LocationManagerSingleton()
    
    init(){}
    
    func requestForLocation() {
        print("Location granted")
    }
}

//Acess class function with singleton pattern
LocationManagerSingleton.shared.requestForLocation() //Location granted

//But still you can use your class like this
let loc = LocationManagerSingleton()
loc.requestForLocation()

//A better way to write your Singleton class
class BetterWaySingleton {
    
    static let shared = BetterWaySingleton()
    
    private init() {}
    
    func singletonSetence() {
        print("Good to use when stricter control over global variable is required")
    }
}

BetterWaySingleton.shared.singletonSetence()
