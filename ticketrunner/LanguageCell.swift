//
//  LanguageCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 30.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LanguageCell: BaseCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let languageImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "avatar")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.text = "Language"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleContainerView)
        titleContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleContainerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleContainerView.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: titleContainerView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor).isActive = true
        
        containerView.addSubview(languageImageView)
        containerView.addSubview(languageTitleLabel)
        
        languageImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        languageImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        languageImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        languageImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        languageTitleLabel.leftAnchor.constraint(equalTo: languageImageView.rightAnchor, constant: 8).isActive = true
        languageTitleLabel.centerYAnchor.constraint(equalTo: languageImageView.centerYAnchor).isActive = true
        languageTitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        languageTitleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
    }
    
}
