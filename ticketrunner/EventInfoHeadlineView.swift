//
//  EventInfoHeadlineView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoHeadlineView: CustomUIView {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    let eventNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = ColorCodes.textColorGrey
        label.text = "Seepark 6 | Süddeutschlands größte Mallorca-Party"
        return label
    }()
    
    let streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Nobelstr. 91,"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "01/09/2017"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Cologne, Germany"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        
        setupEventInfoContainer()
        
    }
    
    func setupEventInfoContainer() {
        addSubview(eventNameLabel)
        addSubview(streetLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
        
        
        eventNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        streetLabel.anchor(top: eventNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 125, height: 20)
        
        dateLabel.anchor(top: streetLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 125, height: 20)
        
        locationLabel.anchor(top: dateLabel.bottomAnchor, left: streetLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 20)
        
        
        
    }
    
}









