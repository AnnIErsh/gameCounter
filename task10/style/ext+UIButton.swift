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
        self.layer.shadowColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 0.7).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func addConstraintsToButton(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor , constant: ratio.origin.y).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor , constant: ratio.origin.x).isActive = true
        self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: ratio.width).isActive = true
    }
    
    func addConstraintsToButtonReverse(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor , constant: ratio.origin.y).isActive = true
        self.trailingAnchor.constraint(equalTo: margins.trailingAnchor , constant: -ratio.origin.x).isActive = true
        self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: ratio.width).isActive = true
    }
}

extension UILabel {
    
    convenience init(_ name : String) {
        self.init()
        addStyleToNameLanel(name: name)
    }
    
    func addStyleToNameLanel(name : String) {
        self.font = UIFont(name: "Nunito-ExtraBold", size: 36)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.83
        self.attributedText = (NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]))
        self.textColor = .white
        self.numberOfLines = 0
    }
    
    func addStyleToNameLabelInTable(name : String) {
        self.font = UIFont(name: "Nunito-ExtraBold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.88
        self.attributedText = (NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]))
        self.textColor = .white
    }
    
    func addConstraintsToNameLabel(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -ratio.origin.y).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
    }
    
    func addConstraintsToAddPlayer(_ margins : inout UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -15 * multiplier).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20 * multiplier).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualTo: margins.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
    }
}

extension UIApplication {
    
    static func isFirstLaunch() -> Bool {
        if !UserDefaults.standard.bool(forKey: "launched") {
            UserDefaults.standard.set(true, forKey: "launched")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    func addChildVC(_ child: UIViewController) {
        self.addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeChildVC(_ child: UIViewController) {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

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
        self.topAnchor.constraint(equalTo: margins.topAnchor, constant: 156 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
        self.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
    }
}
