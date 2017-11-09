//
//  RewardsTableController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 08.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardsTableController: UITableViewController, RewardTableCellDelegate, RedeemRewardModelViewControllerDelegate {
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var events = [Event]() {
        didSet {
            events.forEach { (event) in
                self.setupEventRewards(event: event)
            }
        }
    }
    
    func setupEventRewards(event: Event) {
        if let rewards = event.rewards {
            rewards.forEach({ (reward) in
                switch reward.currentRewardState {
                case .inProgress?:
                    self.inProgressRewards.append(reward)
                case .none:
                    break
                case .some(.unlocked):
                    self.unlockedRewards.append(reward)
                case .some(.redeemed):
                    self.redeemedRewards.append(reward)
                }
            })
        }
        tableView.reloadData()
    }
    
    var unlockedRewards = [Reward]()
    
    var inProgressRewards = [Reward]()
    
    var redeemedRewards = [Reward]()
    
    let cellId = "cellId"
    
    let rewardsTitleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rewards-2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupWhiteTitle(title: "My Rewards")
        
        self.events = EventResource().getEvents()
        
        view.backgroundColor = ColorCodes.controllerBackground
        tableView.backgroundColor = ColorCodes.controllerBackground
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(RewardTableCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
    }
    
    var menu: Menu!
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RewardTableCell
            
            let reward = unlockedRewards[indexPath.row]
            cell.reward = reward
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RewardTableCell
            
            let reward = inProgressRewards[indexPath.row]
            cell.reward = reward
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RewardTableCell
            
            let reward = redeemedRewards[indexPath.row]
            cell.reward = reward
            
            cell.delegate = self
            cell.indexPath = indexPath
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return unlockedRewards.count
        case 1:
            return inProgressRewards.count
        default:
            return redeemedRewards.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Unlocked"
        case 1:
            return "In Progress"
        default:
            return "Redeemed"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == self.openedIndexPath {
            guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return 0 }
            return cell.getCellHeight()
        } else {
            return 50
        }
    }
    
    var openedIndexPath: IndexPath? {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func didTapCell(reward: Reward, indexPath: IndexPath) {
        if let nowOpenedIndexPath = self.openedIndexPath {
            if indexPath == openedIndexPath {
                self.openedIndexPath = nil
                return
            }
        }
        openedIndexPath = indexPath
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
    
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward) {
        let index = unlockedRewards.index { (containedReward) -> Bool in
            return containedReward.id == reward.id
        }
        
        guard let indexInt = index else { return }
        reward.redeemed = true
        unlockedRewards.remove(at: indexInt)
        
        redeemedRewards.append(reward)
        
        tableView.reloadData()
        
        let indexPath = IndexPath(row: (redeemedRewards.count - 1), section: 2)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }
        
        cell.reward = nil
        cell.reward = reward
        
        cell.redeemButton.isHidden = true
        cell.checkmarkImageView.isHidden = false
        cell.progressBarContainer.isHidden = true
        
        setupCellsAfterRedeem()
    }
    
    fileprivate func setupCellsAfterRedeem() {
        var i = 0
        while i < unlockedRewards.count {
            let indexPath = IndexPath(row: i, section: 0)
            guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }
            
            cell.redeemButton.isHidden = false
            cell.checkmarkImageView.isHidden = true
            
            i += 1
        }
        setupRedeemedCell()
    }
    
    fileprivate func setupRedeemedCell() {
        var i = 0
        while i < redeemedRewards.count {
            let indexPath = IndexPath(row: i, section: 0)
            guard let cell = tableView.cellForRow(at: indexPath) as? RewardTableCell else { return }
            
            cell.redeemButton.isHidden = true
            cell.checkmarkImageView.isHidden = false
            
            i += 1
        }
    }
    
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController) {
        redeemRewardModelViewController.dismiss(animated: true) {
            //completion here
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = RewardsImageTableHeader()
            return header
        case 1:
            let header = RewardsInProgressTableHeader()
            return header
        default:
            let header = RewardsRedeemedTableHeader()
            return header
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 188
        } else {
            return 30
        }
    }
    
}

class RewardsImageTableHeader: CustomUIView {
    
    //Height is 180
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "rewards-2")
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor.white
        return iv
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        return view
    }()
    
    let titleLabel: H3 = {
        let label = H3()
        label.text = "Unlocked"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.controllerBackground
        
        addSubview(imageView)
        addSubview(backgroundView)
        
        backgroundView.addSubview(titleLabel)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 38, paddingRight: 0, width: 0, height: 0)
        
        backgroundView.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        titleLabel.anchor(top: backgroundView.topAnchor, left: backgroundView.leftAnchor, bottom: backgroundView.bottomAnchor, right: backgroundView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}

class RewardsInProgressTableHeader: CustomUIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        return view
    }()
    
    let titleLabel: H3 = {
        let label = H3()
        label.text = "In Progress"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.controllerBackground
        
        addSubview(backgroundView)
        
        backgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        backgroundView.addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, left: backgroundView.leftAnchor, bottom: bottomAnchor, right: backgroundView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}

class RewardsRedeemedTableHeader: CustomUIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        return view
    }()
    
    let titleLabel: H3 = {
        let label = H3()
        label.text = "Redeemed"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.controllerBackground
        
        addSubview(backgroundView)
        
        backgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        backgroundView.addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, left: backgroundView.leftAnchor, bottom: bottomAnchor, right: backgroundView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}















