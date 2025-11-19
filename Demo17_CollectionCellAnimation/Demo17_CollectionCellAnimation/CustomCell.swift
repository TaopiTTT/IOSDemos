//
//  CustomCell.swift
//  Demo17_CollectionCellAnimation
//
//  Created by Tao on 2025/11/19.
//
import UIKit

class CustomCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth - 60, height: 400))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(imageView)
//        backgroundColor = UIColor(red: 240 / 255, green: 248 / 255, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.4
//        layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
}


