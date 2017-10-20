//
//  NewMessagesCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol NewMessagesCellDelegate {
    func didTapOnCell()
}

class NewMessagesCell: TableCell {
    
    var delegate: NewMessagesCellDelegate?
    
    let messageImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Message Icon")
        return iv
    }()
    
    let headlineLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textColor = UIColor.white
        label.text = "You recieved 15 new Messages"
        return label
    }()
    
    let messageLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = .white
        label.text = "Click here, so we can catapult you to your inbox, boss."
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShowMessages)))
        
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
    
    func handleShowMessages() {
        delegate?.didTapOnCell()
    }
    
}











