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

class EarnedRewardsController: UICollectionViewController, UICollectionViewDelegateFlowLayout, EarnedRewardsHeaderDelegate {
    
    
    
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
        
        setupShadowToNavigationBar()
        setupWhiteTitle(title: "Earned Rewards")
        setupMenuBar()
        
        setupBellButton()
        
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(EarnedRewardsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(EarnedRewardsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(InProgressCell.self, forCellWithReuseIdentifier: inProgressId)
        collectionView?.register(RedeemedCell.self, forCellWithReuseIdentifier: redeemedId)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 16, 0)
//        collectionView?.setupShadows()
        
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
            
            return cell
        case .inProgress:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: inProgressId, for: indexPath) as! InProgressCell
            
            return cell
        case .redeemed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: redeemedId, for: indexPath) as! RedeemedCell
            
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
            height = 80 * 7
        case .inProgress:
            height = 80 * 7
        case .redeemed:
            height = 450
        default:
            height = 0
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
    
}







