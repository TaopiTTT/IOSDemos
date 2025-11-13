//
//  MovieCell.swift
//  Demo3_PlayLocalVideo
//
//  Created by Tao on 2025/11/8.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
}

class MovieCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 220))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth/4, y: 170, width: ScreenWidth/2, height: 20))
        label.font = UIFont(name: "Avenir Next Heavy", size: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var sourceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth/4, y: 190, width: ScreenWidth/2, height: 20))
        label.font = UIFont(name: "Avenir Next Regular", size: 8)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth/4, y: 57, width: ScreenWidth/2, height: 100))
        button.setImage(UIImage(named: "playBtn"), for: .normal)
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(backImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(sourceLabel)
        self.contentView.addSubview(button)
    }
    
}
