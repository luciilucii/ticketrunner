//
//  MessagesController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class MessagesController: UITableViewController {
    
    var titleLabel: UILabel!
    let titleString = "Messages"
    
    let cellId = "cellId"
    
    var messages = [Message]()
    var messagesDictionary = [String: Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        setupMenuBar()
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showChatControllerForUser()
        
    }
    
    func showChatControllerForUser(/*user: User*/) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    var menu: Menu!
    
    func handleMenu() {
        menu.showMenu()
        
    }
    
    func setupViews() {
        
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "\(titleString)"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
}

