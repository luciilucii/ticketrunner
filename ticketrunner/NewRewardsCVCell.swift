//
//  NewRewardsCVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewRewardsCVCell: BaseCell {
    
    let rewardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "Icon Merchandise").withRenderingMode(.alwaysTemplate)
        iv.tintColor = ColorCodes.homeYellow
        return iv
    }()
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.text = "Bungee Jump"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "for first 50 tickets sold"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    lazy var promoteButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Redeem")
        button.addTarget(self, action: #selector(handleRedeem), for: .touchUpInside)
        return button
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(rewardImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(promoteButton)
        addSubview(seperatorView)
        
        rewardImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 32, height: 32)
        rewardImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.anchor(top: nil, left: rewardImageView.rightAnchor, bottom: centerYAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 116, width: 0, height: 25)
        
        subtitleLabel.anchor(top: centerYAnchor, left: rewardImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 116, width: 0, height: 25)
        
        promoteButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 40)
        promoteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    @objc func handleRedeem() {
        print("Redeem")
        
    }
    
}











