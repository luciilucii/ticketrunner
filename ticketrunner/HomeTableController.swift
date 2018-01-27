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

class HomeTableController: UITableViewController, SystemMessageCellDelegate, NewMessagesCellDelegate, StatisticsCellDelegate, EventCellDelegate, ExpiredEventHeaderCellDelegate, NewRewardsCVCellDelegate, RedeemRewardModelViewControllerDelegate {
    
    
    
    var homeCells = [WelcomeStatisticsCell.self/*, SystemMessageCell.self, NewMessagesCell.self*/, EventMessageCell.self, EventMessageCell.self, NewRewardsCell.self, QuickTipsCell.self, LeaderboardHomeCell.self]
    
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
    let showId = "showId"
    let eventMessageId = "eventMessageId"
    let quickTipsId = "quickTipsId"
    let pendingId = "pendingId"
    
    lazy var viewFrameWidth = view.frame.width
    
    var avatarImage: UIImage?
    
    var statisticsCellHeight: CGFloat = 321 {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    let userResource = UserResource()
    
    var currentUser: User? {
        didSet {
            guard let user = currentUser else { return }
            
            guard let userName = user.firstname else { return }
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
            if userEvents.count != 0 {
                self.homeCells.append(HomeEventsShowCell.self)
                self.homeCells.append(EventInvitationCell.self)
                self.homeCells.append(NewMessagesCell.self)
                self.homeCells.append(PendingEventsCell.self)
            }
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
//        setupWhiteTitle(title: "Home")
        setupTicketrunnerNavBar()
        setupMenuBar()
        setupBellButton()
        
        userEvents = EventResource().getEvents()
        
        _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(showAcceptedTicketrunnerController), userInfo: nil, repeats: false)
    }
    
    @objc private func showAcceptedTicketrunnerController() {
        let modalController = AcceptedTicketrunnerModalController()
        modalController.modalTransitionStyle = .crossDissolve
        modalController.modalPresentationStyle = .overCurrentContext
        
        present(modalController, animated: true, completion: nil)
    }
    
    func checkIfMenuIsSet() {
        if menu == nil {
            menu = Menu()
            menu?.startController = self
        }
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = ColorCodes.ticketrunnerPurple //UIColor.white
        
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
        tableView.layer.zPosition = 1
        
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultId)
        tableView.register(WelcomeStatisticsCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SystemMessageCell.self, forCellReuseIdentifier: notificationId)
        tableView.register(NewMessagesCell.self, forCellReuseIdentifier: messageId)
        tableView.register(NewRewardsCell.self, forCellReuseIdentifier: newRewardsId)
        tableView.register(EventInvitationCell.self, forCellReuseIdentifier: eventInvitationId)
        tableView.register(LeaderboardHomeCell.self, forCellReuseIdentifier: leaderboardId)
        tableView.register(EventTableCell.self, forCellReuseIdentifier: eventId)
        tableView.register(HomeNoEventCell.self, forCellReuseIdentifier: noEventCell)
        tableView.register(ExpiredEventHeaderCell.self, forCellReuseIdentifier: expiredEventHeaderId)
        tableView.register(ExpiredEventTableCell.self, forCellReuseIdentifier: expiredId)
        tableView.register(HomeEventsShowCell.self, forCellReuseIdentifier: showId)
        tableView.register(EventMessageCell.self, forCellReuseIdentifier: eventMessageId)
        tableView.register(QuickTipsCell.self, forCellReuseIdentifier: quickTipsId)
        tableView.register(PendingEventsCell.self, forCellReuseIdentifier: pendingId)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userEvents.count == 0 {
            return view.frame.height
        } else {
            let type = homeCells[indexPath.row]
            switch type {
            case _ where type == WelcomeStatisticsCell.self:
                return statisticsCellHeight
            case _ where type == SystemMessageCell.self:
                return 108
            case _ where type == NewMessagesCell.self:
                return 450
            case _ where type == StatisticsCell.self:
                return statisticsCellHeight
            case _ where type == NewRewardsCell.self:
                return 382
            case _ where type == EventInvitationCell.self:
                return 436
            case _ where type == LeaderboardHomeCell.self:
                return 570
            case _ where type == EventTableCell.self:
                let height = CGFloat(497) + ((view.frame.width - 32) / 2.7)
                return height
            case _ where type == ExpiredEventHeaderCell.self:
                return 50
            case _ where type == ExpiredEventTableCell.self:
                let height = CGFloat(497) + ((view.frame.width - 32) / 2.7)
                return height
            case _ where type == HomeEventsShowCell.self:
                let height = CGFloat(590)
                return height
            case _ where type == EventMessageCell.self:
                return 158
            case _ where type == QuickTipsCell.self:
                return 482
            case _ where type == PendingEventsCell.self:
                return 560
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
            case _ where type == WelcomeStatisticsCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WelcomeStatisticsCell
                
                cell.homeView = self.view
                cell.delegate = self
                
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
//            case _ where type == StatisticsCell.self:
//                let cell = tableView.dequeueReusableCell(withIdentifier: statisticsId, for: indexPath) as! StatisticsCell
//
//                cell.delegate = self
//                cell.homeController = self
//
//                return cell
            case _ where type == NewRewardsCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: newRewardsId, for: indexPath) as! NewRewardsCell
                
                cell.delegate = self
                
                return cell
            case _ where type == EventInvitationCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: eventInvitationId, for: indexPath) as! EventInvitationCell
                
//                cell.homeController = self
                cell.events = userEvents
                cell.cellWidth = self.viewFrameWidth
                
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
            case _ where type == HomeEventsShowCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: showId, for: indexPath) as! HomeEventsShowCell
                
