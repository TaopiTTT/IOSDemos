//
//  ViewController.swift
//  Demo4_Carousel Effect
//
//  Created by Tao on 2025/11/9.
//

import UIKit

let frame = UIScreen.main.bounds
let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    // private无法在class以外访问
    fileprivate let id = "reuseCell"
    
    let data = Model.creatModelArray()
    
    // 背景图片加载
    lazy var backImageView:UIImageView = {
        let imageView = UIImageView(frame: frame)
        let image = #imageLiteral(resourceName: "blue")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    // 背景效果
    lazy var effectView:UIVisualEffectView = {
        // 模糊效果
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: ScreenWidth / 2 - 195, y: ScreenHeight / 2 - 220, width: 390, height: 440), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.classForCoder(), forCellWithReuseIdentifier: id)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backImageView)
        self.view.addSubview(effectView)
        self.view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CustomCell
        cell.info = data[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 420)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let originpoint = targetContentOffset.pointee
        var index = Int(originpoint.x / 410)
        let offset = Int(originpoint.x) % Int(410)
        index += (offset > Int(410/2)) ? 1 : 0
        targetContentOffset.pointee = CGPoint(x: index * Int(410), y: 0)
    }
}
