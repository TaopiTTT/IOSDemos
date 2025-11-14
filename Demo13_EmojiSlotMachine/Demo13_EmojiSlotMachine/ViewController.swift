//
//  ViewController.swift
//  Demo13_EmojiSlotMachine
//
//  Created by Tao on 2025/11/14.
//

import UIKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {

    let imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    lazy var goButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 + 150, width: 200, height: 50))
        button.layer.cornerRadius = 10
        button.setTitle("Go", for: .normal)
        button.setTitleColor(UIColor.systemGreen, for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(clickGoButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func clickGoButton(_ button: UIButton) {
        let index1 = Int(arc4random()) % 20
        let index2 = Int(arc4random()) % 20
        let index3 = Int(arc4random()) % 20
        
        emojiPickerView.selectRow(index1, inComponent: 0, animated: true)
        emojiPickerView.selectRow(index2, inComponent: 1, animated: true)
        emojiPickerView.selectRow(index3, inComponent: 2, animated: true)
        
        if (dataArray1[index1] == dataArray2[index2] && dataArray2[index2] == dataArray3[index3] ) {
            resultLabel.text = "😄"
        } else {
            resultLabel.text = "💔"
        }
    }
    
    lazy var resultLabel :UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: ScreenHeight - 200, width: 100, height: 50))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "💔"
        return label
    }()
    
    // 滚轮选择器
    lazy var emojiPickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: CGRect(x: 10, y: ScreenHeight / 2 - 100, width: ScreenWidth - 20, height: 200))
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    func initData() {
        for _ in 0...20 {
            dataArray1.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.view.addSubview(goButton)
        self.view.addSubview(resultLabel)
        self.view.addSubview(emojiPickerView)
    }
}

extension ViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont.systemFont(ofSize: 60)
        if component == 0 {
            pickerLabel.text = imageArray[dataArray1[row]]
        } else if component == 1 {
            pickerLabel.text = imageArray[dataArray2[row]]
        } else {
            pickerLabel.text = imageArray[dataArray3[row]]
        }
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
}