                cell.delegate = self
                cell.events = userEvents
                
                cell.cellWidth = self.viewFrameWidth
                
                return cell
            case _ where type == EventMessageCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: eventMessageId, for: indexPath) as! EventMessageCell
                
                if indexPath.item % 2 == 0 {
                    cell.cellType = .accepted
                } else {
                    cell.cellType = .notMuchTimeLeft
                }
                
                return cell
            case _ where type == QuickTipsCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: quickTipsId, for: indexPath) as! QuickTipsCell
                
                
                
                return cell
            case _ where type == PendingEventsCell.self:
                let cell = tableView.dequeueReusableCell(withIdentifier: pendingId, for: indexPath) as! PendingEventsCell
                
                cell.events = userEvents
                cell.cellWidth = self.viewFrameWidth
                
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: defaultId, for: indexPath)
                
                return cell
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(false, forKey: WelcomeStatisticsCell.welcomeCellLoadedString)
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
            self.expiredEvents = [Event]()
            self.homeCells.removeLast()
            self.homeCells.removeLast()
            self.homeCells.removeLast()
            
            self.tableView.reloadData()
        }
    }
    
    func handleUpDown(buttonState: ButtonState) {
        if buttonState == .down {
            self.statisticsCellHeight = 635
        } else {
            self.statisticsCellHeight = 321
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
    
    //MARK: Redeem Reward
    
    func didTapRedeem(reward: Reward?) {
        let redeemRewardController = RedeemRewardModelViewController()
        redeemRewardController.modalTransitionStyle = .crossDissolve
        redeemRewardController.modalPresentationStyle = .overCurrentContext
        redeemRewardController.delegate = self
        redeemRewardController.reward = Reward(id: 5)
        
        self.present(redeemRewardController, animated: true, completion: nil)
    }
    
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward) {
        print("Redeem")
    }
    
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController) {
        print("Cancel")
        
        redeemRewardModelViewController.dismiss(animated: true, completion: nil)
        
    }
    
    fileprivate func setupTicketrunnerNavBar() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(containerView)
        
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.image = #imageLiteral(resourceName: "ticketrunner_logo_short")
        profileImageView.layer.cornerRadius = 25/2
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        containerView.addSubview(profileImageView)
        
        //ios 9 constraint anchors
        //need x,y,width,height anchors
        profileImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let nameLabel = UILabel()
        nameLabel.text = "Ticketrunner"
        nameLabel.font = UIFont.boldSourceSansPro(ofSize: 16)
        
        containerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //need x,y,width,height
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    
    
}







