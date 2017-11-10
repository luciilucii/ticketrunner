//
//  ShareLinkPersonalView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ShareLinkPersonalView: CustomUIView {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    var controller: ShareLinkController?
    
    var delegate: ShareLinkViewDelegate?
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Choose the channel where you want to share it"
        label.textAlignment = .center
        return label
    }()
    
    lazy var facebookButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Facebook")
        button.addTarget(self, action: #selector(handleFacebook), for: .touchUpInside)
        return button
    }()
    
    lazy var whatsappButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Whatsapp")
        button.addTarget(self, action: #selector(handleWhatsapp), for: .touchUpInside)
        return button
    }()
    
    lazy var emailButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Email")
        button.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        return button
    }()
    
    lazy var getLinkButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Get Link")
        button.addTarget(self, action: #selector(handleGetLink), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(facebookButton)
        addSubview(whatsappButton)
        addSubview(emailButton)
        addSubview(getLinkButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        facebookButton.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        whatsappButton.anchor(top: facebookButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        emailButton.anchor(top: whatsappButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        getLinkButton.anchor(top: emailButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
    }
    
    @objc func handleFacebook() {
        guard let event = event else { return }
        delegate?.didTapFacebook(event: event)
    }
    
    @objc func handleWhatsapp() {
        guard let event = event else { return }
        delegate?.didTapWhatsapp(event: event)
    }
    
    @objc func handleEmail() {
        guard let event = event else { return }
        delegate?.didTapEmail(event: event)
    }
    
    @objc func handleGetLink() {
        guard let event = event else { return }
        delegate?.didTapGetLink(event: event)
    }
    
}







