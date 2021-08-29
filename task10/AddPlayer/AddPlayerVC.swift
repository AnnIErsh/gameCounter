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
        textFieldName.becomeFirstResponder()
        add.isEnabled = false
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let res = checkIfEnabled()
        if res {
            view.endEditing(true)
            print("new name added")
            parentVC?.players.append(textFieldName.text!)
            parentVC?.tableName.reloadData()
            self.removeChildVC(self)
        }
        return false
    }
        
    func checkIfEnabled() -> Bool {
        if textFieldName.text != "" {
            add.isEnabled = true
            print("enabled again")
            return true
        }
        
        if textFieldName.text == "" {
            add.isEnabled = false
            print("not enabled")
        }
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textVal = textFieldName.text,
           let textRange = Range(range, in: textVal) {
            let newText = textVal.replacingCharacters(in: textRange, with: string)
            if newText == "" {
                add.isEnabled = false
            } else {
                add.isEnabled = true
                add.setTitleColor(back.currentTitleColor, for: .normal)
            }
        }
         return true
     }
    
    // MARK: actions
    
    @objc func tapOnButton(_ sender: UIButton) {
        if (sender.currentAttributedTitle?.string == "Add") {
            view.endEditing(true)
            print("new name added")
            parentVC?.players.append(textFieldName.text!)
            parentVC?.checkIfEmpty()
            parentVC?.tableName.reloadData()
            self.removeChildVC(self)
        }
        else {
            view.endEditing(true)
            self.removeChildVC(self)
        }
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
