//
//  HomeTableController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 21.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MobileCoreServices
import Intercom
import Alamofire

class HomeTableController: UITableViewController, SystemMessageCellDelegate, NewMessagesCellDelegate, StatisticsCellDelegate, EventCellDelegate, ExpiredEventHeaderCellDelegate {
    
    var homeCells = [WelcomeCell.self, SystemMessageCell.self, NewMessagesCell.self, StatisticsCell.self, NewRewardsCell.self, EventInvitationCell.self, LeaderboardHomeCell.self]
    
    let defaultId = "defaultId"
    let cellId = "cellId"
    let notificationId = "notificationId"
    let messageId = "messageId"
    let statisticsId = "statisticsId"
    let newRewardsId = "newRewardsId"
    let eventInvitationId = "eventInvitationId"
    let leaderboardId = "leaderboardId"
    let eventId = "eventId"
    let noEventCell = "noEventCell"
    let expiredEventHeaderId = "expireEventHeaderId"
    let expiredId = "expiredId"
    
    
//    var homeController: HomeController? {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    var avatarImage: UIImage?
    
    var statisticsCellHeight: CGFloat = 74 {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    let userResource = UserResource()
    
    var currentUser: User? {
        didSet {
            guard let user = currentUser else {
                return
            }
            
            guard let userName = user.firstname else {
                return
            }
        }
    }
    
    var alreadyAnimatedArray = [Int]()
    
    var menu: Menu?
    var userImage: UIImage? {
        didSet{
            tableView.reloadData()
        }
    }
    
    var userEvents = [Event]() {
        didSet {
            userEvents.forEach { (event) in
                self.homeCells.append(EventTableCell.self)
            }
            self.homeCells.append(ExpiredEventHeaderCell.self)
            tableView.reloadData()
        }
    }
    
    var expiredEvents = [Event]() {
        didSet {
            expiredEvents.forEach { (event) in
                self.homeCells.append(ExpiredEventTableCell.self)
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        checkIfMenuIsSet()
        setupWhiteTitle(title: "Home")
        setupMenuBar()
        
        userEvents = EventResource().getEvents()
        
        
    }
    
    func checkIfMenuIsSet() {
        if menu == nil {
            menu = Menu()
            menu?.startController = self
        }
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        
        navigationItem.leftBarButtonItem = menuButton
    }
    
    @objc func handleMenu() {
        menu?.showMenu()
        menu?.homeController = self
    }
    
    fileprivate func setupViews() {
        setupTableView()
        
        tableView.backgroundColor = ColorCodes.controllerBackground
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 8, 0)
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultId)
        tableView.register(WelcomeCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SystemMessageCell.self, forCellReuseIdentifier: notificationId)
        tableView.register(NewMessagesCell.self, forCellReuseIdentifier: messageId)
        tableView.register(StatisticsCell.self, forCellReuseIdentifier: statisticsId)
        tableView.register(NewRewardsCell.self, forCellReuseIdentifier: newRewardsId)
        tableView.register(EventInvitationCell.self, forCellReuseIdentifier: eventInvitationId)
        tableView.register(LeaderboardHomeCell.self, forCellReuseIdentifier: leaderboardId)
        tableView.register(EventTableCell.self, forCellReuseIdentifier: eventId)
        tableView.register(HomeNoEventCell.self, forCellReuseIdentifier: noEventCell)
        tableView.register(ExpiredEventHeaderCell.self, forCellReuseIdentifier: expiredEventHeaderId)
        tableView.register(ExpiredEventTableCell.self, forCellReuseIdentifier: expiredId)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userEvents.count == 0 {
            return view.frame.height
        } else {
            let type = homeCells[indexPath.row]
            switch type {
            case _ where type == WelcomeCell.self:
                return 188
            case _ where type == SystemMessageCell.self:
                return 108
            case _ where type == NewMessagesCell.self:
                return 83
            case _ where type == StatisticsCell.self:
                return statisticsCellHeight
            case _ where type == NewRewardsCell.self:
                return 162
            case _ where type == EventInvitationCell.self:
//                guard let controller = homeController else { return 0 }
                let imageHeight = (self.view.frame.width - 16) / 2.7
                let height = 264 + imageHeight
                return height
            case _ where type == LeaderboardHomeCell.self:
                return 207
            case _ where type == EventTableCell.self:
                let height = CGFloat(497) + ((view.frame.width - 32) / 2.7)
                return height
            case _ where type == ExpiredEventHeaderCell.self:
                return 50
            case _ where type == ExpiredEventTableCell.self:
                let height = CGFloat(497) + ((view.frame.width - 32) / 2.7)
                return height
            default:
                return 0
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userEvents.count == 0 {
            return 1
        } else {
            return homeCells.count
        }
    }
    
    var systemMessageContained = false
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if userEvents.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: noEventCell, for: indexPath) as! HomeNoEventCell
            
            cell.homeController = self
            cell.homeControllerMode = .day
            
            return cell
        } else {
            let type = homeCells[indexPath.row]
            
            switch type {
            case _ where type == WelcomeCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WelcomeCell
                
                
                
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
                cell.homeController = self
                
                return cell
            case _ where type == NewRewardsCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: newRewardsId, for: indexPath) as! NewRewardsCell
                
                return cell
            case _ where type == EventInvitationCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: eventInvitationId, for: indexPath) as! EventInvitationCell
                
                cell.homeController = self
                
                return cell
            case _ where type == LeaderboardHomeCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: leaderboardId, for: indexPath) as! LeaderboardHomeCell
                
