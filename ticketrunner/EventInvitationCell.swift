//
//  EventInvitationCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInvitationCell: TableCell {
    
    let eventInvitationLabel: UILabel = {
        let label = UILabel()
        label.text = "Event Invitation"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You've been invited to become a Ticketrunner for Event Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = ColorCodes.textColorGrey
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let rewardsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rewards", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
    
    let acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Accept", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        button.backgroundColor = ColorCodes.ticketrunnerGreen
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.lightPurple
        self.layer.cornerRadius = 5
        
        
        addSubview(eventInvitationLabel)
        addSubview(subtitleLabel)
        addSubview(eventImageView)
        
        eventInvitationLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        subtitleLabel.anchor(top: eventInvitationLabel.bottomAnchor, left: eventInvitationLabel.leftAnchor, bottom: nil, right: eventInvitationLabel.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 45)
        
        eventImageView.anchor(top: subtitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 105)
        
        let stackView = UIStackView(arrangedSubviews: [eventInfoButton, rewardsButton, declineButton, acceptButton])
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        
        addSubview(stackView)
        stackView.anchor(top: eventImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 206)
        
        
    }
    
}
