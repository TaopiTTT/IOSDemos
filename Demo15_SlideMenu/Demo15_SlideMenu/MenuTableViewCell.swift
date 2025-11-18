//
//  MenuTableViewCell.swift
//  Demo15_SlideMenu
//
//  Created by Tao on 2025/11/18.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var headLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: 300, height: 30))
        label.font = UIFont.systemFont(ofSize: 26)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.addSubview(headLabel)
    }
}
