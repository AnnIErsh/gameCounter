//
//  ext+UIView.swift
//  task10
//
//  Created by Anna Ershova on 30.08.2021.
//

import UIKit

extension UIView {
    func addConstraintsToContsiner(_ margins: UILabel, multiplier: CGFloat, _ topMargin: UIButton) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 42 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.widthAnchor.constraint(equalToConstant: 36).isActive = true
        self.trailingAnchor.constraint(equalTo: topMargin.trailingAnchor).isActive = true
    }
    
    func addConstraintsToConteiner0(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -10 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 90 * multiplier).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    }
    
    func addConstraintsToCircle(multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 90 * multiplier).isActive = true
        self.widthAnchor.constraint(equalToConstant: 90 * multiplier).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.layer.cornerRadius = 90 * multiplier / 2
    }
    
    func addConstraintsToLeftArrow(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 46 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30 * multiplier).isActive = true
        self.widthAnchor.constraint(equalToConstant: 30 * multiplier).isActive = true
        self.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    }
    
    func addConstraintsToRightArrow(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -46 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30 * multiplier).isActive = true
        self.widthAnchor.constraint(equalToConstant: 30 * multiplier).isActive = true
        self.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    }
    
    func addConstraintsToReset(multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 20 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 20 * multiplier).isActive = true
        self.widthAnchor.constraint(equalToConstant: 15 * multiplier).isActive = true
        self.topAnchor.constraint(equalTo: superview!.bottomAnchor, constant: 10 * multiplier).isActive = true
    }
}
