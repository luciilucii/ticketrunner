//
//  SubscriptionSettingCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class SubscriptionSettingCell: BaseCell {
    
    let whiteView = WhiteView()
    
    let titleLabel: H1 = {
        let label = H1()
        label.textColor = ColorCodes.darkPurple
        label.text = "Event Subscription"
        return label
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "We want you to stay informed about all events coming up that might interest you and your friends and followers. You can choose your favorite genres and also how far away the event location may be. We'll send you a quick heads up everytime a new event pops up in our backend."
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var updateButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Update")
        
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(whiteView)
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(updateButton)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 130))
        
        updateButton.anchor(top: descriptionLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 250, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
    }
    
}








