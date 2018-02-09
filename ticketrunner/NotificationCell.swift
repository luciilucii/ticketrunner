//
//  NotificationCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class NotificationCell: BaseCell {
    
    let iconImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "notificationMessageIcon")
        return iv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.textColor = .black
        label.text = "You just got a new message"
        label.textAlignment = .left
        return label
    }()
    
    let subtitleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Bla bla bla you are awesome!"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        iconImageView.anchor(top: nil, left: leadingAnchor, bottom: nil, right: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 60, height: 60))
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.anchor(top: nil, left: iconImageView.trailingAnchor, bottom: centerYAnchor, right: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 25))
        
        subtitleLabel.anchor(top: centerYAnchor, left: titleLabel.leadingAnchor, bottom: nil, right: titleLabel.trailingAnchor, padding: .zero, size: .init(width: 0, height: 25))
        
        
        
    }
    
}






