//
//  ext+UITextField.swift
//  task10
//
//  Created by Anna Ershova on 30.08.2021.
//

import UIKit

extension UITextField {
    
    convenience init(_ name : String) {
        self.init()
        addTextView(name)
    }
    
    func addTextView(_ name: String) {
        self.layer.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1).cgColor
        self.textColor = .white
        self.font = UIFont(name: "Nunito-ExtraBold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.88
        let str = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        self.placeholder = str.string
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder!,
                                                        attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.608, green: 0.608, blue: 0.631, alpha: 1)])
        self.tintColor = .white
    }
    
    func addConstraintsToTextField(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor, constant: 160 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
        self.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
    }
}
