//
//  ext+UIButton.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

extension UIButton {
        
    convenience init(_ name : String) {
        self.init()
        addStyleToNavigationButtons(name: name)
    }
    
    convenience init(startButtonName: String) {
        self.init()
        addStartButton(name: startButtonName)
    }
    
    convenience init(circleName: String) {
        self.init()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 0
        myShadow.shadowOffset = CGSize(width: 0, height: 2)
        myShadow.shadowColor = UIColor(red: 0.329, green: 0.471, blue: 0.435, alpha: 1)
        self.setAttributedTitle(NSMutableAttributedString(string: circleName, attributes: [NSAttributedString.Key.shadow: myShadow, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Nunito-ExtraBold", size: 25)!]), for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.backgroundColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1).cgColor
    }
    
    convenience init(bigCircleName: String) {
        self.init()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 0
        myShadow.shadowOffset = CGSize(width: 0, height: 2)
        myShadow.shadowColor = UIColor(red: 0.329, green: 0.471, blue: 0.435, alpha: 1)
        self.setAttributedTitle(NSMutableAttributedString(string: bigCircleName, attributes: [NSAttributedString.Key.shadow: myShadow, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Nunito-ExtraBold", size: 40)!]), for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.backgroundColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1).cgColor
    }
    
    func addStyleToNavigationButtons(name : String) {
        self.titleLabel?.font = UIFont(name: "Nunito-ExtraBold", size: 17)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.77
        self.setAttributedTitle(NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]), for: .normal)
        self.setTitleColor(UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1), for: .normal)
        self.setTitleColor(.gray, for: .disabled)
    }
    
    func addStartButton(name: String) {
        self.backgroundColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.25
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 0
        myShadow.shadowOffset = CGSize(width: 0, height: 2)
        myShadow.shadowColor = UIColor(red: 0.329, green: 0.471, blue: 0.435, alpha: 1)
        self.setAttributedTitle(NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.shadow: myShadow, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Nunito-ExtraBold", size: 24)!]), for: .normal)
        layer.shadowColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 0.7).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
    
    func addConstraintsToButton(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor , constant: ratio.origin.y).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor , constant: ratio.origin.x).isActive = true
        self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: ratio.width).isActive = true
        self.contentHorizontalAlignment = .leading
    }
    
    func addConstraintsToButtonReverse(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor , constant: ratio.origin.y).isActive = true
        self.trailingAnchor.constraint(equalTo: margins.trailingAnchor , constant: -ratio.origin.x).isActive = true
        self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: ratio.width).isActive = true
        self.contentHorizontalAlignment = .trailing
    }
}
