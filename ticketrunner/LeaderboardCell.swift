//
//  LeaderboardCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum LeaderboardCellType {
    case firstThree
    case normal
    case user
}

class LeaderboardCell: BaseCell {
    
    let placementLabel: UILabel = {
        let label = UILabel()
        label.text = "1."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = ColorCodes.inactiveElementsGrey
        return label
    }()
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "avatar")
        iv.clipsToBounds = true
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Max Gonzales Mustermann"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let reachLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.text = "583"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.text = "27"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        
        backgroundColor = .white
        
        addSubview(placementLabel)
        addSubview(profileImageView)
        
        addSubview(ticketsSoldLabel)
        addSubview(reachLabel)
        
        
        addSubview(usernameLabel)
        
        placementLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 0)
        
        profileImageView.anchor(top: topAnchor, left: placementLabel.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 0, width: 42, height: 0)
        profileImageView.layer.cornerRadius = 42 / 2
        
        
        ticketsSoldLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 4, width: 50, height: 0)
        
        reachLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 4, width: 50, height: 0)
        
        //width dif.
        usernameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: reachLabel.leftAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        
        
    }
    
    func setupCell(cellType: LeaderboardCellType) {
        switch cellType {
        case .normal:
            //do norhing
            break
        case .firstThree:
            backgroundColor = ColorCodes.leaderboardYellow
            placementLabel.textColor = UIColor.white
            placementLabel.font = UIFont.boldSystemFont(ofSize: 22)
            usernameLabel.font = UIFont.boldSystemFont(ofSize: 12)
            reachLabel.font = UIFont.boldSystemFont(ofSize: 14)
            ticketsSoldLabel.font = UIFont.boldSystemFont(ofSize: 14)
            
            usernameLabel.textColor = UIColor.white
            ticketsSoldLabel.textColor = UIColor.white
            reachLabel.textColor = UIColor.white
        case .user:
            placementLabel.font = UIFont.boldSystemFont(ofSize: 22)
            usernameLabel.font = UIFont.boldSystemFont(ofSize: 12)
            reachLabel.font = UIFont.boldSystemFont(ofSize: 14)
            backgroundColor = ColorCodes.ticketrunnerPurple
            ticketsSoldLabel.font = UIFont.boldSystemFont(ofSize: 14)
            
            usernameLabel.textColor = UIColor.white
            ticketsSoldLabel.textColor = UIColor.white
            reachLabel.textColor = UIColor.white
            placementLabel.textColor = UIColor.white
        }
    }
    
}
