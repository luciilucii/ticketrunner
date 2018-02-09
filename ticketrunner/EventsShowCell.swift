//
//  EventsShowCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 27.01.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventsShowCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, EventCellDelegate {
    
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
        
        addSubview(pageControl)
        addSubview(collectionView)
        
        pageControl.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: pageControl.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.reloadData()
        
        
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
//
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
//        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
//        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
//        layout.minimumLineSpacing = itemSpacing
//        layout.scrollDirection = .horizontal
//
//        collectionView.collectionViewLayout = layout
//        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(HomeEventContainerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func didTapPromote(event: Event) {
        delegate?.didTapPromote(event: event)
    }
    
    func didTapRewards(event: Event) {
        delegate?.didTapRewards(event: event)
    }
    
    func didTapEventInfo(event: Event) {
        delegate?.didTapEventInfo(event: event)
    }
    
    func didTapLeaderboards(event: Event) {
        delegate?.didTapLeaderboards(event: event)
    }
    
    func didTapFeed(event: Event) {
        delegate?.didTapFeed(event: event)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeEventContainerCell
        
        let event = events[indexPath.item]
        cell.event = event
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 512
        let width: CGFloat = cellWidth ?? 0
        //view.frame.width

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = events[indexPath.item]
        delegate?.didTapEventInfo(event: event)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    let collectionMargin = CGFloat(4)
    let itemSpacing = CGFloat(-8)
    let itemHeight = CGFloat(512)
    var itemWidth = CGFloat(0)
    var currentItem = 0
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / self.frame.width)
        pageControl.currentPage = pageNumber
        
//        let pageWidth = Float(itemWidth + itemSpacing)
//        let targetXContentOffset = Float(targetContentOffset.pointee.x)
//        let contentWidth = Float(collectionView.contentSize.width  )
//        var newPage = Float(self.pageControl.currentPage)
//
//        if velocity.x == 0 {
//            newPage = floor((targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
//        } else {
//            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
//            if newPage < 0 {
//                newPage = 0
//            }
//            if (newPage > contentWidth / pageWidth) {
//                newPage = ceil(contentWidth / pageWidth) //- 1.0
//            }
//        }
//        self.pageControl.currentPage = Int(newPage)
//        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
//        targetContentOffset.pointee = point
        
        
    }
    
}
