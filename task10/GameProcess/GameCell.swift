//
//  GameCell.swift
//  task10
//
//  Created by Anna Ershova on 29.08.2021.
//

import UIKit

class GameCell: UICollectionViewCell {
    let nameAndScore: (UILabel, UILabel) = {
        let name = UILabel()
        let score = UILabel()
        
        return (name, score)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
