//
//  EarnedRewardsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

enum EarnedRewardsControllerControllerState {
    case unlocked
    case inProgress
    case redeemed
}

class EarnedRewardsController: UICollectionViewController, UICollectionViewDelegateFlowLayout, EarnedRewardsHeaderDelegate, EarnedRewardsCVCellDelegate, RedeemRewardModelViewControllerDelegate, InProgressCellDelegate {
    
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
        collectionView?.reloadData()
    }
    
    var unlockedRewards = [Reward]()
    
    var inProgressRewards = [Reward]()
    
    var redeemedRewards = [Reward]()
    
    let cellId = "cellId"
    let headerId = "headerId"
    let inProgressId = "inProgressId"
    let redeemedId = "redeemedId"
    
    var controllerState = EarnedRewardsControllerControllerState.unlocked {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupWhiteTitle(title: "Earned Rewards")
        setupMenuBar()
        setupBellButton()
        
        setupShadowToNavigationBar()
        
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(EarnedRewardsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(EarnedRewardsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(InProgressCell.self, forCellWithReuseIdentifier: inProgressId)
        collectionView?.register(RedeemedCell.self, forCellWithReuseIdentifier: redeemedId)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 16, 0)
        
        events = EventResource().getEvents()
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = ColorCodes.ticketrunnerPurple
        navigationItem.leftBarButtonItem = menuButton
    }
    
    var menu: Menu!
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! EarnedRewardsHeader
        
        header.delegate = self
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height: CGFloat = 300
        let width = view.frame.width
        
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch controllerState {
        case .unlocked:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EarnedRewardsCell
            
            cell.rewards = self.unlockedRewards
            cell.delegate = self
            
            return cell
        case .inProgress:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: inProgressId, for: indexPath) as! InProgressCell
            
            cell.rewards = self.inProgressRewards
            cell.delegate = self
            
            return cell
        case .redeemed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: redeemedId, for: indexPath) as! RedeemedCell
            
            cell.rewards = self.redeemedRewards
            
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat
        let width: CGFloat = view.frame.width
        
        switch controllerState {
        case .unlocked:
            height = CGFloat(80 * unlockedRewards.count)
        case .inProgress:
            height = CGFloat(80 * inProgressRewards.count)
        case .redeemed:
            height = 450
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func didSelectIndexPath(int: Int) {
        switch int {
        case 0:
            self.controllerState = .unlocked
        case 1:
            self.controllerState = .inProgress
        case 2:
            self.controllerState = .redeemed
        default:
            break
        }
    }
    
    func didTapRedeem(reward: Reward) {
        let redeemRewardController = RedeemRewardModelViewController()
        redeemRewardController.delegate = self
        redeemRewardController.modalTransitionStyle = .crossDissolve
        redeemRewardController.modalPresentationStyle = .overCurrentContext
        redeemRewardController.reward = reward
        self.present(redeemRewardController, animated: true, completion: nil)
    }
    
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController) {
        redeemRewardModelViewController.dismiss(animated: true, completion: nil)
    }
    
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward) {
        if let index = self.unlockedRewards.index(where: { (unlockedReward) -> Bool in
            return reward.id == unlockedReward.id
        }) {
            unlockedRewards.remove(at: index)
            redeemedRewards.append(reward)
            
            self.collectionView?.reloadData()
        }
    }
    
    func didTapCell(reward: Reward) {
        let rewardInfoModalController = RewardInfoModalController()
        rewardInfoModalController.modalPresentationStyle = .overCurrentContext
        rewardInfoModalController.modalTransitionStyle = .crossDissolve
        
        self.present(rewardInfoModalController, animated: true, completion: nil)
    }
    
}







