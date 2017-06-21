//
//  SettingCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let settingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let settingImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(settingTitleLabel)
        addSubview(settingImageView)
        
        settingTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        settingTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        settingTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        settingImageView.rightAnchor.constraint(equalTo: settingTitleLabel.leftAnchor).isActive = true
        settingImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingImageView.bottomAnchor.constraint(equalTo: settingTitleLabel.bottomAnchor).isActive = true
        settingImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}
