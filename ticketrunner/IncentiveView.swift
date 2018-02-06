//
//  IncentiveView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class IncentiveView: CustomUIView {
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Incentive"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let subtitleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Everyone who buys a ticket through you will recieve"
        return label
    }()
    
    let incentiveImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = #imageLiteral(resourceName: "DonutIncentive")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let incentiveTitleLabel: H2 = {
        let label = H2()
        label.text = "Donuts"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let incentiveDescriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Increadible and delicious donuts with a very cute and creamy mashmallow cover"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 5
        setupShadows()
        
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(incentiveImageView)
        addSubview(incentiveTitleLabel)
        addSubview(incentiveDescriptionLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        incentiveImageView.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 125, height: 125)
        incentiveImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        incentiveTitleLabel.anchor(top: incentiveImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
        
        incentiveDescriptionLabel.anchor(top: incentiveTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
    }
    
}








