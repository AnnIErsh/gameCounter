//
//  NewGameVC.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

class NewGameVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cancel = UIButton("Cancel")
    var name = UILabel("Game Counter")
    var tableName = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let multiplier = UIScreen.main.bounds.width / 375
    var ratio: CGRect {
        get {
            let x = 20 * multiplier
            let y = 37 * multiplier
            let h = 41 * multiplier
            let w: CGFloat = 53
            return CGRect(x: x, y: y, width: w, height: h)
        }
    }
    
    var ratioName: CGRect {
        get {
            let x = 20 * multiplier
            let y = 25 * multiplier
            let h = 41 * multiplier
            let w = 243 * multiplier
            return CGRect(x: x, y: y, width: w, height: h)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.136, green: 0.136, blue: 0.138, alpha: 1).cgColor
        addTableWithConstraints()
        addTitleName()
        if !UIApplication.isFirstLaunch() {
            addCancelButton()
        }
    }
    
    func addCancelButton() {
        view.addSubview(cancel)
        cancel.addConstraintsToButton(&view, ratio)
    }
    
    func addTitleName() {
        view.addSubview(name)
        var tmpView = tableName as UIView
        name.addConstraintsToNameLabel(&tmpView, ratioName)
    }
    
    func addTableWithConstraints() {
        tableName.register(TableNameCell.self, forCellReuseIdentifier: "TableNameCell")
        tableName.dataSource = self
        tableName.delegate = self
        tableName.backgroundColor = UIColor.clear
        tableName.separatorColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        tableName.sectionHeaderHeight = 48 * multiplier
        tableName.sectionFooterHeight = 48 * multiplier
        tableName.headerView(forSection: 0)?.layer.cornerRadius = 16
        view.addSubview(tableName)
        tableName.translatesAutoresizingMaskIntoConstraints = false
        tableName.topAnchor.constraint(equalTo: view.topAnchor, constant: 156 * (UIScreen.main.bounds.width / 375)).isActive = true
        tableName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableName.heightAnchor.constraint(equalToConstant: 270 * multiplier).isActive = true
        tableName.widthAnchor.constraint(equalToConstant: 335 * multiplier).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableName.dequeueReusableCell(withIdentifier: "TableNameCell", for: indexPath)
        cell.textLabel?.text = "kek"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: 335 * multiplier, height: 50 * multiplier))
        header.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        let content = UILabel(frame: CGRect(x: 16 * multiplier, y: 16 * multiplier, width: 309 * multiplier, height: 24 * multiplier))
        content.numberOfLines = 0
        content.text = "players"
        content.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        content.font = UIFont(name: "Nunito-SemiBold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        content.attributedText = NSMutableAttributedString(string: "Players", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        header.addSubview(content)
        headerView.addSubview(header)
        let path0 = UIBezierPath(roundedRect: header.frame, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 16, height: 16))
        let layer0 = CAShapeLayer()
        layer0.backgroundColor = UIColor.yellow.cgColor
        layer0.path = path0.cgPath
        header.layer.mask = layer0
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let footer = UILabel(frame: CGRect(x: 0, y: 0, width: 335 * multiplier, height: 46 * multiplier))
        footer.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        let content = UILabel(frame: CGRect(x: 56 * multiplier, y: 14 * multiplier, width: 250 * multiplier, height: 24 * multiplier))
        content.numberOfLines = 0
        content.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        content.font = UIFont(name: "Nunito-SemiBold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        content.attributedText = NSMutableAttributedString(string: "Add player", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        footer.addSubview(content)
        footerView.addSubview(footer)
        let path0 = UIBezierPath(roundedRect: footer.frame, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        let layer0 = CAShapeLayer()
        layer0.backgroundColor = UIColor.yellow.cgColor
        layer0.path = path0.cgPath
        footer.layer.mask = layer0
        return footerView
    }
}

