//
//  ShareLinkView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol ShareLinkViewDelegate {
    func didTapFacebook(event: Event)
    func didTapTwitter(event: Event)
    func didTapEmail(event: Event)
    func didTapWhatsapp(event: Event)
    func didTapGetLink(event: Event)
}

class ShareLinkPublicView: CustomUIView {
    
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
    
    lazy var twitterButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Twitter")
        button.addTarget(self, action: #selector(handleTwitter), for: .touchUpInside)
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
        addSubview(twitterButton)
        addSubview(getLinkButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        facebookButton.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        twitterButton.anchor(top: facebookButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        getLinkButton.anchor(top: twitterButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
    }
    
    @objc func handleFacebook() {
        guard let event = event else { return }
        delegate?.didTapFacebook(event: event)
    }
    
    @objc func handleTwitter() {
        guard let event = event else { return }
        delegate?.didTapTwitter(event: event)
    }
    
    @objc func handleGetLink() {
        guard let event = event else { return }
        delegate?.didTapGetLink(event: event)
    }
    
}







