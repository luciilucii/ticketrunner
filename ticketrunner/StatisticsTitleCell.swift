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
                titleLabel.backgroundColor = ColorCodes.textColorGrey
                titleLabel.textColor = .white
            } else {
                titleLabel.backgroundColor = UIColor.white
                titleLabel.textColor = ColorCodes.textColorGrey
            }
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.backgroundColor = ColorCodes.textColorGrey
                titleLabel.textColor = .white
            } else {
                titleLabel.backgroundColor = UIColor.white
                titleLabel.textColor = ColorCodes.textColorGrey
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Last week"
        label.textColor = ColorCodes.textColorGrey
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.layer.cornerRadius = 10
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 2, paddingBottom: 2, paddingRight: 2, width: 0, height: 0)
    }
    
}
