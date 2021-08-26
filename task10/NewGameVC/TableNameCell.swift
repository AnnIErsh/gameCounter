//
//  TableNameCell.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

class TableNameCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(red: 0.231, green: 0.231, blue: 0.231, alpha: 1)
        self.selectionStyle = .none
      }
}
