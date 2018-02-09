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
    
    let leaderboardLabel: HomeTableCellLabel = {
        let label = HomeTableCellLabel(title: "Leaderboard", icon: #imageLiteral(resourceName: "Icon Ticket"))
        return label
    }()
    
    let overallLabel: H1 = {
        let label = H1()
        label.text = "Overall"
        label.textAlignment = .left
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
    
    lazy var viewAllButton: TicketrunnerGrayButton = {
        let button = TicketrunnerGrayButton(title: "View All")
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.clipsToBounds = false
        return button
    }()
    
    override func setupViews() {
        view.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        setupCollectionView()
        setupCellViews()
    }
    
    func setupCollectionView() {
        collectionView.register(LeaderboardHomeCVCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    func setupCellViews() {
        
        addSubview(viewAllButton)
        viewAllButton.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: 120, height: 35)
        viewAllButton.layer.cornerRadius = 20
        viewAllButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(leaderboardLabel)
        addSubview(shadowView)
        addSubview(view)
        
        leaderboardLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        shadowView.anchor(top: leaderboardLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 67, paddingRight: 8, width: 0, height: 0)
        
        view.anchor(top: leaderboardLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 67, paddingRight: 8, width: 0, height: 0)
        
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 5.0
        
        view.addSubview(overallLabel)
        view.addSubview(collectionView)
        
        overallLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        collectionView.anchor(top: overallLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 90
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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










