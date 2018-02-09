//
//  AFDateCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFDateCell: AFBaseCell {
    
    let dateLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Today"
        label.textColor = .white
        label.backgroundColor = ColorCodes.inactiveElementsGrey
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        addSubview(topTimelineView)
        addSubview(bottomTimelineView)
        
        topTimelineView.anchor(top: topAnchor, left: nil, bottom: centerYAnchor, right: nil, padding: .zero, size: .init(width: 0.5, height: 0))
        topTimelineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bottomTimelineView.anchor(top: centerYAnchor, left: nil, bottom: bottomAnchor, right: nil, padding: .zero, size: .init(width: 0.5, height: 0))
        bottomTimelineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(dateLabel)
        
        dateLabel.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 30))
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dateLabel.layer.cornerRadius = 30/2
        
    }
    
}








