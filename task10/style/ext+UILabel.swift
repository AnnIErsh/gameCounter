//
//  ext+UILabel.swift
//  task10
//
//  Created by Anna Ershova on 30.08.2021.
//

import UIKit

extension UILabel {
    
    convenience init(_ name : String) {
        self.init()
        addStyleToNameLanel(name: name)
    }
    
    convenience init(timerName : String) {
        self.init()
        addStyleToTimer(name: timerName)
    }
    
    convenience init(title : String) {
        self.init()
        addStyleToPageLetter(title)
    }
    
    func addStyleToNameLanel(name : String) {
        self.font = UIFont(name: "Nunito-ExtraBold", size: 36)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.83
        self.attributedText = (NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]))
        self.textColor = .white
        self.numberOfLines = 0
    }
    
    func addStyleToTimer(name: String) {
        self.font = UIFont(name: "Nunito-ExtraBold", size: 28)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        self.attributedText = (NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]))
        self.textColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
    }
    
    func addStyleToNameLabelInTable(name : String) {
        self.font = UIFont(name: "Nunito-ExtraBold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.88
        self.attributedText = (NSAttributedString(string: name, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]))
        self.textColor = .white
    }
    
    func addStyleToPageLetter(_ name: String) {
        self.textColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        self.font = UIFont(name: "Nunito-ExtraBold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.88
        self.textAlignment = .center
        self.attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    func addConstraintsToNameLabel(_ margins : inout UIView, _ ratio: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -ratio.origin.y).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
       // self.heightAnchor.constraint(equalToConstant: ratio.height).isActive = true
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
    func addConstraintsToAddPlayer(_ margins : inout UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -15 * multiplier).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20 * multiplier).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualTo: margins.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
    }
    
    func addConstraintsToHeader(_ margins : inout UIView, multiplier: CGFloat, _ leadView: UIButton, _ tmp: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 16 * multiplier).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: tmp.frame.height).isActive = true
    }
    
    func addConstraintsToToTimer(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: 90 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 41 * multiplier).isActive = true
    }
}
