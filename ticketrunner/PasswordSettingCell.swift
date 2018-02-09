//
//  PasswordSettingCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class PasswordSettingCell: BaseCell {
    
    let whiteView = WhiteView()
    
    let titleLabel: H1 = {
        let label = H1()
        label.textColor = ColorCodes.darkPurple
        label.text = "Change Password"
        return label
    }()
    
    let oldPasswordLabel: H2 = {
        let label = H2()
        label.text = "Old Password"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let oldPasswordTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Old Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let newPasswordLabel: H2 = {
        let label = H2()
        label.text = "New Password"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let newPasswordTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "New Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let confirmPasswordLabel: H2 = {
        let label = H2()
        label.text = "Confirm Password"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let confirmPasswordTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Confirm Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var updateButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Update")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(whiteView)
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(oldPasswordLabel)
        whiteView.addSubview(oldPasswordTextField)
        whiteView.addSubview(newPasswordLabel)
        whiteView.addSubview(newPasswordTextField)
        whiteView.addSubview(confirmPasswordLabel)
        whiteView.addSubview(confirmPasswordTextField)
        whiteView.addSubview(updateButton)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        oldPasswordLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        oldPasswordTextField.anchor(top: oldPasswordLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        newPasswordLabel.anchor(top: oldPasswordTextField.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        newPasswordTextField.anchor(top: newPasswordLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        confirmPasswordLabel.anchor(top: newPasswordTextField.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        confirmPasswordTextField.anchor(top: confirmPasswordLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        updateButton.anchor(top: confirmPasswordTextField.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        
        
    }
    
}









