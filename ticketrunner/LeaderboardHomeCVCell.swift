//
//  LeaderboardHomeCVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LeaderboardHomeCVCell: BaseCell {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    var cellType: LeaderboardCellType? {
        didSet {
            guard let type = cellType else { return }
            switch type {
            case .firstThree:
                backgroundColor = ColorCodes.leaderboardYellow
            default:
                backgroundColor = UIColor.white
            }
            
        }
    }

    let eventNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "This is an Event with a loooong title"
        return label
    }()
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "265"
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    let rankImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Rank Up Icon")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.white
        setupCellViews()
    }
    
    func setupCellViews() {
        addSubview(eventNameLabel)
        addSubview(rankLabel)
        addSubview(rankImageView)
        
        eventNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 100, width: 0, height: 0)
        rankLabel.anchor(top: topAnchor, left: nil, bottom: centerYAnchor, right: rankImageView.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -8, paddingRight: 8, width: 50, height: 0)
        rankImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 40, height: 40)
        rankImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
