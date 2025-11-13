//
//  ViewController.swift
//  Demo11_login
//
//  Created by Tao on 2025/11/12.
//

import UIKit
import AVKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: ScreenWidth / 2 - 167, y: 50, width: 334, height: 100))
        let image = UIImage(named: "logo")
        imageView.image = image
        return imageView
    }()
    
    lazy var loginbtn: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: ScreenHeight - 50, width: ScreenWidth / 2, height: 50)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickButton() {
        let loginViewController = 
    }
    
    lazy var signUpBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: ScreenWidth / 2, y: ScreenHeight - 50, width: ScreenWidth / 2, height: 50))
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Register", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        return btn
    }()
    
    lazy var backgroundPlayer: AVPlayer = {
        let path = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: url)
        return player
    }()
    
    func backgroundVideo() {
        let playerLayer = AVPlayerLayer(player: backgroundPlayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 50)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(playerLayer)
        backgroundPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundVideo()
        self.view.addSubview(logoImageView)
        self.view.addSubview(loginbtn)
        self.view.addSubview(signUpBtn)
        NotificationCenter.default.addObserver(self, selector: #selector(didFinished(notification:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: backgroundPlayer.currentItem)
    }
    
    @objc func didFinished(notification: Notification){
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
            backgroundPlayer.play()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

