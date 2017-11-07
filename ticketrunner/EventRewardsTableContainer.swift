//
//  EventRewardsTableContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 13.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardsTableContainer: CustomUIView, UITableViewDelegate, UITableViewDataSource, RewardTableCellDelegate, RedeemRewardModelViewControllerDelegate {
    
    let cellId = "cellId"
    
    var eventRewardsController: EventRewardsController?
    
    var event: Event? {
        didSet {
            guard let rewards = event?.rewards else { return }
            self.rewards = rewards
        }
    }
    
    var rewards = [Reward]() {
        didSet {
//            self.eventRewardsController?.setupEventRewardsTableContainerAnchor()
            tableView.reloadData()
        }
    }
    
    var containerHeight: CGFloat?
    
    var openedIndexPaths = [IndexPath]() {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    var openedRewards = [Int]() {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
//    lazy var redeemRewardModelViewController: RedeemRewardModelViewController = {
//        let controller = RedeemRewardModelViewController()
//        controller.delegate = self
//        controller.modalTransitionStyle = .crossDissolve
//        controller.modalPresentationStyle = .overCurrentContext
//        return controller
//    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        clipsToBounds = true
        layer.cornerRadius = 5
        backgroundColor = UIColor.white
        
        tableView.register(RewardTableCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        addSubview(tableView)
        
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RewardTableCell
        
        cell.reward = rewards[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let reward = rewards[indexPath.row]
        let rewardId = reward.id
        
        let isContained = openedRewards.contains { (containedInt) -> Bool in
            return containedInt == rewardId
        }
        
        if isContained {
            guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return 0 }
            return cell.getCellHeight()
            
        } else {
            return 50
        }
    }
    
    func didTapRedeem(reward: Reward) {
        let controller = RedeemRewardModelViewController()
        controller.delegate = self
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        controller.reward = reward
        
        self.eventRewardsController?.present(controller, animated: true, completion: {
            // completion here
        })
    }
    
    func didTapCell(reward: Reward, indexPath: IndexPath) {
        let rewardId = reward.id
        
        let containedIndex = openedRewards.index { (containedId) -> Bool in
            return rewardId == containedId
        }
        
        if let index = containedIndex {
            openedRewards.remove(at: index)
        } else {
            openedRewards.append(rewardId)
        }
        updateContainerHeightInController()
    }
    
    func updateContainerHeightInController() {
        guard let controller = self.eventRewardsController else { return }
        print("Height of Container from function is: ", getContainerHeight())
        controller.eventRewardsTableContainerHeight = getContainerHeight()
    }
    
    
    @objc func reduceTicketPoints() {
        let minusInt = 150
        guard let currentInt = eventRewardsController?.rewardsContainer.ticketPoints else { return }
        
        eventRewardsController?.rewardsContainer.soldTicketsLabel.count(fromValue: Float(currentInt), to: Float(currentInt - minusInt), withDuration: 3.0, animationType: .EaseOut, counterType: .TicketPoints)
        
    }
    
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward) {
        let index = rewards.index { (containedReward) -> Bool in
            return containedReward.id == reward.id
        }
        
        guard let indexInt = index else { return }
        let indexPath = IndexPath(row: indexInt, section: 0)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }
        cell.redeemButton.isHidden = true
        cell.checkmarkImageView.isHidden = false
        
        let toIndexPath = IndexPath(row: (self.rewards.count - 1), section: 0)
        
        tableView.moveRow(at: indexPath, to: toIndexPath)
        
        
        _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(reduceTicketPoints), userInfo: nil, repeats: false)
        
    }
    
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController) {
        redeemRewardModelViewController.dismiss(animated: true) {
            //completion here
        }
    }
    
    func getContainerHeight() -> CGFloat {
        var allHeights: CGFloat = 0
        rewards.forEach { (reward) in
            let index = openedRewards.index(where: { (containedId) -> Bool in
                return containedId == reward.id
            })
            if let indexInt = index {
                let indexPath = IndexPath(row: indexInt, section: 0)
                guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }
                allHeights += cell.getCellHeight()
            } else {
                allHeights += 50
            }
        }
        return CGFloat(allHeights)
    }
    
}








