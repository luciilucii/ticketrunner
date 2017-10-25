//
//  HomeNoEventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum HomeControllerMode {
    case day
    case night
}

class HomeNoEventCell: TableCell {
    
    var homeController: HomeTableController?
    var rewardsController: RewardsController?
    
    var homeControllerMode: HomeControllerMode? {
        didSet {
            guard let homeControllerMode = homeControllerMode else { return }
            switch homeControllerMode {
            case .day:
                homeController?.tableView.backgroundColor = ColorCodes.dayModeBlue
                self.backgroundColor = ColorCodes.dayModeBlue
                self.welcomeSubtitleLabel.textColor = ColorCodes.ticketrunnerYellow
                
                setupDayModeViews()
            case .night:
                homeController?.tableView.backgroundColor = ColorCodes.nightModePurple
                self.backgroundColor = ColorCodes.nightModePurple
                self.welcomeSubtitleLabel.textColor = ColorCodes.ticketrunnerBlue
                
                setupNightModeViews()
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
        iv.layer.zPosition = 1
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
    
    let stageImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Festival Stage")
        return iv
    }()
    
    let sunImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Sun")
        return iv
    }()
    
    let cloud1ImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Cloud 1")
        return iv
    }()
    
    let cloud2ImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Cloud 2")
        return iv
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
        
        addSubview(stageImageView)
        
        welcomeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        profileImageView.anchor(top: welcomeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.layer.cornerRadius = 100/2
        
        welcomeSubtitleLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        noEventTitleLabel.anchor(top: welcomeSubtitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        noEventDescriptionLabel.anchor(top: noEventTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 80)
        
        discoverButton.anchor(top: noEventDescriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        stageImageView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
    }
    
    @objc func handlePromote() {
        if homeController != nil {
            homeController?.menu?.showEventController()
        } else if rewardsController != nil {
            rewardsController?.menu.showEventController()
        }
    }
    
    fileprivate func setupNightModeViews() {
        
        
    }
    
    fileprivate func setupDayModeViews() {
        addSubview(sunImageView)
        addSubview(cloud1ImageView)
        addSubview(cloud2ImageView)
        
        sunImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 35, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 55, height: 55)
        
        cloud1ImageView.anchor(top: profileImageView.topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: -30, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        
        cloud2ImageView.anchor(top: profileImageView.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: -45, width: 130, height: 50)
    }
    
}











