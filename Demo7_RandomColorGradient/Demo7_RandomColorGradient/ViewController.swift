//
//  ViewController.swift
//  Demo7_RandomColorGradient
//
//  Created by Tao on 2025/11/10.
//

import UIKit
import AVFoundation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var button:UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 - 100, width: 200, height: 200))
        button.setImage(UIImage(named: "music play"), for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    
    var audioPlayer: AVAudioPlayer?
    
    var timer: Timer?
    
    var backgroundColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: 1.0 - backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: 1.0 - backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    
    // 用于隐藏状态栏 需要设置View controller-based status bar appearance 为 YES
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func tapButton() {
        let bgmusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Legends Never Die", ofType: ".mp3")!)
        do {
                    
                try AVAudioSession.sharedInstance().setCategory(.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                try audioPlayer = AVAudioPlayer(contentsOf: bgmusic)
                
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                
            }
            catch let audioError as NSError {
                print(audioError)
            }
            
            if (timer == nil) {
                timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
            }
            
            let redValue = CGFloat(drand48())
            let blueValue =  CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            
            self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
            gradientLayer.frame = view.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
            self.view.layer.addSublayer(gradientLayer)
            
            button.isEnabled = false
    }

    @objc func randomColor() {
            let redValue = CGFloat(drand48())
            let blueValue =  CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            backgroundColor = (redValue, blueValue, greenValue, 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
    }


}

