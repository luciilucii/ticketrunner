//
//  StatisticsEventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 12.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StatisticsEventCell: BaseCell {
    
    let eventNameLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Event Name with a little longer title"
        label.numberOfLines = 2
        return label
    }()
    
    let ticketsSoldLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "723"
        label.textAlignment = .right
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let plusTicketsLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = ColorCodes.ticketrunnerGreen
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textAlignment = .right
        label.text = "+13"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(ticketsSoldLabel)
        addSubview(plusTicketsLabel)
        addSubview(eventNameLabel)
        
        plusTicketsLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 65, height: 25)
        ticketsSoldLabel.anchor(top: plusTicketsLabel.topAnchor, left: nil, bottom: plusTicketsLabel.bottomAnchor, right: plusTicketsLabel.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 75, height: 0)
        
        eventNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 200, height: 0)
        
    }
    
}
