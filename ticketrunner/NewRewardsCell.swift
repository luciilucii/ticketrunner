//
//  NewRewardsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 13.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewRewardsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NewRewardsCVCellDelegate {
    
    //NOTE: cell height is 54 + collectionView (50 per item)
    
    let cellId = "cellId"
    
    var delegate: NewRewardsCVCellDelegate?
    
    let rewardsTitleLabel: HomeTableCellLabel = {
        let label = HomeTableCellLabel(title: "Earned Rewards", icon: #imageLiteral(resourceName: "Icon Merchandise"))
        return label
    }()
    
    lazy var rewardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.backgroundColor = .white
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        addSubview(rewardsTitleLabel)
        rewardsTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        addSubview(shadowView)
        shadowView.anchor(top: rewardsTitleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        addSubview(view)
        view.anchor(top: rewardsTitleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 5.0
        
        setupCollectionView()
        
        view.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        view.addSubview(rewardsCollectionView)
        rewardsCollectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func setupCollectionView() {
        rewardsCollectionView.register(NewRewardsCVCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewRewardsCVCell
        
        if indexPath.item == 4 - 1 {
            cell.seperatorView.isHidden = true
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = rewardsCollectionView.frame.width
        let height: CGFloat = 80
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func didTapRedeem(reward: Reward?) {
        delegate?.didTapRedeem(reward: reward)
    }
    
}






