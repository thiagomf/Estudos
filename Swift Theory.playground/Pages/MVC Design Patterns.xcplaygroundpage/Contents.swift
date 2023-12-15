import Foundation
import UIKit

/*
 MVC one of the most used Swift architecture patterns
 alowwing for clear code separation by 3 roles
 
    MODEL -> it stores and describes how to manipulate application data
    VIEW -> is the object in charge of the models visual representation and user interactions
    CONTROLLER -> the mediator between all of the tasks is the third and final portion of the mvc controller. The controller accesses all of the models's data and then uses a view that manipulates it as needed
 
 */

//MODEL
class Dog {
    var name: String?
    var legs: Int?
}

//CONTROLLER
class ViewController: UIViewController {
    
    //VIEW
    @IBOutlet var petName: UILabel!
    @IBOutlet var petLegs: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fido = Dog()
        fido.name = "Fido"
        fido.legs = 4
        
        petName.text = fido.name ?? "no name"
        petLegs.text = "\(String(describing: fido.legs))"
    }
}
