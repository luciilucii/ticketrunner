//
//  NewMessagesCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewMessagesCell: TableCell {
    
    let messageImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Message Icon")
        return iv
    }()
    
    let headlineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.text = "You recieved 15 new Messages"
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "Click here, so we can catapult you to your inbox, boss."
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        view.backgroundColor = ColorCodes.lightPurple
        
        view.addSubview(messageImageView)
        messageImageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        messageImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        view.addSubview(headlineLabel)
        headlineLabel.anchor(top: view.topAnchor, left: messageImageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        view.addSubview(messageLabel)
        messageLabel.anchor(top: headlineLabel.bottomAnchor, left: headlineLabel.leftAnchor, bottom: view.bottomAnchor, right: headlineLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
    }
    
}
