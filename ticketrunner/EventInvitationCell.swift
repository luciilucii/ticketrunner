//
//  EventInvitationCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInvitationCell: TableCell {
    
    let eventInvitationLabel: H2 = {
        let label = H2()
        label.text = "Event Invitation"
        label.textColor = .white
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "You've been invited to become a Ticketrunner for Event Name"
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "event5")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let eventInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Event Info", for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.tintColor = ColorCodes.textColorGrey
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let rewardsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rewards", for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.tintColor = ColorCodes.textColorGrey
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let declineButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Decline", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        button.backgroundColor = ColorCodes.ticketrunnerRed
        button.layer.cornerRadius = 5
        return button
    }()
    
    let acceptButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Accept")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = ColorCodes.lightPurple
        self.layer.cornerRadius = 5
        
        
        view.addSubview(eventInvitationLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(eventImageView)
        
        eventInvitationLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        subtitleLabel.anchor(top: eventInvitationLabel.bottomAnchor, left: eventInvitationLabel.leftAnchor, bottom: nil, right: eventInvitationLabel.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45)
        
        eventImageView.anchor(top: subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 105)
        
        let stackView = UIStackView(arrangedSubviews: [eventInfoButton, rewardsButton, declineButton, acceptButton])
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        
        view.addSubview(stackView)
        stackView.anchor(top: eventImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 206)
        
        
    }
    
}
