import Foundation
import UIKit
/**
 A factory design pattern is a creational design pattern that provides a way to create objects without specifying the exacts class of a object that will be create
 */

protocol UIComponent {
    func create() -> UIView
}

class LabelViewFactory: UIComponent {
    
    func create() -> UIView {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }
}

class ButtonViewFactory: UIComponent {
    
    func create() -> UIView {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        return button
    }
}

class ImageViewFactory: UIComponent {
    
    func create() -> UIView {
        let image = UIImageView()
        image.image = UIImage(named: "defaultImage")
        image.contentMode = .scaleAspectFit
        return image
    }
}

let label = LabelViewFactory()
let created =  label.create()

let button = ButtonViewFactory()
let createdB = button.create()
