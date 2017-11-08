//
//  MessagesCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class MessagesCell: TableCell {
    
    var user: User?
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profile_avatar")
        return imageView
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "Susanne"
        label.textAlignment = .left
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Q-Base Festival"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor.white
        
        setupCellViews()
    }
    
    fileprivate func setupCellViews() {
        
        view.addSubview(profileImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)

        profileImageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 32, height: 32)
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        titleLabel.anchor(top: view.topAnchor, left: profileImageView.rightAnchor, bottom: view.centerYAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        subtitleLabel.anchor(top: view.centerYAnchor, left: profileImageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
//        profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
//        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//
//        profileImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
//
    }
    
}
















