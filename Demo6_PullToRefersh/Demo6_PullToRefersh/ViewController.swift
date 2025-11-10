//
//  ViewController.swift
//  Demo6_PullToRefersh
//
//  Created by Tao on 2025/11/10.
//

import UIKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {

    private var index = 0
    
    private let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    
    private let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    private let id = "reuseCell"
    
    private var data = [String]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        refreshControl.attributedTitle = NSAttributedString(string: "上次更新在：\(Date())",attributes: attributes)
        
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
        refreshControl.tintColor = .white
        refreshControl.backgroundColor = .black
        return refreshControl
    }()
    
    @objc func pullToRefresh() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2 ) {
            self.data.append(self.newFavoriteEmoji[self.index])
            self.index += 1
            self.index %= self.newFavoriteEmoji.count
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        tableView.refreshControl = self.refreshControl
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = favoriteEmoji
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
