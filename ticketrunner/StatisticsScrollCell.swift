//
//  StatisticsScrollCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StatisticsScrollCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.alwaysBounceVertical = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        collectionView.register(StatisticsEventCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 66
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StatisticsEventCell
        
        if indexPath.item == 4-1 {
            cell.seperatorView.isHidden = true
        }
        
        return cell
    }
    
}
