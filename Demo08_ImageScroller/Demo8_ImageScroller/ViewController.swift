//
//  ViewController.swift
//  Demo8_ImageScroller
//
//  Created by Tao on 2025/11/11.
//

import UIKit

let frame = UIScreen.main.bounds

class ViewController: UIViewController {
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "steve")
        return imageView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: frame.width / 2 - 160, y: frame.height / 2 - 160, width: 320, height: 320))
        imageView.image = UIImage(named: "steve")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: frame)
        scrollView.contentSize = self.imageView.bounds.size
        scrollView.addSubview(self.imageView)
        scrollView.delegate = self
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        scrollView.maximumZoomScale = 10.0
        scrollView.minimumZoomScale = 1.0
        self.view.addSubview(backImageView)
        self.view.addSubview(effectView)
        self.view.addSubview(scrollView)
    }

}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

