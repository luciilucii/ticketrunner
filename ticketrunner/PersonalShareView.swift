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
    
    let landingPageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        return view
    }()
    
    let landingPageProfileImageSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = true
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
//        switchView.addTarget(self, action: #selector(profileSwitchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let landingPageProfileImageLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Show my profile picture"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let customTextLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "Custom Landing Page Message")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customTextSubtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tell everyone what you personally love about the event."
        label.textColor = ColorCodes.textColorGrey
        label.numberOfLines = 2
        return label
    }()
    
    lazy var customMessageTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.sourceSansPro(ofSize: 14)
        textView.backgroundColor = UIColor.white
//        textView.delegate = self
        textView.layer.borderWidth = 1
        textView.layer.borderColor = ColorCodes.lightGrayText.cgColor
        textView.layer.cornerRadius = 5
        textView.textColor = ColorCodes.textColorGrey
        return textView
    }()
    
    let previewLandingPageButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Preview")
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handlePreview), for: .touchUpInside)
        return button
    }()
    
    let updateLandingPageButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Update")
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(handleUpdateLandingPage), for: .touchUpInside)
        return button
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
        
        addSubview(landingPageBackgroundView)
        addSubview(landingPageProfileImageSwitchController)
        addSubview(landingPageProfileImageLabel)
        
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
        
        disclaimerLabel.anchor(top: switchLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        shareButton.anchor(top: disclaimerLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        landingPageProfileImageSwitchController.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        landingPageProfileImageSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        landingPageProfileImageSwitchController.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 16).isActive = true
        landingPageProfileImageSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        landingPageBackgroundView.topAnchor.constraint(equalTo: landingPageProfileImageSwitchController.topAnchor).isActive = true
        landingPageBackgroundView.leftAnchor.constraint(equalTo: landingPageProfileImageSwitchController.leftAnchor).isActive = true
        landingPageBackgroundView.rightAnchor.constraint(equalTo: landingPageProfileImageSwitchController.rightAnchor).isActive = true
        landingPageBackgroundView.bottomAnchor.constraint(equalTo: landingPageProfileImageSwitchController.bottomAnchor, constant: -1).isActive = true
        
        
        landingPageProfileImageLabel.leftAnchor.constraint(equalTo: landingPageProfileImageSwitchController.rightAnchor, constant: 8).isActive = true
        landingPageProfileImageLabel.topAnchor.constraint(equalTo: landingPageProfileImageSwitchController.topAnchor).isActive = true
        landingPageProfileImageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        landingPageProfileImageLabel.bottomAnchor.constraint(equalTo: landingPageProfileImageSwitchController.bottomAnchor).isActive = true
        
        setupCustomTextViews()
    }
    
    func setupCustomTextViews() {
        
        addSubview(customTextLabel)
        addSubview(customTextSubtitleLabel)
        addSubview(customMessageTextView)
        addSubview(previewLandingPageButton)
        addSubview(updateLandingPageButton)
        
        customTextLabel.topAnchor.constraint(equalTo: landingPageProfileImageLabel.bottomAnchor, constant: 24).isActive = true
        customTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        customTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        customTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        customTextSubtitleLabel.topAnchor.constraint(equalTo: customTextLabel.bottomAnchor).isActive = true
        customTextSubtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        customTextSubtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        customTextSubtitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        customMessageTextView.topAnchor.constraint(equalTo: customTextSubtitleLabel.bottomAnchor, constant: 8).isActive = true
        customMessageTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        customMessageTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        customMessageTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        previewLandingPageButton.topAnchor.constraint(equalTo: customMessageTextView.bottomAnchor, constant: 8).isActive = true
        previewLandingPageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        previewLandingPageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        previewLandingPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        updateLandingPageButton.topAnchor.constraint(equalTo: previewLandingPageButton.bottomAnchor, constant: 8).isActive = true
        updateLandingPageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        updateLandingPageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        updateLandingPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func handleShare() {
        guard let event = event else { return }
        delegate?.didTapShare(event: event, isPersonal: switchController.isOn)
    }
    
    @objc func switchValueDidChange() {
        
    }
    
}










