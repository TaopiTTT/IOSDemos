//
//  LoginController.swift
//  Demo11_login
//
//  Created by Tao on 2025/11/12.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 75, y: 50, width: 150, height: 50))
        label.text = "Welcome"
        label.textAlignment = .center
        label.font = UIFont.init(name: "Avenir Next Regular", size: 25)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: 50, height: 50))
        button.setImage(UIImage(named: "Back-icon"), for: .normal)
        button.addTarget(self, action: #selector(clickLeftButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
    lazy var userNameTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: ScreenWidth / 2 - 150, y: 200, width: 300, height: 50))
        textfield.layer.cornerRadius = 5
        textfield.attributedPlaceholder = NSAttributedString(string: "username")
        textfield.backgroundColor = .white
        textfield.delegate = self
        return textfield
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: ScreenWidth / 2 - 150, y: 280, width: 300, height: 50))
        textField.attributedPlaceholder = NSAttributedString(string: "password")
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 75, y: 360, width: 150, height: 40))
        button.backgroundColor = UIColor(red: 34 / 255, green: 139 / 255, blue: 34 / 255, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickLoginButton() {
        // 弹簧效果
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.loginButton.frame = CGRect(x: ScreenWidth / 2 - 75 - 20, y: 360, width: 150 + 40, height: 40)
        }) { (finished) in
            self.loginButton.frame = CGRect(x: ScreenWidth / 2 - 75, y: 360, width: 150, height: 40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .secondarySystemBackground
        self.view.addSubview(titleLabel)
        self.view.addSubview(leftButton)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.userNameTextField.center.x = -200
        self.passwordTextField.center.x = -200
        self.loginButton.center.x = -200
    }
    
    // 实现依次飘入的效果
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.userNameTextField.center.x = ScreenWidth / 2
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.10, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.passwordTextField.center.x = ScreenWidth / 2
            }, completion: nil)
        
            UIView.animate(withDuration: 0.5, delay: 0.20, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.loginButton.center.x = ScreenWidth / 2
            }, completion: nil)
    }
    
}
