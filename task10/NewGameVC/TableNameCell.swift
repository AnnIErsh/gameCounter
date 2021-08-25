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
        self.backgroundColor = self.superview?.backgroundColor
        self.selectionStyle = .none

      }
}
