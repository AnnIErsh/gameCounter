//
//  AddPlayerVC.swift
//  task10
//
//  Created by Anna Ershova on 28.08.2021.
//

import UIKit

class AddPlayerVC: UIViewController, UITextFieldDelegate {
    
    var back = UIButton("Back")
    var add = UIButton("Add")
    var titleName = UILabel("Add player")
    var parentVC: NewGameVC?
    var textFieldName = CustomTextField("Player Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentVC = parent as? NewGameVC
        view.layer.backgroundColor = parent?.view.backgroundColor?.cgColor
        addBackAndInsertButtons()
        addTextFieldName()
        addNewName()
        textFieldName.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(".....")
    }
    
    func addBackAndInsertButtons() {
        view.addSubview(back)
        back.addConstraintsToButton(&view, parentVC!.ratio)
        view.addSubview(add)
        add.addConstraintsToButtonReverse(&view, parentVC!.ratio)
        back.addTarget(self, action: #selector(tapOnButton(_:)), for: .touchUpInside)
        add.addTarget(self, action: #selector(tapOnButton(_:)), for: .touchUpInside)
    }
    
    func addTextFieldName() {
        view.addSubview(textFieldName)
        textFieldName.addConstraintsToTextField(view, multiplier: parentVC!.multiplier)
    }
    
    func addNewName() {
        view.addSubview(titleName)
        var tmp = textFieldName as UIView
        titleName.addConstraintsToAddPlayer(&tmp, multiplier: parentVC!.multiplier)
    }
        
    // MARK: actions
    
    @objc func tapOnButton(_ sender: UIButton) {
        if (sender.currentAttributedTitle?.string == "Back") {
            self.removeChildVC(self)
        }
        if (sender.currentAttributedTitle?.string == "Add") {
            print("new name added")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

class CustomTextField: UITextField {
    
    let deltaX: CGFloat = 23 * (UIScreen.main.bounds.width / 375)
    let deltaY: CGFloat = 18 * (UIScreen.main.bounds.width / 375)

    override func textRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.deltaX , dy: self.deltaY)
    }

    override func editingRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.deltaX , dy: self.deltaY)
    }

    override func placeholderRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: self.deltaX, dy: self.deltaY)
    }
    
    
}
