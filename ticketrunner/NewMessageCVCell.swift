//
//  NewMessageCVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 24.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewMessageCVCell: BaseCell {
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = ColorCodes.darkPurple.cgColor
        iv.layer.borderWidth = 1
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "profile_avatar")
        return iv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.textAlignment = .left
        label.text = "Finn Adventure Time"
        return label
    }()
    
    let subtitleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Hey Jake, let's sell some tickets and get more text in here so we can see how long it will bee."
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImageView)
        profileImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        profileImageView.layer.cornerRadius = 50/2
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: centerYAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        addSubview(subtitleLabel)
        subtitleLabel.anchor(top: centerYAnchor, left: profileImageView.rightAnchor, bottom: profileImageView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        addSubview(seperatorView)
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        
    }
    
}










