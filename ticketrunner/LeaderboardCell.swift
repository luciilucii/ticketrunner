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
    
    var user: User? {
        didSet {
            
        }
    }
    
    let placementLabel: UILabel = {
        let label = UILabel()
        label.text = "1."
        label.font = UIFont.boldSourceSansPro(ofSize: 20)
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
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.text = "1.7k"
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        
        backgroundColor = .white
        
        addSubview(placementLabel)
        addSubview(profileImageView)
        
        addSubview(ticketsSoldLabel)
        
        
        addSubview(usernameLabel)
        
        placementLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 0)
        
        profileImageView.anchor(top: topAnchor, left: placementLabel.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 0, width: 42, height: 0)
        profileImageView.layer.cornerRadius = 42 / 2
        
        
        ticketsSoldLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 4, width: 50, height: 0)
        
        //width dif.
        usernameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        
        
    }
    
    func setupCell(cellType: LeaderboardCellType) {
        
        let int = 1956
        self.ticketsSoldLabel.text = getPointString(int: int)
        
        switch cellType {
        case .normal:
            //do norhing
            break
        case .firstThree:
            backgroundColor = ColorCodes.leaderboardYellow
            placementLabel.textColor = UIColor.white
            placementLabel.font = UIFont.boldSourceSansPro(ofSize: 22)
            usernameLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            ticketsSoldLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            
            usernameLabel.textColor = UIColor.white
            ticketsSoldLabel.textColor = UIColor.white
        case .user:
            placementLabel.font = UIFont.boldSourceSansPro(ofSize: 22)
            usernameLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            backgroundColor = ColorCodes.ticketrunnerPurple
            ticketsSoldLabel.font = UIFont.boldSourceSansPro(ofSize: 14)
            
            usernameLabel.textColor = UIColor.white
            ticketsSoldLabel.textColor = UIColor.white
            placementLabel.textColor = UIColor.white
        }
    }
    
    func getPointString(int: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale.current
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = "."
        guard var formattedNumber = numberFormatter.string(from: NSNumber(value: int)) else { return "" }
        
        if int > 9999999 {
            formattedNumber.removeLast(8)
            
            return "\(formattedNumber)m"
        } else if int > 999999 {
            formattedNumber.removeLast(6)
            
            return "\(formattedNumber)m"
            
        } else if int > 99999 {
            var string = String(int)
            string.removeLast(3)
            
            return "\(string)k"
        } else if int > 999 {
            formattedNumber.removeLast(2)
            
            return "\(formattedNumber)k"
        } else {
            return String(int)
        }
        
    }
    
}





