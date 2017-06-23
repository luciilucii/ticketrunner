//
//  SettingsEventSubCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 23.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class SettingsEventSubCell: BaseCell {
    
    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Event Category"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let subSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        return switchView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(categoryTitleLabel)
        addSubview(subSwitchController)
        
        categoryTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        categoryTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryTitleLabel.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        categoryTitleLabel.rightAnchor.constraint(equalTo: subSwitchController.leftAnchor, constant: -8).isActive = true
        
        subSwitchController.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        subSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        subSwitchController.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
