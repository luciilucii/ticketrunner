//
//  NewRewardsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 13.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewRewardsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //NOTE: cell height is 54 + collectionView (50 per item)
    
    let cellId = "cellId"
    
    let rewardsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Congrats new rewards earned!"
        label.textAlignment = .center
        label.textColor = ColorCodes.homeYellow
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        super.setupViews()
        
        setupCollectionView()
        
        view.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        view.addSubview(rewardsTitleLabel)
        view.addSubview(rewardsCollectionView)
        
        rewardsTitleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        rewardsCollectionView.anchor(top: rewardsTitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func setupCollectionView() {
        rewardsCollectionView.register(NewRewardsCVCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewRewardsCVCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = rewardsCollectionView.frame.width
        let height: CGFloat = 50
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
