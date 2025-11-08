//
//  ViewController.swift
//  Demo2_StopWatch
//
//  Created by Tao on 2025/11/7.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    
    
    lazy var resetButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: ScreenWidth*0.75, y: 40, width: 80, height: 60)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.setTitle("Reset", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(tapResetButton), for: .touchUpInside)
        return button
    }()
    
    lazy var startButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: ScreenHeight*0.7, width: ScreenWidth*0.5, height: ScreenHeight*0.3)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        
        button.setImage(UIImage(named: "start"), for: .normal)
        button.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)
        return button
    }()
    
    lazy var stopButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: ScreenWidth*0.5,y: ScreenHeight*0.7, width: ScreenWidth*0.5, height: ScreenHeight*0.3)
        
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        
        button.setImage(UIImage(named: "pause"),for: .normal)
        button.addTarget(self, action: #selector(tapPauseButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapStartButton() {
        
    }
    
    @objc func tapPauseButton() {
        
    }
    
    @objc func tapResetButton() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(resetButton)
        self.view.addSubview(startButton)
        self.view.addSubview(stopButton)
    }


}

