//
//  HomeHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 14.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeHeader: BaseCell, UITableViewDelegate, UITableViewDataSource, StatisticsCellDelegate {
    
    let defaultId = "defaultId"
    let cellId = "cellId"
    let notificationId = "notificationId"
    let messageId = "messageId"
    let statisticsId = "statisticsId"
    let newRewardsId = "newRewardsId"
    let eventInvitationId = "eventInvitationId"
    let leaderboardId = "leaderboardId"
    
    var homeController: HomeController?
    var avatarImage: UIImage?
    
    var statisticsCellHeight: CGFloat = 46 {
        didSet {
            
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.allowsSelection = false
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        setupTableView()
        
        tableView.backgroundColor = ColorCodes.controllerBackground
        
        addSubview(tableView)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultId)
        tableView.register(WelcomeCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SystemMessageCell.self, forCellReuseIdentifier: notificationId)
        tableView.register(NewMessagesCell.self, forCellReuseIdentifier: messageId)
        tableView.register(StatisticsCell.self, forCellReuseIdentifier: statisticsId)
        tableView.register(NewRewardsCell.self, forCellReuseIdentifier: newRewardsId)
        tableView.register(EventInvitationCell.self, forCellReuseIdentifier: eventInvitationId)
        tableView.register(LeaderboardHomeCell.self, forCellReuseIdentifier: leaderboardId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 218
        case 1:
            return 100
        case 2:
            return 75
        case 3:
            return 46
        case 4:
            return 154
        case 5:
            return 412
        case 6:
            return 199
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WelcomeCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: notificationId, for: indexPath) as! SystemMessageCell
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: messageId, for: indexPath) as! NewMessagesCell
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: statisticsId, for: indexPath) as! StatisticsCell
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: newRewardsId, for: indexPath) as! NewRewardsCell
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: eventInvitationId, for: indexPath) as! EventInvitationCell
            
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: leaderboardId, for: indexPath) as! LeaderboardHomeCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultId, for: indexPath)
            
            return cell
        }
    }
    
    
}

