//
//  PendingEventsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 24.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class PendingEventsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var events = [Event]() {
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = events.count
            collectionView.reloadData()
        }
    }
    
    var cellWidth: CGFloat? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var delegate: EventCellDelegate?
    
    let cellId = "cellId"
    
    let titleLabel: HomeTableCellLabel = {
        let label = HomeTableCellLabel(title: "Pending Events", icon: #imageLiteral(resourceName: "Icon Ticket"))
//        label.title = "Active Events"
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = ColorCodes.ticketrunnerPurple
        return pc
    }()
    
    override func setupViews() {
        setupCollectionView()
        
        addSubview(titleLabel)
        addSubview(pageControl)
        addSubview(collectionView)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pageControl.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        collectionView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: pageControl.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.reloadData()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(PendingEventsCVCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PendingEventsCVCell
        
        let event = events[indexPath.item]
        cell.event = event
//        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 472
        let width: CGFloat = cellWidth ?? 0
        //view.frame.width
        
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



