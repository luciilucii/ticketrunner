//
//  NewRewardsCVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewRewardsCVCell: BaseCell {
    
    let rewardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "Icon Merchandise").withRenderingMode(.alwaysTemplate)
        iv.tintColor = ColorCodes.homeYellow
        return iv
    }()
    
    let titleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.text = "Bungee Jump"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "for first 50 tickets sold"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let checkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Checkmark")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(rewardImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(checkImageView)
        
        rewardImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 32, height: 32)
        rewardImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.anchor(top: topAnchor, left: rewardImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        checkImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 36, height: 36)
        checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
