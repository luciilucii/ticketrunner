//
//  MessageHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class MessageHeader: BaseCell {
    
    let messageImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "messageIcon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        
        let attributedText = NSMutableAttributedString(string: "Messages", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: UIColor.black])
//        attributedText.append(NSMutableAttributedString(string: "Events", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        
        label.attributedText = attributedText
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(messageImageView)
        addSubview(titleLabel)
        
        messageImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 150)
        messageImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        titleLabel.anchor(top: messageImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 35)
        
    }
}






