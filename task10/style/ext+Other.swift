//
//  ext+Other.swift
//  task10
//
//  Created by Anna Ershova on 30.08.2021.
//

import UIKit

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

extension UIImageView {
    func addConstraintsToDice(multiplier: CGFloat, _ topMargin: UIButton) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topMargin.bottomAnchor, constant: 16 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.widthAnchor.constraint(equalToConstant: 36).isActive = true
        self.trailingAnchor.constraint(equalTo: topMargin.trailingAnchor).isActive = true
    }
}

extension UICollectionView {
    func addConstraintsToCV(multiplier: CGFloat, _ top: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: top.bottomAnchor, constant: 6 * multiplier).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -1 * multiplier).isActive = true
    }
    
}

extension UIStackView {
    
    func addConstraintsToConteiner1(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -60 * multiplier).isActive = true
        self.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 55 * multiplier).isActive = true
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        for i in self.arrangedSubviews {
            i.layer.cornerRadius = i.frame.size.height / 2
        }
    }
    
    func addConstrainsToPage(_ multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview!.bottomAnchor, constant: 10 * multiplier).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
        //self.heightAnchor.constraint(equalToConstant: 55 * multiplier).isActive = true
    }
}


