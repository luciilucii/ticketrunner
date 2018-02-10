//
//  RedeemedCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class RedeemedCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var rewards = [Reward]() {
        didSet {
            pageControl.numberOfPages = rewards.count
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(RedeemedRewardCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = ColorCodes.ticketrunnerPurple
        return pc
    }()
    
    override func setupViews() {
        super.setupViews()
        
        pageControl.numberOfPages = 3
        
        addSubview(pageControl)
        addSubview(collectionView)
        
        pageControl.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        collectionView.anchor(top: topAnchor, left: leadingAnchor, bottom: pageControl.topAnchor, right: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .zero)
        
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RedeemedRewardCell
        
        cell.reward = rewards[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rewards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = collectionView.frame.height - 32
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / self.frame.width)
        pageControl.currentPage = pageNumber
    }
    
}







