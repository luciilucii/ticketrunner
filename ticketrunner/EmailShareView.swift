//
//  EmailShareView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EmailShareView: CustomUIView {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    let recipientLabel: H2 = {
        let label = H2()
        label.text = "Recipient"
        label.textAlignment = .left
        return label
    }()
    
    lazy var pageTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        return tf
    }()
    
    let subjectLabel: H2 = {
        let label = H2()
        label.text = "Subject"
        label.textAlignment = .left
        return label
    }()
    
    lazy var subjectTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        return tf
    }()
    
    let emailLabel: H2 = {
        let label = H2()
        label.text = "Email"
        label.textAlignment = .left
        return label
    }()
    
    let postTextView: TicketrunnerTextView = {
        let tv = TicketrunnerTextView()
        return tv
    }()
    
    lazy var shareButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Share via Email")
        button.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        addSubview(recipientLabel)
        addSubview(pageTextField)
        addSubview(subjectLabel)
        
        addSubview(subjectTextField)
        
        addSubview(emailLabel)
        addSubview(postTextView)
        addSubview(shareButton)
        
        recipientLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pageTextField.anchor(top: recipientLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        subjectLabel.anchor(top: pageTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        subjectTextField.anchor(top: subjectLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        emailLabel.anchor(top: subjectTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        postTextView.anchor(top: emailLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 80)
        
        shareButton.anchor(top: postTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
    }
    
    @objc func handleShare() {
        
    }
    
}
