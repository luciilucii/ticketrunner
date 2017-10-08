//
//  LeaderboardHomeCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LeaderboardHomeCell: TableCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellId = "cellId"
    
    let leaderboardLabel: UILabel = {
        let label = UILabel()
        label.text = "Leaderboard"
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = false
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        self.layer.cornerRadius = 5
        
        setupCollectionView()
        setupCellViews()
    }
    
    func setupCollectionView() {
        collectionView.register(LeaderboardHomeCVCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    func setupCellViews() {
        
        addSubview(leaderboardLabel)
        addSubview(collectionView)
        
        leaderboardLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 25)
        collectionView.anchor(top: leaderboardLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 50
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LeaderboardHomeCVCell
        
        if indexPath.item == 0 {
            cell.rankImageView.image = #imageLiteral(resourceName: "Rank Down Icon")
        }
        
        if indexPath.item == 1 {
            cell.cellType = .firstThree
        }
        
        return cell
    }
    
}










