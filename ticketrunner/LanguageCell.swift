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
    
    let languageImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "avatar")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let languageTitleLabel: H2 = {
        let label = H2()
        label.text = "Language"
        label.textAlignment = .left
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(languageImageView)
        addSubview(languageTitleLabel)
        
        languageImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        languageImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        languageTitleLabel.anchor(top: nil, left: languageImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        languageTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
