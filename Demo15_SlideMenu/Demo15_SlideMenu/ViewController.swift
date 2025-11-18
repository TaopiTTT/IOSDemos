//
//  ViewController.swift
//  Demo15_SlideMenu
//
//  Created by Tao on 2025/11/17.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {

    let id = "reusedCell"
    
    lazy var leftBarButtonItem: UIBarButtonItem = {
        let image = UIImage(named: "menu")
        let button = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(clickLeftBarButton))
        return button
    }()
    
    @objc func clickLeftBarButton(){
        
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 88, width: ScreenWidth, height: ScreenHeight - 88))
        tableView.register(MainCell.classForCoder(), forCellReuseIdentifier: id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.title = "Everyday Moments"
        self.view.addSubview(tableView)
    }


}

