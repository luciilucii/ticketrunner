//
//  PersonalShareView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol PersonalShareViewDelegate {
    func didTapShare(event: Event, isPersonal: Bool)
}

class PersonalShareView: CustomUIView {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    var delegate: PersonalShareViewDelegate?
    
    let titleLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "Personal Share")
        return label
    }()
    
    let descriptionLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = """
        The best way to promote an event is by individually telling your friends about it. Send them individual messages and give them more infos on a personalized landing page.
        """
        label.numberOfLines = 5
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let firstnameLabel: H2 = {
        let label = H2()
        label.text = "First Name"
        label.textAlignment = .left
        return label
    }()
    
    let firstNameTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = ""
        return tf
    }()
    
    let lastnameLabel: H2 = {
        let label = H2()
        label.text = "Last Name"
        label.textAlignment = .left
        return label
    }()
    
    let lastnameTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = ""
        return tf
    }()
    
    let personalizedLabel: H2 = {
        let label = H2()
        label.textAlignment = .left
        label.text = "Personalized Landing Page"
        return label
    }()
    
    let switchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.onTintColor = ColorCodes.ticketrunnerGreen
        switchView.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let switchLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Landing Page is currently deactivated. Your friends will be send right to the ticket shop."
        label.numberOfLines = 3
        return label
    }()
    
    lazy var shareButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Share")
        button.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        return button
    }()
    
    let disclaimerLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "I assure to only share this link with people that agreed to receive event recommendations from me."
        label.textColor = ColorCodes.textColorGrey
        label.numberOfLines = 3
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        
        setupCustomViews()
    }
    
    fileprivate func setupCustomViews() {
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(firstnameLabel)
        addSubview(firstNameTextField)
        addSubview(lastnameLabel)
        addSubview(lastnameTextField)
        addSubview(personalizedLabel)
        addSubview(switchController)
        addSubview(switchLabel)
        addSubview(shareButton)
        addSubview(disclaimerLabel)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 70)
        
        firstnameLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        firstNameTextField.anchor(top: firstnameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        lastnameLabel.anchor(top: firstNameTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        lastnameTextField.anchor(top: lastnameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        personalizedLabel.anchor(top: lastnameTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        switchController.anchor(top: personalizedLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 32)
        
        switchLabel.anchor(top: nil, left: switchController.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        switchLabel.centerYAnchor.constraint(equalTo: switchController.centerYAnchor).isActive = true
        
        shareButton.anchor(top: switchLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        disclaimerLabel.anchor(top: shareButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
    }
    
    @objc func handleShare() {
        guard let event = event else { return }
        delegate?.didTapShare(event: event, isPersonal: switchController.isOn)
    }
    
    @objc func switchValueDidChange() {
        
    }
    
}










