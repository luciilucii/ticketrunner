//
//  ShareLinkView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol ShareLinkViewDelegate {
    func didTapFacebook(event: Event)
    func didTapEmail(event: Event)
    func didTapWhatsapp(event: Event)
    func didTapGetLink(event: Event)
}

class ShareLinkView: CustomUIView {
    
    var delegate: ShareLinkViewDelegate?
    
    var event: Event?
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Social Media Share"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let textLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = """
        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var facebookButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Facebook Messenger")
        button.addTarget(self, action: #selector(handleFacebook), for: .touchUpInside)
        return button
    }()
    
    lazy var mailButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "E-mail")
        button.backgroundColor = ColorCodes.homeYellow
        button.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        return button
    }()
    
    lazy var whatsappButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Whatsapp")
        button.addTarget(self, action: #selector(handleWhatsapp), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        setupShadows()
        layer.cornerRadius = 5
        
        setupSubviews()
    }

    fileprivate func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(facebookButton)
        addSubview(mailButton)
        addSubview(whatsappButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
        
        textLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 100)
        
        facebookButton.anchor(top: textLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        mailButton.anchor(top: facebookButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        whatsappButton.anchor(top: mailButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
    }
    
    @objc func handleFacebook() {
        guard let event = event else { return }
        delegate?.didTapFacebook(event: event)
    }
    
    @objc func handleEmail() {
        guard let event = event else { return }
        delegate?.didTapEmail(event: event)
    }
    
    @objc func handleWhatsapp() {
        guard let event = event else { return }
        delegate?.didTapWhatsapp(event: event)
    }
    
}








