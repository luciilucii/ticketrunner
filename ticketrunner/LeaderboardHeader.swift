//
//  LeaderboardHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LeaderboardHeader: BaseCell {
    
    static let leaderboardHeaderLoadedString = "LeaderboardHeaderLoadedString"
    
    var leaderboardView: UIView? {
        didSet {
            if UserDefaults.standard.bool(forKey: LeaderboardHeader.leaderboardHeaderLoadedString) == true {
                return
            }
            
            setupAllViews()
            UserDefaults.standard.set(true, forKey: LeaderboardHeader.leaderboardHeaderLoadedString)
        }
    }
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Crowd")
        return iv
    }()
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "profile_avatar")
        iv.layer.zPosition = 1
        return iv
    }()
    
    let profileImageBackgroundOne: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.1
        return view
    }()
    
    let profileImageBackgroundTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.1
        return view
    }()
    
    let nameLabel: H1 = {
        let label = H1()
        label.text = """
        Hello Jake!
        1875°
        """
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        return view
    }()
    
    let placementLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Rank"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Name"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.text = "Score"
        label.font = UIFont.sourceSansPro(ofSize: 12)
        return label
    }()
    
    let eventNameLabel: H1 = {
        let label = H1()
        label.text = "Panama Open Air 2018"
        label.textColor = .black
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = ColorCodes.controllerBackground
        
    }
    
    fileprivate func setupAllViews() {
        addSubview(backgroundImageView)
        
        addSubview(backgroundImageView)
        if #available(iOS 11.0, *) {
            backgroundImageView.anchor(top: leaderboardView?.safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -275, paddingRight: 0, width: 0, height: 0)
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //            blurEffectView.alpha = 0.75
            blurEffectView.frame = backgroundImageView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            backgroundImageView.addSubview(blurEffectView)
        } else {
            // Fallback on earlier versions
        }
        
        backgroundImageView.addSubview(profileImageView)
        profileImageView.anchor(top: backgroundImageView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 32, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        profileImageView.layer.cornerRadius = 50
        
        
        backgroundImageView.addSubview(profileImageBackgroundOne)
        profileImageBackgroundOne.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        profileImageBackgroundOne.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        profileImageBackgroundOne.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profileImageBackgroundOne.layer.cornerRadius = 60
        
        backgroundImageView.addSubview(profileImageBackgroundTwo)
        profileImageBackgroundTwo.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        profileImageBackgroundTwo.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        profileImageBackgroundTwo.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profileImageBackgroundTwo.layer.cornerRadius = 70
        
        
        backgroundImageView.addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: backgroundImageView.leftAnchor, bottom: nil, right: backgroundImageView.rightAnchor, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 60)
        
        
        addSubview(whiteView)
        addSubview(placementLabel)
        addSubview(ticketsSoldLabel)
        addSubview(usernameLabel)
        
        whiteView.anchor(top: backgroundImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        whiteView.addSubview(eventNameLabel)
        eventNameLabel.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        placementLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 50, height: 20)
        
        ticketsSoldLabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 4, paddingRight: 4, width: 95, height: 20)
        
        //width dif.
        usernameLabel.anchor(top: nil, left: placementLabel.rightAnchor, bottom: bottomAnchor, right: ticketsSoldLabel.leftAnchor, paddingTop: 0, paddingLeft: 48, paddingBottom: 4, paddingRight: 4, width: 0, height: 20)
    }
    
}





