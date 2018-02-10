//
//  InviteEventOrganizerCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class InviteEventOrganizerCell: BaseCell {
    
    let purpleView = WhiteView()
    
    let titleLabel: H1 = {
        let label = H1()
        label.textColor = .white
        label.text = "Invite your Favorite Event"
        return label
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.textColor = .white
        label.text = "If you have a specific event in mind that you would love to promote, just send them an invitation and ask them to setup a brand ambassador campaign on Ticketrunner. We will take care of the rest."
        label.numberOfLines = 0
        return label
    }()
    
    lazy var inviteButton: TicketrunnerGreenGradientButton = {
        let button = TicketrunnerGreenGradientButton(title: "Invite Event Organizer")
        button.addTarget(self, action: #selector(handleInvite), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        purpleView.backgroundColor = ColorCodes.darkPurple
        
        addSubview(purpleView)
        
        purpleView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        
        purpleView.addSubview(titleLabel)
        purpleView.addSubview(descriptionLabel)
        purpleView.addSubview(inviteButton)
        
        titleLabel.anchor(top: purpleView.topAnchor, left: purpleView.leadingAnchor, bottom: nil, right: purpleView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: purpleView.leadingAnchor, bottom: nil, right: purpleView.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 120))
        
        inviteButton.anchor(top: descriptionLabel.bottomAnchor, left: purpleView.leadingAnchor, bottom: nil, right: purpleView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
    }
    
    @objc func handleInvite() {
        print("invite")
    }
    
}













