//
//  StatisticsTitleCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StatisticsTitleCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                titleLabel.textColor = ColorCodes.textColorGrey
                titleLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            } else {
                titleLabel.textColor = ColorCodes.lightGrayText
                titleLabel.font = UIFont.sourceSansPro(ofSize: 14)
            }
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.textColor = ColorCodes.textColorGrey
                titleLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            } else {
                titleLabel.textColor = ColorCodes.lightGrayText
                titleLabel.font = UIFont.sourceSansPro(ofSize: 14)
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.lightGrayText
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = UIFont.sourceSansPro(ofSize: 14)
        label.layer.cornerRadius = 10
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 2, paddingBottom: 2, paddingRight: 2, width: 0, height: 0)
    }
    
}
