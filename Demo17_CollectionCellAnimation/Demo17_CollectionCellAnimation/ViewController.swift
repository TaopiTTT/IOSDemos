//
//  ViewController.swift
//  Demo17_CollectionCellAnimation
//
//  Created by Tao on 2025/11/19.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    let id = "reusedCell"
    
    var selectedCell: CustomCell?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: ScreenWidth-60, height: 400)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCell.classForCoder(), forCellWithReuseIdentifier: id)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Card Animation"
        view.addSubview(collectionView)
        navigationController?.navigationBar.isHidden = true
        navigationController?.delegate = self
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CustomCell
        switch indexPath.row {
        case 0:
            cell.imageView.image = UIImage(named: "1")
        case 1:
            cell.imageView.image = UIImage(named: "2")
        case 2:
            cell.imageView.image = UIImage(named: "3")
        case 3:
            cell.imageView.image = UIImage(named: "4")
        default:
            cell.imageView.image = UIImage(named: "5")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath) as? CustomCell
        let detailVC = DetailViewController(image: (selectedCell?.imageView.image)!)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}

extension ViewController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationController.Operation.push {
            return PushAnimationController()
        } else {
            return PopAnimationController()
        }
    }

}
