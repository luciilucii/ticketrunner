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
            guard let eventName = event?.name else { return }
            eventNameLabel.text = eventName
        }
    }
    
    let eventNameLabel: H2 = {
        let label = H2()
        label.numberOfLines = 2
        label.textColor = ColorCodes.textColorGrey
        label.text = "Seepark Mallorca Party 2017 mit langem neuem Namen"
        return label
    }()
    
    let streetLabel: H3 = {
        let label = H3()
        label.text = "Nobelstr. 91,"
        label.textAlignment = .left
        label.textColor = ColorCodes.lightGrayText
        return label
    }()
    
    let dateLabel: H3 = {
        let label = H3()
        label.text = "01/09/2017"
        label.textAlignment = .right
        label.textColor = ColorCodes.lightGrayText
        return label
    }()
    
    let locationLabel: H3 = {
        let label = H3()
        label.text = "Cologne, Germany"
        label.textAlignment = .left
        label.textColor = ColorCodes.lightGrayText
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









