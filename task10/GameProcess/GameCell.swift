//
//  GameCell.swift
//  task10
//
//  Created by Anna Ershova on 29.08.2021.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    var nameAndScore: (String, CGFloat)?
    let multiplier = UIScreen.main.bounds.width / 375
    var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = UIColor(red: 0.922, green: 0.682, blue: 0.408, alpha: 1)
        name.font = UIFont(name: "Nunito-ExtraBold", size: 28)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        name.attributedText = NSMutableAttributedString(string: "SMB", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return name
    }()
    
    var scoreLabel: UILabel = {
        let score = UILabel()
        score.textColor = UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1)
        score.font = UIFont(name: "Nunito-ExtraBold", size: 100)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        score.attributedText = NSMutableAttributedString(string: "15", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return score
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        contentView.addSubview(scoreLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24 * multiplier).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
