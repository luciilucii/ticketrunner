//
//  RewardsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var titleLabel: UILabel!
    
    private let headerId = "headerId"
    private let cellId = "cellId"
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        setupMenuBar()
        
        events = EventResource().getEvents()
        
        setupBackgroundImage()
        setupCollectionView()
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    var menu: Menu!
    
    
    func handleMenu() {
        menu.showMenu()
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        collectionView?.register(EventRewardCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(RewardsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
    }
    
    func setupBackgroundImage() {
        
        if events.count == 0 {
            noRewardsImageView.isHidden = false
            noRewardLabel.isHidden = false
        } else {
            noRewardsImageView.isHidden = true
            noRewardLabel.isHidden = true
        }
        
    }
    
    let rewardsTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let rewardsTitleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rewards-2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let noRewardsImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "no rewards")
        return iv
    }()

    let noRewardLabel: UILabel = {
        let label = UILabel()
        label.text = "No Rewards yet"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {

        view.addSubview(noRewardsImageView)
        view.addSubview(noRewardLabel)
        
        //x,y,w,h
        noRewardsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        noRewardsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noRewardsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        noRewardsImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        
        //x,y,w,h
        noRewardLabel.topAnchor.constraint(equalTo: noRewardsImageView.bottomAnchor, constant: 8).isActive = true
        noRewardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noRewardLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        noRewardLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "My Rewards"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let event = events[indexPath.item]
        guard let rewardsCount = event.rewards?.count else {
            return CGSize(width: 0, height: 0)
        }
        
        let height = getCellHeightFor(rewardsCount: rewardsCount)
        let width = view.frame.width - 16
        
        let size = CGSize(width: width, height: height)
        
        return size
        
    }
    
    func getCellHeightFor(rewardsCount: Int) -> CGFloat {
        
        let height = CGFloat(rewardsCount) * 50 + 233
        
        return height
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventRewardCell
        
        cell.backgroundColor = UIColor.white
        
        let event = events[indexPath.item]
        
        cell.currentEvent = event
        cell.progressBar.progressBackgroundBarWidthAnchor = view.frame.width - 48
        
        cell.rewards = event.rewards
        cell.eventRewardsContainer = EventRewardsContainer()
        
        cell.titleLabel.text = event.name
        
        return cell
    }
    
    func handlePromote(sender: UIButton) {
        let event = events[sender.tag]
        handlePromoteFor(event: event)
    }
    
    
    func handleRewards(sender: UIButton) {
        let event = events[sender.tag]
        handleRewardsFor(event: event)
    }
    
    func handleShowEventInfo(sender: UIButton) {
        
        let event = events[sender.tag]
        handleShowEventInfoFor(event: event)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! RewardsHeader
        
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let event = events[indexPath.item]
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
    }

    
}
