import Foundation
import UIKit
//MVC
/**
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
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        let label1 = UILabel()
        label1.frame(forAlignmentRect: .infinite)
        label1.text = petName.text
        label1.textColor = .red
        
        let label2 = UILabel()
        label2.frame(forAlignmentRect: .infinite)
        label2.textColor = .blue
        label2.text = petLegs.text
        
        let vertical = UIStackView()
        vertical.axis = .vertical
        vertical.distribution = .fillEqually
        vertical.addArrangedSubview(label1)
        vertical.addArrangedSubview(label2)
        
        view.addSubview(vertical)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fido = Dog()
        fido.name = "Fido"
        fido.legs = 4
        
        petName.text = fido.name ?? "no name"
        petLegs.text = "\(String(describing: fido.legs))"
    }
}
