//
//  HomeHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 14.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeHeader: BaseCell, UITableViewDelegate, UITableViewDataSource, StatisticsCellDelegate, SystemMessageCellDelegate, NewMessagesCellDelegate {
    
    var homeCells = [WelcomeCell.self, SystemMessageCell.self, NewMessagesCell.self, StatisticsCell.self, NewRewardsCell.self, EventInvitationCell.self, LeaderboardHomeCell.self]
    
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
    
    var statisticsCellHeight: CGFloat = 54 {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.allowsSelection = false
        tv.separatorStyle = .none
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        setupTableView()
        
        clipsToBounds = true
        
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
        
        let type = homeCells[indexPath.row]
        
        switch type {
        case _ where type == WelcomeCell.self:
            return 226
        case _ where type == SystemMessageCell.self:
            return 108
        case _ where type == NewMessagesCell.self:
            return 83
        case _ where type == StatisticsCell.self:
            return statisticsCellHeight
        case _ where type == NewRewardsCell.self:
            return 162
        case _ where type == EventInvitationCell.self:
            return 420
        case _ where type == LeaderboardHomeCell.self:
            return 207
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeCells.count
    }
    
    var systemMessageContained = false
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type = homeCells[indexPath.row]
        
        switch type {
        case _ where type == WelcomeCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WelcomeCell
            
            cell.homeController = self.homeController
            
            return cell
        case _ where type == SystemMessageCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: notificationId, for: indexPath) as! SystemMessageCell
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            return cell
        case _ where type == NewMessagesCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: messageId, for: indexPath) as! NewMessagesCell
            
            cell.delegate = self
            
            return cell
        case _ where type == StatisticsCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: statisticsId, for: indexPath) as! StatisticsCell
            
            cell.delegate = self
            
            return cell
        case _ where type == NewRewardsCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: newRewardsId, for: indexPath) as! NewRewardsCell
            
            return cell
        case _ where type == EventInvitationCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: eventInvitationId, for: indexPath) as! EventInvitationCell
            
            return cell
        case _ where type == LeaderboardHomeCell.self:
            let cell = tableView.dequeueReusableCell(withIdentifier: leaderboardId, for: indexPath) as! LeaderboardHomeCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultId, for: indexPath)
            
            return cell
        }
    }
    
    func didTapCancel(indexPath: IndexPath) {
        self.homeCells.remove(at: indexPath.item)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 1 {
            return true
        } else {
            return false
        }
    }
    
    func didTapOnCell() {
        self.homeController?.menu?.showMessagesController()
    }
    
    func handleUpDown(buttonState: ButtonState) {
        if buttonState == .down {
            self.statisticsCellHeight = 195
        } else {
            self.statisticsCellHeight = 54
        }
    }
}

