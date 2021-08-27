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
    }
    
    func addStartButton(name: String) {
        self.layer.backgroundColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1).cgColor
        self.layer.cornerRadius = 10
        self.titleLabel!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.titleLabel?.font = UIFont(name: "Nunito-ExtraBold", size: 24)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.25
        self.titleLabel!.attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let shadowPath0 = UIBezierPath(roundedRect: self.titleLabel!.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.329, green: 0.471, blue: 0.435, alpha: 1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 0
        layer0.shadowOffset = CGSize(width: 0, height: 2)
        layer0.bounds = self.titleLabel!.bounds
        layer0.position = self.titleLabel!.center
        self.titleLabel!.layer.addSublayer(layer0)
    }
    
    func addConstraintsToButton(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor , constant: ratio.origin.y).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor , constant: ratio.origin.x).isActive = true
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
