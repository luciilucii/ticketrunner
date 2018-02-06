//
//  EarnedRewardsHeaderCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class EarnedRewardsHeaderCell: BaseCell {
    
    override var isSelected: Bool {
        didSet {
            
            self.titleLabel.font = isSelected ? UIFont.boldSourceSansPro(ofSize: 16) : UIFont.sourceSansPro(ofSize: 16)
            
            self.titleLabel.textColor = isSelected ? UIColor.black : ColorCodes.textColorGrey
            
        }
    }
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Unlocked"
        label.textAlignment = .center
        label.font = UIFont.sourceSansPro(ofSize: 16)
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear
        
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: -4, paddingBottom: 0, paddingRight: -4, width: 0, height: 0)
    }
    
}








