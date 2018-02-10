//
//  PersonalSettingCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 05.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class PersonalSettingCell: BaseCell {
    
    let whiteView = WhiteView()
    var scrollDelegate: ScrollTextFieldDelegate?
    
    let titleLabel: H1 = {
        let label = H1()
        label.textColor = ColorCodes.darkPurple
        label.text = "Personal"
        return label
    }()
    
    let firstnameTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "First Name"
        return tf
    }()
    
    let lastnameTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Last Name"
        return tf
    }()
    
    let birthdayTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Birthday"
        return tf
    }()
    
    let addressTitleLabel: H1 = {
        let label = H1()
        label.text = "Address"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let addressTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Address"
        return tf
    }()
    
    let zipcodeTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Zip Code"
        return tf
    }()
    
    let stateTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "State"
        return tf
    }()
    
    let countryTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Country"
        return tf
    }()
    
    let contactTitleLabel: H1 = {
        let label = H1()
        label.text = "Contact"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let emailTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Email Address"
        return tf
    }()
    
    let phoneTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.placeholder = "Phone Number"
        return tf
    }()
    
    lazy var updateButton: TicketrunnerGreenGradientButton = {
        let button = TicketrunnerGreenGradientButton(title: "Update")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(whiteView)
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        
        whiteView.addSubview(titleLabel)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        
        let personalStackView = setupStackView(subviews: [firstnameTextField, lastnameTextField, birthdayTextField])
        let addressStackView = setupStackView(subviews: [addressTextField, zipcodeTextField, stateTextField, countryTextField])
        let contactStackView = setupStackView(subviews: [emailTextField, phoneTextField])
        
        whiteView.addSubview(personalStackView)
        whiteView.addSubview(addressTitleLabel)
        whiteView.addSubview(addressStackView)
        whiteView.addSubview(contactTitleLabel)
        whiteView.addSubview(contactStackView)
        whiteView.addSubview(updateButton)
        
        personalStackView.anchor(top: titleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 182))
        
        addressTitleLabel.anchor(top: personalStackView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        addressStackView.anchor(top: addressTitleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 248))
        
        contactTitleLabel.anchor(top: addressStackView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        contactStackView.anchor(top: contactTitleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 116))
        
        updateButton.anchor(top: contactStackView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        
        let textFields = [firstnameTextField, lastnameTextField, birthdayTextField, addressTextField, zipcodeTextField, stateTextField, countryTextField, emailTextField, phoneTextField]
        
        textFields.forEach { (tf) in
            allTextFields.append(tf)
            tf.addTarget(self, action: #selector(handleStartedEditing), for: .editingDidBegin)
            tf.addTarget(self, action: #selector(handleStartedEditing), for: .editingDidEnd)
        }
        
    }
    
    var allTextFields = [TicketrunnerTextField]()
    
    private func setupStackView(subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }
    
    @objc func handleStartedEditing(textField: UITextField) {
        allTextFields.forEach { (tf) in
            isEditingTextField(textField: tf)
        }
    }
    
    func isEditingTextField(textField: UITextField) {
        if textField.isEditing {
            textField.layer.borderColor = ColorCodes.darkPurple.cgColor
            scrollDelegate?.didBecomeActive(textField: textField)
        } else {
            textField.layer.borderColor = ColorCodes.inactiveElementsGrey.cgColor
        }
    }
    
}