                return cell
            case _ where type == ExpiredEventHeaderCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: expiredEventHeaderId, for: indexPath) as! ExpiredEventHeaderCell
                
                cell.delegate = self
                
                return cell
            case _ where type == EventTableCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: eventId, for: indexPath) as! EventTableCell
                
                checkIfAnimated(cell: cell, int: indexPath.row)
                
                let difference = homeCells.count - self.userEvents.count - 1 - expiredEvents.count
                let event = userEvents[indexPath.row - difference]
                
                cell.currentEvent = event
                cell.homeController = self
                
                cell.delegate = self
                
                return cell
            case _ where type == ExpiredEventTableCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: expiredId, for: indexPath) as! ExpiredEventTableCell
                
                checkIfAnimated(cell: cell, int: indexPath.row)
                
                let difference = homeCells.count - self.userEvents.count
                let event = userEvents[indexPath.item - difference]
                
                cell.currentEvent = event
                cell.homeController = self
                
                cell.delegate = self
                
                return cell
            
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: defaultId, for: indexPath)
                
                return cell
            }
        }
    }
    
    func checkIfAnimated(cell: EventTableCell, int: Int) {
        if !alreadyAnimatedArray.contains(int) {
            alreadyAnimatedArray.append(int)
            cell.shouldAnimateProgressBar = true
        } else {
            cell.shouldAnimateProgressBar = false
        }
    }
    
    func didTapCancel(indexPath: IndexPath) {
        self.homeCells.remove(at: indexPath.item)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 1 {
            return true
        } else {
            return false
        }
    }
    
    func didTapOnCell() {
        self.menu?.showMessagesController()
    }
    
    func didTapUpDown(withButtonState buttonState: ButtonState) {
        switch buttonState {
        case .up:
            
            let expiredEvents = EventResource().getEvents()
            
            self.expiredEvents = expiredEvents
        case .down:
            self.homeCells.removeLast()
            self.homeCells.removeLast()
            self.homeCells.removeLast()
            
            self.tableView.reloadData()
        }
    }
    
    func handleUpDown(buttonState: ButtonState) {
        if buttonState == .down {
            self.statisticsCellHeight = 205
        } else {
            self.statisticsCellHeight = 74
        }
    }
    
    func didTapPromote(event: Event) {
        
        let controller = SellTicketsController()
        controller.event = event
        
        self.show(controller, sender: self)
    }
    
    func didTapRewards(event: Event) {
        let newController = EventRewardsTableController(style: .grouped)
        newController.event = event
        self.show(newController, sender: self)
    }
    
    func didTapEventInfo(event: Event) {
        let eventInfoController = EventInfoController()
        eventInfoController.event = event
        self.show(eventInfoController, sender: self)
    }
    
    func didTapLeaderboards(event: Event) {
        let layout = UICollectionViewFlowLayout()
        let leaderboardsController = LeaderboardController(collectionViewLayout: layout)
//        leaderboardsController.event = event
        self.show(leaderboardsController, sender: self)
    }
    
}







