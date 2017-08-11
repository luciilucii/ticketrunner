//
//  StatisticsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StatisticsCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellId = "cellId"
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1728"
        label.backgroundColor = .red
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let plusTicketsLabel: UILabel = {
        let label = UILabel()
        label.text = "+5"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.layer.cornerRadius = 10
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 5
        
        setupAnchors()
        
        setupCollectionView()
    }
    
    func setupAnchors() {
        addSubview(ticketsSoldLabel)
        addSubview(plusTicketsLabel)
        
        ticketsSoldLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 20)
        ticketsSoldLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        plusTicketsLabel.anchor(top: ticketsSoldLabel.topAnchor, left: ticketsSoldLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 20)
        
    }
    
    func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        
        
        return cell
    }
    
}
