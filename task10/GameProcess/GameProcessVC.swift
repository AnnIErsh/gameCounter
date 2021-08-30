//
//  GameProcessVC.swift
//  task10
//
//  Created by Anna Ershova on 29.08.2021.
//

import UIKit

class GameProcessVC: UIViewController {

    weak var parentVC: NewGameVC?
    var left: UIImageView?
    var right: UIImageView?
    var currentTitle = UILabel() {
        didSet {
            oldValue.textColor = timer.textColor
        }
    }
    var scrollDetermined = false
    var size = CGSize(width: 0, height: 0)
    var reset = UIImageView(image: UIImage(named: "Reset"))
    var newGame = UIButton("New Game")
    var results = UIButton("Results")
    var game = UILabel("Game")
    var timer = UILabel(timerName: "15:00")
    var dice = UIImageView(image: UIImage(named: "Dice_4"))
    var play = PlayButton()
    var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(GameCell.self, forCellWithReuseIdentifier: "GameCell")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GameHeader")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "GameFooter")
        cv.showsHorizontalScrollIndicator = false
        //cv.isPagingEnabled = true
        //cv.decelerationRate = UIScrollView.DecelerationRate.fast
        return cv
    }()
    
    var container0: UIView = {
        let m = UIScreen.main.bounds.width / 375
        let circle = UIButton(bigCircleName: "+1")
        let right = UIImageView(image: UIImage(named: "Next"))
        let left = UIImageView(image: UIImage(named: "Previous"))
        let container = UIView()
        container.addSubview(circle)
        container.addSubview(right)
        container.addSubview(left)
        circle.addConstraintsToCircle(multiplier: m)
        left.addConstraintsToLeftArrow(circle, multiplier: m)
        right.addConstraintsToRightArrow(circle, multiplier: m)
        return container
    }()
    
    var container1: UIStackView = {
        let m = UIScreen.main.bounds.width / 375
        var arr: Array<UIButton> = []
        let numbs = ["-10", "-5", "-1", "+5", "+10"]
        for i in 0 ... 4 {
            let circle = UIButton(circleName: numbs[i])
            circle.frame = CGRect(x: 0, y: 0, width: 55 * m, height: 55 * m)
            arr.append(circle)
        }
        let container = UIStackView(arrangedSubviews: arr)
        container.axis = .horizontal
        container.alignment = .fill
        container.distribution = .fillEqually
        container.spacing = 25 * m
        return container
    }()
    
    var pageSrack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.136, green: 0.136, blue: 0.138, alpha: 1).cgColor
        parentVC = parent as? NewGameVC
        addHeaderAndTimer()
        currentTitle = pageSrack.arrangedSubviews[0] as! UILabel
        currentTitle.textColor = .white
        left = container0.subviews[2] as? UIImageView
        left!.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(pushPrevious(_:)))
        left!.addGestureRecognizer(tap)
        right = container0.subviews[1] as? UIImageView
        right!.isUserInteractionEnabled = true
        let tapNext = UITapGestureRecognizer(target: self, action: #selector(pushNext(_:)))
        right!.addGestureRecognizer(tapNext)
    }
    
        
    func addHeaderAndTimer() {
        view.addSubview(newGame)
        view.addSubview(results)
        view.addSubview(cv)
        view.addSubview(game)
        view.addSubview(dice)
        newGame.addConstraintsToButton(&view, parentVC!.ratio)
        results.addConstraintsToButtonReverse(&view, parentVC!.ratio)
        var tmp = newGame as UIView
        game.addConstraintsToHeader(&tmp, multiplier: parentVC!.multiplier, newGame, parentVC!.name)
        dice.addConstraintsToDice(multiplier: parentVC!.multiplier, results)
        cv.addConstraintsToCV(multiplier: parentVC!.multiplier, game)
        cv.delegate = self
        cv.dataSource = self
        view.addSubview(timer)
        timer.addConstraintsToToTimer(cv as UIView, multiplier: parentVC!.multiplier)
        view.addSubview(play)
        play.addConstraintsToPlay(timer, multiplier: parentVC!.multiplier)
        view.addSubview(container1)
        container1.addConstraintsToConteiner1(cv as UIView, multiplier: parentVC!.multiplier)
        view.addSubview(container0)
        container0.addConstraintsToConteiner0(container1, multiplier: parentVC!.multiplier)
        cv.backgroundColor = view.backgroundColor
        addPageTitles()
        container1.addSubview(pageSrack)
        pageSrack.addConstrainsToPage(parentVC!.multiplier)
        container1.addSubview(reset)
        reset.addConstraintsToReset(multiplier: parentVC!.multiplier)
    }
    
    func addPageTitles() {
        let tmp: [String] = parentVC!.players
        let res: Array<String> = tmp.map({ String($0.prefix(1)) })
        let m = UIScreen.main.bounds.width / 375
        var arr: Array<UILabel> = []
        for i in 0 ... res.count - 1 {
            let letter = UILabel(title: res[i])
            letter.backgroundColor = cv.backgroundColor
            letter.frame = CGRect(x: 0, y: 0, width: 15 * m, height: 20 * m)
            arr.append(letter)
        }
        pageSrack = UIStackView(arrangedSubviews: arr)
        pageSrack.axis = .horizontal
        pageSrack.alignment = .center
        pageSrack.distribution = .equalCentering
        pageSrack.spacing = 5 * m
    }
    
    @objc func pushPrevious(_ sender: UITapGestureRecognizer) {
        let x = Int(cv.contentOffset.x) / Int(cv.frame.width)
        let path = IndexPath(row: x, section: 0)
        collectionView(cv, didSelectItemAt: path)
    }
    
    @objc func pushNext(_ sender: UITapGestureRecognizer) {
        var indexes = cv.indexPathsForVisibleItems
        indexes.sort()
        let index = indexes.last!
        collectionView(cv, didSelectItemAt: index)
    }
    
    func checkArrows(_ indexPath: IndexPath) {
        if indexPath.row == 0 {
            left?.image = UIImage(named: "Previous")
            right?.image = UIImage(named: "Next")
        }
        else if indexPath.row == parentVC!.players.count - 1 {
            left?.image = UIImage(named: "NextLeft")
            right?.image = UIImage(named: "PreviousRight")
        }
        else {
            left?.image = UIImage(named: "NextLeft")
            right?.image = UIImage(named: "Next")
        }
    }
}

class PlayButton: UIButton {
    
    var tapped = false
    
    func addConstraintsToPlay(_ margins: UILabel, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 26).isActive = true
        self.widthAnchor.constraint(equalToConstant: 26).isActive = true
        self.leadingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setBackgroundImage(UIImage(named: "Play"), for: .normal)
        self.setBackgroundImage(UIImage(named: "Pause"), for: .selected)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addTarget(self, action: #selector(tapOnButton(_:)), for: .touchUpInside)
    }
    
    @objc func tapOnButton(_ sender: UIButton) {
        tapped = !tapped
        if tapped {
            self.isSelected = true
        }
        else {
            self.isSelected = false
        }
    }
}
