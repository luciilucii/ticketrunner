//
//  EventInvitationCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInvitationCell: TableCell {
    
    //height is
    
    var homeHeader: HomeHeader? {
        didSet {
            setupViewsInCell()
        }
    }
    
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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
    
    let declineButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Decline")
        button.backgroundColor = ColorCodes.ticketrunnerRed
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
        
    }
    
    fileprivate func setupViewsInCell() {
        view.addSubview(eventInvitationLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(eventImageView)
        view.addSubview(eventInfoButton)
        view.addSubview(rewardsButton)
        view.addSubview(declineButton)
        view.addSubview(acceptButton)
        
        eventInvitationLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        subtitleLabel.anchor(top: eventInvitationLabel.bottomAnchor, left: eventInvitationLabel.leftAnchor, bottom: nil, right: eventInvitationLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 44)
        
        guard let homeHeader = homeHeader else { return }
        let imageHeight = (homeHeader.frame.width - 32) / 2.7
        
        eventImageView.anchor(top: subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: imageHeight)
        
        eventInfoButton.anchor(top: eventImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        rewardsButton.anchor(top: eventInfoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        declineButton.anchor(top: rewardsButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.centerXAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 4, width: 0, height: 50)
        
        acceptButton.anchor(top: rewardsButton.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
    }
    
}










