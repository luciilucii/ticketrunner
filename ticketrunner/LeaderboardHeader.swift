//
//  LeaderboardHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LeaderboardHeader: BaseCell {
    
    let placementLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Rank"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Name"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.text = "Points"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.controllerBackground
        
        addSubview(placementLabel)
        
        addSubview(ticketsSoldLabel)
        
        
        addSubview(usernameLabel)
        
        placementLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 0)
        
        
        
        ticketsSoldLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 4, width: 95, height: 0)
        
        //width dif.
        usernameLabel.anchor(top: topAnchor, left: placementLabel.rightAnchor, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 4, paddingLeft: 46, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        
        
    }
    
}
