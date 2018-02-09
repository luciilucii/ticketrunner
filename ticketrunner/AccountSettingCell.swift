//
//  AccountSettingCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AccountSettingCell: BaseCell {
    
    let whiteView = WhiteView()
    
    let blueBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.backgroundLightBlue
        return view
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "AccountIcon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        label.textColor = ColorCodes.darkPurple
        label.text = "Do you really want\nto X your Account?"
        label.numberOfLines = 2
        return label
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "You are about to delete all your information and events from Ticketrunner. Once you've checked the box and hit that delete button everything will be gone baby gone - forever!"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let contactLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 2
        
        let attributedString = NSMutableAttributedString(string: "Please ", attributes: [NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText, NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16)])
        
        attributedString.append(NSMutableAttributedString(string: "Contact us", attributes: [NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple, NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 16)]))
        
        attributedString.append(NSMutableAttributedString(string: " if there is anything we can help you with", attributes: [NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText, NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16)]))
        
        label.attributedText = attributedString
        label.textAlignment = .center
        return label
    }()
    
    let stopSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.onTintColor = ColorCodes.ticketrunnerGreen
        return switchView
    }()
    
    let stopDescriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "I want to stop using Ticketrunner and go back to old school promoting"
        return label
    }()
    
    lazy var deleteButton: TicketrunnerRedGradientButton = {
        let button = TicketrunnerRedGradientButton(title: "Delete Account")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(whiteView)
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        whiteView.addSubview(blueBackgroundView)
        blueBackgroundView.addSubview(iconImageView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(contactLabel)
        whiteView.addSubview(stopSwitchController)
        whiteView.addSubview(stopDescriptionLabel)
        whiteView.addSubview(deleteButton)
        
        blueBackgroundView.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 125))
        
        iconImageView.anchor(top: blueBackgroundView.topAnchor, left: nil, bottom: blueBackgroundView.bottomAnchor, right: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 0))
        iconImageView.centerXAnchor.constraint(equalTo: blueBackgroundView.centerXAnchor).isActive = true
        
        
        titleLabel.anchor(top: blueBackgroundView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 100))
        
        contactLabel.anchor(top: descriptionLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        stopSwitchController.anchor(top: contactLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: nil, padding: .init(top: 32, left: 16, bottom: 0, right: 0), size: .init(width: 50, height: 32))

        
        stopDescriptionLabel.anchor(top: nil, left: stopSwitchController.trailingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        stopDescriptionLabel.centerYAnchor.constraint(equalTo: stopSwitchController.centerYAnchor).isActive = true
        
        deleteButton.anchor(top: stopSwitchController.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        
    }
    
}







