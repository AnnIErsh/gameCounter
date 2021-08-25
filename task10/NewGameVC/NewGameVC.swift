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
            let w = 53 * multiplier
            return CGRect(x: x, y: y, width: w, height: h)
        }
    }
    
    var ratioName: CGRect {
        get {
            let x = 20 * multiplier
            let y = 90 * multiplier
            let h = 41 * multiplier
            let w = 243 * multiplier
            return CGRect(x: x, y: y, width: w, height: h)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.136, green: 0.136, blue: 0.138, alpha: 1).cgColor
        if !UIApplication.isFirstLaunch() {
            addCancelButton()
        }
        addTitleName()
        addTableWithConstraints()
    }
    
    func addCancelButton() {
        view.addSubview(cancel)
        cancel.addConstraintsToButton(&view, ratio)
    }
    
    func addTitleName() {
        view.addSubview(name)
        name.addConstraintsToNameLabel(&view, ratioName)
    }
    
    func addTableWithConstraints() {
        tableName.register(TableNameCell.self, forCellReuseIdentifier: "TableNameCell")
        tableName.dataSource = self
        tableName.delegate = self
        tableName.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        tableName.separatorColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        tableName.sectionHeaderHeight = 48 * multiplier
        tableName.headerView(forSection: 0)?.layer.cornerRadius = 16
        view.addSubview(tableName)
        tableName.translatesAutoresizingMaskIntoConstraints = false
        tableName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 25 * (UIScreen.main.bounds.width / 375)).isActive = true
        tableName.leadingAnchor.constraint(equalTo: name.leadingAnchor).isActive = true
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
        let header = UILabel(frame: CGRect(x: 16 * multiplier, y: 16 * multiplier, width: 309 * multiplier, height: 24 * multiplier))
        //header.backgroundColor = UIColor.green
        header.numberOfLines = 0
        header.text = "players"
        header.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        header.font = UIFont(name: "Nunito-SemiBold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        header.attributedText = NSMutableAttributedString(string: "Players", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        headerView.addSubview(header)
        return headerView
    }
}

