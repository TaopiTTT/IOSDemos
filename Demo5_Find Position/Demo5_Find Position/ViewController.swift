//
//  ViewController.swift
//  Demo5_Find Position
//
//  Created by Tao on 2025/11/9.
//

//README: 若要正常使用定位功能，请修改info.plist，需要添加Privacy - Location When In Use Usage Description

import UIKit
// 定位需要的框架
import CoreLocation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {

    lazy var backgroundView:UIImageView = {
        let image = UIImage(named: "bg")
        let imageView = UIImageView(image: image)
        imageView.frame = frame
        return imageView
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 163, y: ScreenHeight - 150, width: 326, height: 78))
        button.setTitle("我在哪？", for: .normal)
        let image = UIImage(named: "Find my location")
        button.setBackgroundImage(image, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
        button.addTarget(self, action: #selector(requestMyLocation), for: .touchUpInside)
        return button
    }()
    
    @objc func requestMyLocation() {
        locationManager.requestWhenInUseAuthorization()//请求定位
        locationManager.startUpdatingLocation()//更新定位
    }
    
    lazy var label:UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 163, y: 100, width: 326, height: 90))
        label.text = "请按下按钮查看当前位置..."
        label.font = UIFont.init(name: "AvenirNextCondensed-Italic", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(backgroundView)
        self.view.addSubview(effectView)
        self.view.addSubview(button)
        self.view.addSubview(label)
    }
    
    // 手机状态栏设置
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        locationToCity(location: location)
    }
    
    func locationToCity(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil {
                let array = placeMark! as NSArray
                let mark = array.firstObject as! CLPlacemark
                let country = mark.country!
                let city = mark.locality!
                self.label.text = "Country: \(String(describing: country))\n City: \(String(describing: city))"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.label.text = "出错了！" + error.localizedDescription
    }
}
