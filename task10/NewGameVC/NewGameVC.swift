//
//  NewGameVC.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

class NewGameVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isFirst = true
    var gameVC = GameProcessVC()
    var cancel: UIButton?
    var name = UILabel("Game Counter")
    var bigContent = UIView(frame: UIScreen.main.bounds)
    var startGame = UIButton(startButtonName: "Start game")
    var tableName = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let multiplier = UIScreen.main.bounds.width / 375
    var players = Players.names
    var nameIndexPath = IndexPath()
    var ratio: CGRect {
        get {
            let x = 20 * multiplier
            let y = 37 * multiplier
            let h = 41 * multiplier
            let w: CGFloat = 100 * multiplier
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
        addScrollWithConstraints()
        addTableWithConstraints()
        addTitleName()
        if !UIApplication.isFirstLaunch() {
            let del = UIApplication.shared.delegate as! AppDelegate
            let vc = del.window?.rootViewController
            if vc is GameProcessVC {
                addCancelButton()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameVC.parentVC = self
        gameVC.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isFirst {
            dismiss(animated: true)
            present(gameVC, animated: true, completion: nil)
            isFirst = true
        }
    }
    
    func addCancelButton() {
        cancel = UIButton("Cancel")
        view.addSubview(cancel!)
        cancel!.addConstraintsToButton(&view, ratio)
        cancel!.addTarget(self, action: #selector(tapOnCancel(_:)), for: .touchUpInside)
    }
    
    func addTitleName() {
        bigContent.addSubview(name)
        var tmpView = tableName as UIView
        name.addConstraintsToNameLabel(&tmpView, ratioName)
    }
    
    func addScrollWithConstraints() {
        view.addSubview(bigContent)
        bigContent.translatesAutoresizingMaskIntoConstraints = false
        bigContent.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bigContent.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bigContent.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bigContent.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func addStartGameWithConstraints(_ margins: UIView) {
        startGame.translatesAutoresizingMaskIntoConstraints = false
        startGame.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: 65 * multiplier).isActive = true
        startGame.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        startGame.widthAnchor.constraint(equalToConstant: tableName.bounds.width).isActive = true
        startGame.heightAnchor.constraint(equalToConstant: 65 * multiplier).isActive = true
        startGame.addTarget(self, action: #selector(startGameTap(_:)), for: .touchUpInside)
    }
    
    func addTableWithConstraints() {
        tableName.register(TableNameCell.self, forCellReuseIdentifier: "TableNameCell")
        tableName.dataSource = self
        tableName.delegate = self
        tableName.backgroundColor = UIColor.clear
        tableName.separatorColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        tableName.headerView(forSection: 0)?.layer.cornerRadius = 16
        bigContent.addSubview(tableName)
        tableName.translatesAutoresizingMaskIntoConstraints = false
        tableName.topAnchor.constraint(equalTo: view.topAnchor, constant: 156 * multiplier).isActive = true
        tableName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableName.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableName.widthAnchor.constraint(equalToConstant: 335 * multiplier).isActive = true
        tableName.separatorStyle = .none
        tableName.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableName.dequeueReusableCell(withIdentifier: "TableNameCell", for: indexPath)
        cell.textLabel?.addStyleToNameLabelInTable(name: players[indexPath.row])
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleRemove(_:)))
        cell.imageView?.tag = indexPath.row
        cell.imageView?.isUserInteractionEnabled = true
        cell.imageView?.addGestureRecognizer(tap)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        nameIndexPath = indexPath
        cell.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        cell.setSelected(true, animated: false)
        cell.showsReorderControl = true
        cell.setEditing(true, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        300 * multiplier
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        54 * multiplier
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: tableName.frame.width, height: 54 * multiplier))
        header.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        let content = UILabel(frame: CGRect(x: 24 * multiplier, y: 16 * multiplier, width: 309 * multiplier, height: 24 * multiplier))
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
        let footer = UIView(frame: CGRect(x: 0, y: -1 * multiplier, width: tableName.frame.width, height: 70 * multiplier))
        footer.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        let imgView = UIImageView(frame: CGRect(x: 16 * multiplier, y: footer.bounds.height / 2 - (14 * multiplier), width: 30 * multiplier, height: 30 * multiplier))
        imgView.image = UIImage(named: "add")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tap)
        footer.addSubview(imgView)
        let lineView = UIView(frame: CGRect(x: 18 * multiplier, y: 0, width: footer.bounds.width - 18 * multiplier, height: 0.8))
        lineView.backgroundColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        footer.addSubview(lineView)
        let content = UILabel(frame: CGRect(x: 56 * multiplier, y: footer.bounds.height / 2 - (15 * multiplier), width: 250 * multiplier, height: 30 * multiplier))
        content.numberOfLines = 0
        content.textColor = UIColor(red: 0.518, green: 0.722, blue: 0.678, alpha: 1)
        content.font = UIFont(name: "Nunito-SemiBold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        content.attributedText = NSMutableAttributedString(string: "Add player", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        footer.addSubview(content)
        footerView.addSubview(footer)
        let path0 = UIBezierPath(roundedRect: footer.frame, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        let layer0 = CAShapeLayer()
        layer0.path = path0.cgPath
        footer.layer.mask = layer0
        footerView.addSubview(startGame)
        startGame.layer.cornerRadius = 30 * multiplier
        addStartGameWithConstraints(footer)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if (sourceIndexPath != destinationIndexPath) {
            let player = players[sourceIndexPath.row]
            players.remove(at: sourceIndexPath.row)
            players.insert(player, at: destinationIndexPath.row)
            tableName.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        }
        tableName.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Remove"
    }
    
    func checkIfEmpty() {
        if players.isEmpty {
            startGame.isUserInteractionEnabled = false
            startGame.alpha = 0.5
        }
        else {
            startGame.isUserInteractionEnabled = true
            startGame.alpha = 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        checkIfEmpty()
    }
    
    // MARK: action
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        print("add")
        let addVC = AddPlayerVC()
        self.addChildVC(addVC)
    }
    
    @objc func handleRemove(_ sender: UITapGestureRecognizer? = nil) {
        print("remove")
        let tmpView = sender!.view as! UIImageView
        players.remove(at: tmpView.tag)
        checkIfEmpty()
        tableName.reloadData()
    }
    
    @objc func startGameTap(_ sender: UIButton) {
        print("start game")
        present(gameVC, animated: true, completion: nil)
    }
    
    @objc func tapOnCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}


