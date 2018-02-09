//
//  ActivityFeedController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class ActivityFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ActivityFeedHeaderDelegate {
    
    let dateCellId = "dateCellId"
    let headerId = "headerId"
    let clickedLinkId = "clickedLinkId"
    let acceptedId = "acceptedId"
    let boughtId = "boughtId"
    let shareId = "shareId"
    let redeemedId = "redeemedId"
    let expendedBoughtId = "expendedBoughtId"
    
    let cellTypes = [AFDateCell.self, AFClickedLinkCell.self, AFAcceptedCell.self, AFDateCell.self, AFBoughtCell.self, AFShareCell.self, AFRedeemedCell.self, AFBoughtExpendCell.self]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(AFDateCell.self, forCellWithReuseIdentifier: dateCellId)
        collectionView?.register(AFClickedLinkCell.self, forCellWithReuseIdentifier: clickedLinkId)
        collectionView?.register(ActivityFeedHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(AFAcceptedCell.self, forCellWithReuseIdentifier: acceptedId)
        collectionView?.register(AFBoughtCell.self, forCellWithReuseIdentifier: boughtId)
        collectionView?.register(AFShareCell.self, forCellWithReuseIdentifier: shareId)
        collectionView?.register(AFRedeemedCell.self, forCellWithReuseIdentifier: redeemedId)
        collectionView?.register(AFBoughtExpendCell.self, forCellWithReuseIdentifier: expendedBoughtId)
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 16, 0)
        
        setupNavBarButtons()
        setupWhiteTitle(title: "Activity Feed")
        setupBellButton()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = cellTypes[indexPath.item]
        
        switch cellType {
        case _ where cellType == AFDateCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dateCellId, for: indexPath) as! AFDateCell
            
            if indexPath.item == 0 {
                cell.topTimelineView.isHidden = true
            }
            
            if indexPath.item == 3 {
                cell.dateLabel.text = "Yesterday"
            }
            
            return cell
        case _ where cellType == AFClickedLinkCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: clickedLinkId, for: indexPath) as! AFClickedLinkCell
            
            return cell
        case _ where cellType == AFAcceptedCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: acceptedId, for: indexPath) as! AFAcceptedCell
            
            return cell
        case _ where cellType == AFBoughtCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: boughtId, for: indexPath) as! AFBoughtCell
            
            return cell
        case _ where cellType == AFShareCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shareId, for: indexPath) as! AFShareCell
            
            return cell
        case _ where cellType == AFRedeemedCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: redeemedId, for: indexPath) as! AFRedeemedCell
            
            return cell
        case _ where cellType == AFBoughtExpendCell.self:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: expendedBoughtId, for: indexPath) as! AFBoughtExpendCell
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dateCellId, for: indexPath) as! AFDateCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat
        let width: CGFloat = view.frame.width
        
        let cellType = cellTypes[indexPath.item]
        
        //Standard is 116
        
        switch cellType {
        case _ where cellType == AFDateCell.self:
            
            height = indexPath.item == 0 ? 60 : 80
            
        case _ where cellType == AFClickedLinkCell.self:
            height = 250
        case _ where cellType == AFAcceptedCell.self:
            height = 116
        case _ where cellType == AFBoughtCell.self:
            height = 116
        case _ where cellType == AFShareCell.self:
            height = 116
        case _ where cellType == AFRedeemedCell.self:
            height = 146
        case _ where cellType == AFBoughtExpendCell.self:
            height = 248
        default:
            height = 0
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ActivityFeedHeader
        
        header.delegate = self
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = view.frame.width
        let height: CGFloat = 225
        
        return CGSize(width: width, height: height)
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
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    lazy var menu: Menu = {
        let menu = Menu()
        menu.startController = self
        return menu
    }()
    
    func didSelectIndexPath(int: Int) {
        print(int)
    }
    
}





