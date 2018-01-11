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

    let gradientView: UIView = {
        let view = UIView()
        view.applyGradient(colours: [ColorCodes.ticketrunnerRed.cgColor, ColorCodes.gradientPurple.cgColor], locations: [0.0, 1.0])
        view.backgroundColor = ColorCodes.ticketrunnerRed
        return view
    }()
    
    let numberLabel: H1 = {
        let label = H1()
        label.text = "5"
        return label
    }()
    
    let eventNameLabel: H2 = {
        let label = H2()
        label.textAlignment = .left
//        label.numberOfLines = 2
        label.textColor = ColorCodes.textColorGrey
        label.text = "This is an Event with a loooong title"
        return label
    }()
    
    let pointsLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "1.800°"
        label.font = UIFont.sourceSansPro(ofSize: 18)
        label.textAlignment = .right
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let rankImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Rank Up Icon")
        iv.contentMode = .scaleAspectFit
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
        addSubview(gradientView)
        addSubview(numberLabel)
        addSubview(rankImageView)
        addSubview(pointsLabel)
        addSubview(eventNameLabel)
        
        gradientView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 7, height: 0)
        
        numberLabel.anchor(top: topAnchor, left: gradientView.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 0)
        
        rankImageView.anchor(top: nil, left: numberLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        rankImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        pointsLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -8, paddingRight: 8, width: 50, height: 0)
        
        eventNameLabel.anchor(top: topAnchor, left: rankImageView.rightAnchor, bottom: bottomAnchor, right: pointsLabel.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
    }
    
}
