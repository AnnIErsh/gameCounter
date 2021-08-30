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

extension UILabel {
    
    convenience init(_ name : String) {
        self.init()
        addStyleToNameLanel(name: name)
    }
    
    convenience init(timerName : String) {
        self.init()
        addStyleToTimer(name: timerName)
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
        self.topAnchor.constraint(equalTo: margins.topAnchor, constant: 160 * multiplier).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60 * multiplier).isActive = true
        self.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
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
        self.topAnchor.constraint(equalTo: top.bottomAnchor, constant: 12 * multiplier).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -1 * multiplier).isActive = true
    }
}

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
        self.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: -22 * multiplier).isActive = true
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
}

extension GameProcessVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cv.frame.width / 1.3, height: cv.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        parentVC!.players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20 * parentVC!.multiplier
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 160 * parentVC!.multiplier, right: 10)
    }
}

extension UIStackView {
    
    func addConstraintsToConteiner1(_ margins: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30 * multiplier).isActive = true
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
}
