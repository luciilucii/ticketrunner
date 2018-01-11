//
//  LeaderboardController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LeaderboardController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //TODO: fetch User with pagination
    
    let cellId = "cellId"
    let headerId  = "headerId"
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWhiteTitle(title: "Leaderboard")
        
        setupCollectionView()
        setupNavBarButtons()
        
        _ = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(scrollToCurrentUser), userInfo: nil, repeats: false)
    }
    
    @objc func scrollToCurrentUser() {
        let currentUserId = ""
        
//        let index = users.index { (user) -> Bool in
//            return user.uid! == currentUserId
//        }
        
        let testIndex = 17
        let indexPath = IndexPath(item: testIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .top, animated: true)
        
    }
    
    func setupCollectionView() {
        
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(LeaderboardCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.register(LeaderboardHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView?.alwaysBounceVertical = true
    }
    
    func setupNavBarButtons() {
        
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icon_back").withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = ColorCodes.ticketrunnerPurple
        button.addTarget(self, action: #selector(handlePopView), for: .touchUpInside)
        
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 45)
        
        let backButton = UIBarButtonItem(customView: button)
        backButton.width = 15
        
        let menuCustomView = UIButton()
        menuCustomView.setImage(#imageLiteral(resourceName: "menu_icon_3").withRenderingMode(.alwaysTemplate), for: .normal)
        menuCustomView.addTarget(self, action: #selector(handleNavigationMenu), for: .touchUpInside)
        menuCustomView.tintColor = ColorCodes.ticketrunnerPurple
        
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
    
    lazy var menu: Menu = {
        let menu = Menu()
        menu.startController = self
        return menu
    }()
    
    func handleMenu() {
        menu.showMenu()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        return CGSize(width: view.frame.width, height: 25)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 50
        let width = view.frame.width - 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LeaderboardCell
        
        let rank = indexPath.item + 1
        cell.placementLabel.text = "\(rank)"
        
        //TODO: Don't do this in the setup here! This has to be fixed with an timer
        
        switch (indexPath.item) {
        case _ where indexPath.item < 3 :
            cell.setupCell(cellType: .firstThree)
        case 7:
            cell.setupCell(cellType: .user)
        default:
            cell.setupCell(cellType: .normal)
        }
        
        return cell
    }
    
    
    
}








