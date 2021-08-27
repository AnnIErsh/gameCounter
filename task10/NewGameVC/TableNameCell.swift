//
//  TableNameCell.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

class TableNameCell: UITableViewCell {
    
    var reorderImg: UIImage?
    let multiplier = UIScreen.main.bounds.width / 375
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundView = UIView(frame: CGRect(x: 16 * multiplier, y: self.bounds.height - 0.2, width: self.bounds.width - 16 * multiplier, height: 0.5))
        self.backgroundView?.backgroundColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        self.selectionStyle = .none
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        for tmpView in self.subviews {
            if tmpView.classForCoder.description() == "UITableViewCellReorderControl" {
                for subview in tmpView.subviews {
                    if subview.isKind(of: UIImageView.classForCoder()) {
                        let imageView = subview as! UIImageView
                        if self.reorderImg == nil {
                            let img = imageView.image
                            reorderImg = img?.withRenderingMode(.alwaysTemplate)
                        }
                        imageView.image = self.reorderImg;
                        imageView.tintColor = .white
                        break
                    }
                }
                break
            }
        }
    }
}
