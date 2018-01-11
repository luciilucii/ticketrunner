//
//  StatisticsEventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 12.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StatisticsEventCell: BaseCell {
    
    let numberLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "1"
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        return label
    }()
    
    let eventNameLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Event Name with a little longer title"
        label.font = UIFont.sourceSansPro(ofSize: 14)
        return label
    }()
    
    let ticketsSoldLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "723"
        label.textAlignment = .right
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSourceSansPro(ofSize: 18)
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
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(numberLabel)
        addSubview(ticketsSoldLabel)
        addSubview(plusTicketsLabel)
        addSubview(eventNameLabel)
        addSubview(seperatorView)
        
        numberLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 25, height: 0)
        
        
        ticketsSoldLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 45, height: 0)
        plusTicketsLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 0)
        
        eventNameLabel.anchor(top: topAnchor, left: numberLabel.rightAnchor, bottom: bottomAnchor, right: plusTicketsLabel.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 0)
        
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        
        
    }
    
}







