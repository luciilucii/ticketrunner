//
//  QuickTipsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 23.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class QuickTipsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "celldId"
    
    let titleLabel = HomeTableCellLabel(title: "Quick Tips", icon: #imageLiteral(resourceName: "Icon Experience"))
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.alwaysBounceVertical = false
        cv.backgroundColor = .white
        cv.register(QuickTipsTVCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
    lazy var viewAllButton: TicketrunnerGrayButton = {
        let button = TicketrunnerGrayButton(title: "View All")
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.sourceSansPro(ofSize: 16)
        button.clipsToBounds = false
        return button
    }()
    
    override func setupViews() {
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        addSubview(viewAllButton)
        viewAllButton.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: 120, height: 35)
        viewAllButton.layer.cornerRadius = 20
        viewAllButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        viewAllButton.layer.shadowOpacity = 0.4
        viewAllButton.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        viewAllButton.layer.shadowColor = UIColor.darkGray.cgColor
        viewAllButton.layer.shadowRadius = 5.0
        
        addSubview(shadowView)
        shadowView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: viewAllButton.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: 0)
        
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 5.0
        
        addSubview(view)
        view.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: viewAllButton.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 16, paddingRight: 8, width: 0, height: 0)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! QuickTipsTVCell
        
        if indexPath.item == 4 - 1 {
            cell.seperatorView.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = self.frame.width - 16
        let height: CGFloat = 90
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}















