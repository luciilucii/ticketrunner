//
//  HomeNoEventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeNoEventCell: BaseCell {
    
    var homeController: HomeController?
    var rewardsController: RewardsController?
    
    var nightMode = true {
        didSet {
            if nightMode == false {
                self.backgroundColor = ColorCodes.dayModeBlue
                self.welcomeSubtitleLabel.textColor = ColorCodes.ticketrunnerYellow
            } else {
                self.backgroundColor = ColorCodes.nightModePurple
                self.welcomeSubtitleLabel.textColor = ColorCodes.ticketrunnerBlue
            }
        }
    }
    
    let welcomeLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "Hi First Name")
        label.textColor = UIColor.white
        return label
    }()
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "profile_avatar")
        return iv
    }()
    
    let welcomeSubtitleLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "So nice to see you!")
        label.textColor = ColorCodes.ticketrunnerBlue
        return label
    }()
    
    let noEventTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Not promoting any events yet"
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    let noEventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Let's quickly change that
        
        Click on the button to discover events and share them with your friends and followers.
        """
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var discoverButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Discover Events")
        button.backgroundColor = ColorCodes.ticketrunnerRed
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.nightModePurple
        
        addSubview(welcomeLabel)
        addSubview(profileImageView)
        addSubview(welcomeSubtitleLabel)
        addSubview(noEventTitleLabel)
        addSubview(noEventDescriptionLabel)
        addSubview(discoverButton)
        
        welcomeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        profileImageView.anchor(top: welcomeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.layer.cornerRadius = 100/2
        
        welcomeSubtitleLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        noEventTitleLabel.anchor(top: welcomeSubtitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        noEventDescriptionLabel.anchor(top: noEventTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 80)
        
        discoverButton.anchor(top: noEventDescriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
    }
    
    func handlePromote() {
        if homeController != nil {
            homeController?.menu?.showEventController()
        } else if rewardsController != nil {
            rewardsController?.menu.showEventController()
        }
    }
    
    
    
}
