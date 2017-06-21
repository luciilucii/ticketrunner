//
//  RewardsHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 14.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardsHeader: BaseCell {
    
    let rewardsTitleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rewards-2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(rewardsTitleImageView)
        
        rewardsTitleImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        rewardsTitleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rewardsTitleImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        rewardsTitleImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
