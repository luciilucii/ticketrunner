//
//  EventRewardsTableController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardsTableController: UITableViewController, RewardsContainerEventCellDelegate, RewardTableCellDelegate, RedeemRewardModelViewControllerDelegate {
    
    let cellId = "cellId"
    
    var event: Event? {
        didSet {
            guard let rewards = event?.rewards else { return }
            self.rewards = rewards
            self.rewardsContainer.event = event
        }
    }
    
    var openedIndexPathRow: Int? {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    var rewards = [Reward]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var rewardsContainer: RewardsContainer = {
        let container = RewardsContainer()
        container.delegate = self
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Rewards")
        
        tableView.allowsSelection = false
        tableView.register(RewardTableCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = ColorCodes.controllerBackground
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RewardTableCell
        
        cell.reward = rewards[indexPath.row]
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.openedIndexPathRow {
            guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return 0 }
            return cell.getCellHeight()
            
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        headerView.addSubview(rewardsContainer)
        
        rewardsContainer.anchor(top: headerView.topAnchor, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: headerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 128 + 16
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewards.count
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return view.frame.width - 32
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
    
    func didTapCell(reward: Reward, indexPath: IndexPath) {
        if let nowOpenendInt = self.openedIndexPathRow {
            if indexPath.row == openedIndexPathRow {
                self.openedIndexPathRow = nil
                return
            }
        }
        openedIndexPathRow = indexPath.row
    }
    
    func didTapRedeem(reward: Reward) {
        let controller = RedeemRewardModelViewController()
        controller.delegate = self
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        controller.reward = reward
        
        self.present(controller, animated: true, completion: {
            // completion here
        })
    }
    
    func setupNavBarButtons() {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icon_back").withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(handlePopView), for: .touchUpInside)
        
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 45)
        
        let backButton = UIBarButtonItem(customView: button)
        backButton.width = 15
        
        let menuCustomView = UIButton()
        menuCustomView.setImage(#imageLiteral(resourceName: "menu_icon_3").withRenderingMode(.alwaysTemplate), for: .normal)
        menuCustomView.addTarget(self, action: #selector(handleNavigationMenu), for: .touchUpInside)
        menuCustomView.tintColor = UIColor.white
        
        menuCustomView.frame = CGRect(x: 0, y: 0, width: 35, height: 45)
        let menuButton = UIBarButtonItem(customView: menuCustomView)
        menuButton.width = 45
        
        navigationItem.leftBarButtonItems = [backButton, menuButton]
    }
    
    @objc func handlePopView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleNavigationMenu() {
        handleMenu()
    }
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    lazy var menu: Menu = {
        let menu = Menu()
        menu.startController = self
        return menu
    }()
    
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward) {
        let index = rewards.index { (containedReward) -> Bool in
            return containedReward.id == reward.id
        }
        guard let indexInt = index else { return }
        reward.redeemed = true
        rewards.remove(at: indexInt)

        rewards.append(reward)
        
        tableView.reloadData()
        
        let indexPath = IndexPath(row: (rewards.count - 1), section: 0)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }

        cell.reward = nil

        cell.redeemButton.isHidden = true
        cell.checkmarkImageView.isHidden = false
        cell.progressBarContainer.isHidden = true
        
        _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(reduceTicketPoints), userInfo: nil, repeats: false)
    }
    
    @objc func reduceTicketPoints() {
        let minusInt = 150
        let currentInt = rewardsContainer.ticketPoints
        
        rewardsContainer.soldTicketsLabel.count(fromValue: Float(currentInt), to: Float(currentInt - minusInt), withDuration: 3.0, animationType: .EaseOut, counterType: .TicketPoints)
    }
    
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController) {
        redeemRewardModelViewController.dismiss(animated: true) {
            //completion here
        }
    }
    
}











